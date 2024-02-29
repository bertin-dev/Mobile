import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/widgets/input_label.dart';

class IdentityVerificationStep extends StatelessWidget {
  IdentityVerificationStep({super.key});
  final FormController _formController = Get.put(FormController());

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
                    'Verification Numéro',
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
              "un code a été envoyé sur votre numéro, entrez le pour vous vérifier ",
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
              // setState(() {
              //   enteredPin = value;
              // });
            },
            // onCompleted: (pin) async {
            //   await verifyOtp();
            //   // FocusScope.of(context).requestFocus(FocusNode());
            //   // GlobalFunctions.showDialogAlertDialog(
            //   //     context: context);
            //   if (kDebugMode) {
            //     print("Completed: " + pin);
            //   }
            // },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Renvoyez le code',
                  style: AppStyles.textStyle(
                    color: AppColors.primary,
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
  }
}
