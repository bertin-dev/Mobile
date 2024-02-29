import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/widgets/input_field_widget.dart';
import 'package:secure_app/widgets/primary_button.dart';

class ValidateCodeScreen extends StatelessWidget {
  const ValidateCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        elevation: 0.0,
        leading: const Icon(FontAwesomeIcons.arrowLeft),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 22.0, right: 22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verification Numéro",
                  style: AppStyles.textStyle(
                      color: AppColors.dark,
                      size: 20.0,
                      weight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13.0, bottom: 2.0),
                  child: Text(
                    "confirmez votre Numero de telephone",
                    style: AppStyles.textStyle(
                        color: AppColors.dark,
                        size: 12.0,
                        weight: FontWeight.w400),
                  ),
                ),
                InputField(
                  labelText: "",
                  hasIcon: false,
                  isElevated: false,
                  hasShadow: false,
                  hasSuffix: false,
                  contentPadding: 16.0,
                  // isPhoneNumber: true,
                  icon: FontAwesomeIcons.a,
                  keyboardType: TextInputType.number,
                  iconColor: AppColors.dark,
                  value: "",
                  onChanged: (String value) {},
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0, bottom: 2.0),
                  child: Text(
                    "un code a été envoyé sur votre numéro, entrez le pour vous verifier",
                    style: AppStyles.textStyle(
                        color: AppColors.dark,
                        size: 10.0,
                        weight: FontWeight.w400),
                  ),
                ),
                Text(
                  "Renvoyez le code",
                  style: AppStyles.textStyle(
                      color: AppColors.primary,
                      size: 10.0,
                      weight: FontWeight.w400),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: PrimaryButton(
                textButton: "valider",
                buttonColor: AppColors.dark,
                hasIcon: false,
                circleIconColor: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
