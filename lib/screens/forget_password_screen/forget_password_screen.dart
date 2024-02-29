import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/models/user_model.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/forget_password_screen/enter_infos_screen.dart';
import 'package:secure_app/screens/forget_password_screen/enter_new_password_screen.dart';
import 'package:secure_app/screens/forget_password_screen/otp_verification_screen.dart';
import 'package:secure_app/screens/login_screen/login_screen.dart';
import 'package:secure_app/widgets/primary_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final FormController _formController = Get.put(FormController());

  final UserController _userController = Get.put(UserController());

  @override
  void dispose() {
    _userController.resetLoginData();
    _formController.resetFormErrors();
    print("skdhsj");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return KeyboardVisibility(
        onChanged: (bool isVisible) {
          _formController.isKeyboardVisible(isVisible);
        },
        child: Scaffold(
          backgroundColor: AppColors.dark,
          body: SingleChildScrollView(
            child: SizedBox(
              height: Constants.screenHeight(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0, left: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            _formController.isObscurePass(true);
                            _formController.isObscureCPass(true);
                            _userController.resetLoginData();
                            _formController.resetFormErrors();
                            Get.back();
                          },
                          child: const Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: AppColors.white,
                            // size: 25.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: SvgPicture.asset(
                          Assets.images.forgetPassBg,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _formController.otpScreenPageIndex.value == 0
                            ? EnterInfosScreen()
                            : _formController.otpScreenPageIndex.value == 1
                                ? OTPVerificationScreen()
                                : EnterNewPasswordScreen(),
                        !_formController.isKeyboardVisible.value
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 39.0, bottom: 33.0),
                                child: GestureDetector(
                                  onTap: () async {
                                    print(_formController
                                        .otpScreenPageIndex.value);
                                    if (_formController
                                            .otpScreenPageIndex.value ==
                                        0) {
                                      _formController.fieldVerification(
                                        field: _userController.name.value,
                                        isName: true,
                                        errorCallback: (String error) =>
                                            _formController
                                                .hasErrorOnName(error),
                                      );
                                      _formController.fieldVerification(
                                        field: _userController.phone.value,
                                        isPhoneNumber: true,
                                        errorCallback: (String error) =>
                                            _formController
                                                .hasErrorOnPhone(error),
                                      );
                                      if (_formController
                                              .hasErrorOnName.isEmpty &&
                                          _formController
                                              .hasErrorOnPhone.isEmpty) {
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
                                          name: _userController.name.trim(),
                                          phone: _userController.phone.trim(),
                                        );
                                        await _userController
                                            .forgetPassword(newUser);
                                        Get.back();
                                        if (_userController.err.isNotEmpty) {
                                          Constants.snackBar(
                                              bgColor: AppColors.red,
                                              textColor: AppColors.white,
                                              description:
                                                  _userController.err.value);
                                        } else {
                                          _formController.otpScreenPageIndex(1);
                                          _formController
                                              .isAskNewCodeVisible(false);
                                          // _userController.resetLoginData();
                                        }
                                      }
                                    } else if (_formController
                                            .otpScreenPageIndex.value ==
                                        1) {
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

                                        await _userController.verifyOtp({
                                          "phone": _userController.phone.value,
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
                                          _formController.otpScreenPageIndex(2);
                                        }
                                      }
                                    } else {
                                      _formController.fieldVerification(
                                        field: _userController.password.value,
                                        isPass: true,
                                        errorCallback: (String error) =>
                                            _formController
                                                .hasErrorOnPassword(error),
                                      );
                                      _formController.fieldVerification(
                                        field: _userController.cPassword.value,
                                        isCpass: true,
                                        pass: _userController.password.value,
                                        errorCallback: (String error) =>
                                            _formController
                                                .hasErrorOnCPassword(error),
                                      );
                                      if (_formController
                                              .hasErrorOnPassword.isEmpty &&
                                          _formController
                                              .hasErrorOnCPassword.isEmpty) {
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
                                          phone: _userController.phone.trim(),
                                          password:
                                              _userController.password.trim(),
                                          passwordConfirm:
                                              _userController.cPassword.trim(),
                                        );
                                        await _userController
                                            .resetPassword(newUser);
                                        Get.back();
                                        if (_userController.err.isNotEmpty) {
                                          Constants.snackBar(
                                              bgColor: AppColors.red,
                                              textColor: AppColors.white,
                                              description:
                                                  _userController.err.value);
                                        } else {
                                          _formController.isObscurePass(true);
                                          _formController.isObscureCPass(true);
                                          Get.to(() => LoginScreen());
                                          _userController.resetLoginData();
                                          _formController.resetFormErrors();

                                          Constants.snackBar(
                                              bgColor: AppColors.primary,
                                              textColor: AppColors.white,
                                              description:
                                                  "Mot de passe réinitialisé");
                                          // Get.rawSnackbar(
                                          //     backgroundColor:
                                          //         AppColors.primary,
                                          //     borderRadius: 10.0,
                                          //     // colorText: AppColors.white,
                                          //     snackPosition:
                                          //         SnackPosition.BOTTOM,
                                          //     margin: const EdgeInsets.only(
                                          //         bottom: 40.0,
                                          //         left: 22.0,
                                          //         right: 22.0),
                                          //     messageText: Center(
                                          //       child: Text(
                                          //         'Mot de passe réinitialisé',
                                          //         style: AppStyles.textStyle(
                                          //           color: Colors.white,
                                          //           size: 12,
                                          //           weight: FontWeight.w400,
                                          //         ),
                                          //       ),
                                          //     ),
                                          //     padding: const EdgeInsets.symmetric(
                                          //         vertical: 10.0));
                                        }
                                      }
                                    }
                                  },
                                  child: PrimaryButton(
                                    textButton: _formController
                                                .otpScreenPageIndex.value ==
                                            2
                                        ? "Valider"
                                        : "suivant",
                                    buttonColor: AppColors.primary,
                                    iconColor: AppColors.primary,
                                    hasIcon: true,
                                    circleIconColor: AppColors.white,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        _formController.isKeyboardVisible.value
                            ? const SizedBox(height: 30.0)
                            : Container()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
