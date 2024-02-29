import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/models/user_model.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/forget_password_screen/forget_password_screen.dart';
import 'package:secure_app/screens/main_screen/main_screen.dart';
import 'package:secure_app/screens/register_screen/register_screen.dart';
import 'package:secure_app/widgets/input_label.dart';
import 'package:secure_app/screens/register_screen/components/terms_component.dart';
import 'package:secure_app/widgets/input_field_widget.dart';
import 'package:secure_app/widgets/primary_button.dart';
import 'package:secure_app/widgets/timer_widget.dart';

class MailOtpVerificationStep extends StatelessWidget {
  MailOtpVerificationStep({super.key});
  final FormController _formController = Get.put(FormController());
  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _formController.showTitleOnVerificationScreens.value
            ? Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: SizedBox(
                  width: 332,
                  child: Text(
                    'Verification Mail',
                    style: AppStyles.textStyle(
                      color: const Color(0xFF0F0F0F),
                      size: 20,
                      weight: FontWeight.w600,
                      // height: 0.09,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        InputLabel(
          label:
              "un code a été envoyé sur votre adresse mail, entrez le pour vous vérifier :",
          paddingTop: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: OTPTextField(
            otpFieldStyle: OtpFieldStyle(
                disabledBorderColor: AppColors.otpFieldBg,
                focusBorderColor: AppColors.otpFieldBg,
                enabledBorderColor: AppColors.otpFieldBg,
                borderColor: AppColors.otpFieldBg,
                backgroundColor: AppColors.otpFieldBg),
            outlineBorderRadius: 8.0,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 35.0, horizontal: 0.0),
            length: 5,
            width: Constants.screenWidth(context),
            fieldWidth: Constants.screenWidth(context) / 5.7,
            style: AppStyles.textPoppinsStyle(
              color: AppColors.white,
              size: 19.0,
            ),
            textFieldAlignment: MainAxisAlignment.spaceBetween,
            fieldStyle: FieldStyle.box,
            onChanged: (String value) {
              _userController.otpCode(value);
              //   setState(() {
              //     enteredPin = value;
              //   });
            },
            // onCompleted: (pin) async {
            //   FocusScope.of(context).requestFocus(FocusNode());
            //   showDialog(
            //     context: context,
            //     barrierDismissible: false,
            //     builder: (context) {
            //       return Container(
            //         color: Colors.transparent,
            //         child: const Center(
            //           child: CircularProgressIndicator(
            //             color: Colors.white,
            //           ),
            //         ),
            //       );
            //     },
            //   );
            //   // otpCode = pin;
            //   await _userController.verifyEmail({
            //     "email": _userController.email.value,
            //     // "otp": _userController.otpCode.value,
            //   });
            //   Get.back();
            //   if (_userController.err.isNotEmpty) {
            //     Constants.snackBar(
            //         bgColor: AppColors.red,
            //         textColor: AppColors.white,
            //         description: _userController.err.value);
            //   } else {
            //     _userController.resetLoginData();
            //     _formController.otpScreenPageIndex(2);
            //   }
            // },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                return Container(
                  // padding: const EdgeInsets.only(top: 32.0),
                  // width: Constants.screenWidth(context) / 1.3,
                  child: TimerWidget(
                    key: UniqueKey(),
                    onEnd: () {
                      _formController.isAskNewCodeVisible(true);
                    },
                    // restartTimer: () {},
                    duration: _formController.resetPasswordTimerDuration.value,
                    label: "Demander un nouveau code dans ",
                    // label: "Vous n'avez pas reçu le code, envoyez-le à nouveau",
                  ),
                );
              }),
              GestureDetector(
                onTap: _formController.isAskNewCodeVisible.value
                    ? () async {
                        _formController.resetPasswordTimerDuration(0);
                        FocusScope.of(context).requestFocus(FocusNode());
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return Container(
                              color: Colors.transparent,
                              child: LoadingAnimationWidget.inkDrop(
                                color: AppColors.primary,
                                size: 50,
                              ),
                            );
                            // Container(
                            //   color: Colors.transparent,
                            //   child: const Center(
                            //     child: CircularProgressIndicator(
                            //       color: Colors.white,
                            //     ),
                            //   ),
                            // );
                          },
                        );
                        final UserModel newUser = UserModel(
                          email: localUser.email != null &&
                                  localUser.email!.isNotEmpty
                              ? localUser.email!
                              : _userController.email.trim(),
                        );
                        await _userController.createAndSendOtp(newUser, false);
                        Get.back();
                        if (_userController.err.isNotEmpty) {
                          Constants.snackBar(
                              bgColor: AppColors.red,
                              textColor: AppColors.white,
                              description: _userController.err.value);
                        } else {
                          _formController.restartTimer();
                          Get.rawSnackbar(
                              backgroundColor: AppColors.dark,
                              borderRadius: 10.0,
                              // colorText: AppColors.white,
                              snackPosition: SnackPosition.BOTTOM,
                              margin: const EdgeInsets.only(
                                  bottom: 40.0, left: 22.0, right: 22.0),
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
                                  const EdgeInsets.symmetric(vertical: 10.0));
                        }
                      }
                    : null,
                child: Obx(() {
                  return Text(
                    'Renvoyez le code',
                    style: AppStyles.textStyle(
                      color: _formController.isAskNewCodeVisible.value
                          ? AppColors.primary
                          : AppColors.grey.withOpacity(0.5),
                      size: 12,
                      weight: FontWeight.w400,
                    ),
                  );
                }),
              ),
            ],
          ),
        )
      ],
    );
  }
}
