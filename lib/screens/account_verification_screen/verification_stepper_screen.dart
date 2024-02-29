import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/models/user_model.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/account_verification_screen/account_verification_description_screen.dart';
import 'package:secure_app/screens/account_verification_screen/mail_otp_verification_step.dart';
import 'package:secure_app/screens/account_verification_screen/mail_verification_step.dart';
import 'package:secure_app/screens/account_verification_screen/phone_otp_verification_step.dart';
import 'package:secure_app/screens/account_verification_screen/phone_verification_screen.dart';
import 'package:secure_app/widgets/primary_button.dart';

class VerificationStepperScreen extends StatelessWidget {
  VerificationStepperScreen({super.key});
  final FormController _formController = Get.put(FormController());
  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return KeyboardVisibility(
        onChanged: (bool isVisible) {
          _formController.isKeyboardVisible(isVisible);
        },
        child: Scaffold(
          backgroundColor: AppColors.white,
          // appBar: AppBar(
          //   backgroundColor: AppColors.white,
          //   surfaceTintColor: AppColors.white,
          //   elevation: 0.0,
          //   leading: Icon(FontAwesomeIcons.arrowLeft),
          //   actions: [Image.asset(Assets.images.appName.path)],
          // ),
          body: Stack(
            children: [
              // Container(
              //     height: Constants.screenHeight(context),
              //     width: Constants.screenWidth(context),
              //     color: AppColors.bgColor,
              //     child: SvgPicture.asset(
              //       Assets.images.chatBg,
              //       fit: BoxFit.cover,
              //     )),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 22.0, right: 22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: GestureDetector(
                          onTap: () {
                            _formController.isObscurePass(true);
                            _formController.isObscureCPass(true);
                            Get.back();
                          },
                          child: const Icon(
                            FontAwesomeIcons.arrowLeft,
                            // size: 25.0,
                          ),
                        ),
                      ),
                      _formController.isPhoneVerification.value &&
                              !_formController.isPhoneOtpVerification.value
                          ? PhoneVerificationStep()
                          : _formController.isPhoneVerification.value &&
                                  _formController.isPhoneOtpVerification.value
                              ? PhoneOtpVerificationStep()
                              : !_formController.isPhoneVerification.value &&
                                      !_formController
                                          .isPhoneOtpVerification.value &&
                                      !_formController.isOtpVerification.value
                                  ? MailVerificationStep()
                                  : MailOtpVerificationStep()
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        !_formController.isKeyboardVisible.value
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 39.0, bottom: 19.0),
                                child: GestureDetector(
                                  onTap: () async {
                                    String phone = "";
                                    String email = "";
                                    if (_userController.phone.value.isEmpty &&
                                        (localUser.phone != null &&
                                            localUser.phone!.isNotEmpty)) {
                                      phone = localUser.phone!;
                                      _userController.phone.value = phone;
                                    } else {
                                      phone = _userController.phone.value;
                                    }

                                    if (_userController.email.value.isEmpty &&
                                        (localUser.email != null &&
                                            localUser.email!.isNotEmpty)) {
                                      email = localUser.email!;
                                    } else {
                                      email = _userController.email.value;
                                    }

                                    if (_formController
                                            .isPhoneVerification.value &&
                                        !_formController
                                            .isPhoneOtpVerification.value) {
                                      _formController.fieldVerification(
                                        field: phone,
                                        isName: true,
                                        errorCallback: (String error) =>
                                            _formController
                                                .hasErrorOnPhone(error),
                                      );
                                      if (_formController
                                          .hasErrorOnPhone.value.isEmpty) {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) {
                                            return Container(
                                              color: Colors.transparent,
                                              child: LoadingAnimationWidget
                                                  .inkDrop(
                                                color: AppColors.primary,
                                                size: 50,
                                              ),
                                            );
                                          },
                                        );
                                        final UserModel newUser = UserModel(
                                          phone: phone.trim(),
                                        );
                                        await _userController.createAndSendOtp(
                                            newUser, true);
                                        Get.back();
                                        if (_userController.err.isNotEmpty) {
                                          Constants.snackBar(
                                              bgColor: AppColors.red,
                                              textColor: AppColors.white,
                                              description:
                                                  _userController.err.value);
                                        } else {
                                          _formController
                                              .isAskNewCodeVisible(false);
                                          _formController
                                              .isPhoneOtpVerification(true);
                                          Get.rawSnackbar(
                                              backgroundColor: AppColors.dark,
                                              borderRadius: 10.0,
                                              // colorText: AppColors.white,
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              margin: const EdgeInsets.only(
                                                  bottom: 40.0,
                                                  left: 22.0,
                                                  right: 22.0),
                                              messageText: Center(
                                                child: Text(
                                                  'Un code vous a été envoyé',
                                                  style: AppStyles.textStyle(
                                                    color: Colors.white,
                                                    size: 12,
                                                    weight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0));
                                        }
                                      }
                                    } else if (_formController
                                            .isPhoneVerification.value &&
                                        _formController
                                            .isPhoneOtpVerification.value) {
                                      if (_userController
                                              .otpCode.value.length >=
                                          5) {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) {
                                            return Container(
                                              color: Colors.transparent,
                                              child: LoadingAnimationWidget
                                                  .inkDrop(
                                                color: AppColors.primary,
                                                size: 50,
                                              ),
                                            );
                                          },
                                        );

                                        await _userController.verifyPhone({
                                          "phone": phone,
                                          // "otp": _userController.otpCode.value,
                                        });
                                        Get.back();
                                        if (_userController.err.isNotEmpty) {
                                          Constants.snackBar(
                                              bgColor: AppColors.red,
                                              textColor: AppColors.white,
                                              description:
                                                  _userController.err.value);
                                        } else {
                                          _userController.resetLoginData();
                                          _formController.resetFormErrors();
                                          Get.off(() =>
                                              AccountVerificationScreen());
                                          _formController.isPhoneVerified(true);
                                        }
                                      }
                                    } else if (!_formController
                                            .isPhoneVerification.value &&
                                        !_formController
                                            .isPhoneOtpVerification.value &&
                                        !_formController
                                            .isOtpVerification.value) {
                                      _formController.fieldVerification(
                                        field: email,
                                        isEmail: true,
                                        errorCallback: (String error) =>
                                            _formController
                                                .hasErrorOnMail(error),
                                      );
                                      if (_formController
                                          .hasErrorOnPhone.value.isEmpty) {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) {
                                            return Container(
                                              color: Colors.transparent,
                                              child: LoadingAnimationWidget
                                                  .inkDrop(
                                                color: AppColors.primary,
                                                size: 50,
                                              ),
                                            );
                                          },
                                        );
                                        final UserModel newUser = UserModel(
                                          email: email.trim(),
                                        );
                                        await _userController.createAndSendOtp(
                                            newUser, false);
                                        Get.back();
                                        if (_userController.err.isNotEmpty) {
                                          Constants.snackBar(
                                              bgColor: AppColors.red,
                                              textColor: AppColors.white,
                                              description:
                                                  _userController.err.value);
                                        } else {
                                          _formController
                                              .isAskNewCodeVisible(false);
                                          _formController
                                              .isOtpVerification(true);
                                          Get.rawSnackbar(
                                              backgroundColor: AppColors.dark,
                                              borderRadius: 10.0,
                                              // colorText: AppColors.white,
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              margin: const EdgeInsets.only(
                                                  bottom: 40.0,
                                                  left: 22.0,
                                                  right: 22.0),
                                              messageText: Center(
                                                child: Text(
                                                  'Un code vous a été envoyé',
                                                  style: AppStyles.textStyle(
                                                    color: Colors.white,
                                                    size: 12,
                                                    weight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0));
                                        }
                                      }
                                      // Get.rawSnackbar(
                                      //     backgroundColor: AppColors.dark,
                                      //     borderRadius: 10.0,
                                      //     // colorText: AppColors.white,
                                      //     snackPosition: SnackPosition.BOTTOM,
                                      //     margin: const EdgeInsets.only(
                                      //         bottom: 40.0,
                                      //         left: 22.0,
                                      //         right: 22.0),
                                      //     messageText: Center(
                                      //       child: Text(
                                      //         'Un code vous a été envoyé',
                                      //         style: AppStyles.textStyle(
                                      //           color: Colors.white,
                                      //           size: 12,
                                      //           weight: FontWeight.w400,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     padding: EdgeInsets.symmetric(
                                      //         vertical: 10.0));
                                    } else if (!_formController
                                            .isPhoneVerification.value &&
                                        !_formController
                                            .isPhoneOtpVerification.value &&
                                        _formController
                                            .isOtpVerification.value) {
                                      if (_userController
                                              .otpCode.value.length >=
                                          5) {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) {
                                            return Container(
                                              color: Colors.transparent,
                                              child: LoadingAnimationWidget
                                                  .inkDrop(
                                                color: AppColors.primary,
                                                size: 50,
                                              ),
                                            );
                                          },
                                        );

                                        await _userController.verifyEmail({
                                          "email": email,
                                          // "otp": _userController.otpCode.value,
                                        });
                                        Get.back();
                                        if (_userController.err.isNotEmpty) {
                                          Constants.snackBar(
                                              bgColor: AppColors.red,
                                              textColor: AppColors.white,
                                              description:
                                                  _userController.err.value);
                                        } else {
                                          _formController.isMailverified(true);
                                          _userController.resetLoginData();
                                          _formController.resetFormErrors();
                                          Get.off(() =>
                                              AccountVerificationScreen());
                                        }
                                      }
                                    }
                                    print(_formController
                                        .isPhoneVerification.value);
                                    print(_formController
                                        .isOtpVerification.value);
                                    print(_formController
                                        .isPhoneOtpVerification.value);
                                    // Get.to(MainScreen());
                                  },
                                  child: PrimaryButton(
                                    textButton:
                                        _formController.isOtpVerification.value
                                            ? "valider"
                                            : "continuer",
                                    buttonColor: AppColors.dark,
                                    hasIcon: false,
                                    circleIconColor: AppColors.white,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
