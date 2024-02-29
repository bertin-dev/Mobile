import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/models/user_model.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/widgets/timer_widget.dart';

class OTPVerificationScreen extends StatefulWidget {
  OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final FormController _formController = Get.put(FormController());

  final UserController _userController = Get.put(UserController());

  String otpCode = "";

  // void restartTimer() {
  //   _formController.resetPasswordTimerDuration(300);
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Vérification OTP',
            style: AppStyles.textStyle(
              color: Colors.white,
              size: 25,
              weight: FontWeight.w700,
              // height: 0.9,
            ),
          ),
          Text(
            'un cocde a été envoyé sur votre numéro, entrez le pour vous verifier',
            style: AppStyles.textStyle(
              color: Colors.white,
              size: 12,
              weight: FontWeight.w400,
              // height: 0.9,
            ),
          ),
          const SizedBox(height: 33.0),
          OTPTextField(
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
            //   otpCode = pin;
            //   await _userController.verifyOtp({
            //     "phone": _userController.phone.value,
            //     "otp": _userController.otpCode.value,
            //   });
            //   Get.back();
            //   if (_userController.err.isNotEmpty) {
            //     Constants.snackBar(
            //         bgColor: AppColors.red,
            //         textColor: AppColors.white,
            //         description: _userController.err.value);
            //   } else {
            //     _formController.otpScreenPageIndex(2);
            //   }
            // },
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
                      // onEnd: () {
                      //   _formController.isAskNewCodeVisible(true);
                      // },
                      // restartTimer: () {},
                      duration:
                          _formController.resetPasswordTimerDuration.value,
                      label: "Demander un nouveau code dans ",
                      // label: "Vous n'avez pas reçu le code, envoyez-le à nouveau",
                    ),
                  );
                }),
                GestureDetector(
                  onTap: _formController.isAskNewCodeVisible.value
                      ? () async {
                          _formController.resetPasswordTimerDuration(0);
                          // print(
                          //     _formController.resetPasswordTimerDuration.value);
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
                            },
                          );

                          final UserModel newUser = UserModel(
                            name: _userController.name.trim(),
                            phone: _userController.phone.trim(),
                          );
                          await _userController.forgetPassword(newUser);
                          Get.back();
                          if (_userController.err.isNotEmpty) {
                            Constants.snackBar(
                                bgColor: AppColors.red,
                                textColor: AppColors.white,
                                description: _userController.err.value);
                          } else {
                            _formController.restartTimer();
                            _formController.otpScreenPageIndex(1);
                            _formController.isAskNewCodeVisible(false);
                            // _userController.resetLoginData();
                          }
                        }
                      : null,
                  child: Text(
                    'Renvoyez le code',
                    style: AppStyles.textStyle(
                      color: _formController.isAskNewCodeVisible.value
                          ? AppColors.primary
                          : AppColors.grey.withOpacity(0.5),
                      size: 12,
                      weight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
