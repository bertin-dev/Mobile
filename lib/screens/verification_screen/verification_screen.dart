import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/widgets/input_field_widget.dart';
import 'package:secure_app/widgets/input_label.dart';
import 'package:secure_app/widgets/primary_button.dart';

class VerificationNumberScreen extends StatelessWidget {
  const VerificationNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // appBar: AppBar(
      //   backgroundColor: AppColors.white,
      //   surfaceTintColor: AppColors.white,
      //   elevation: 0.0,
      //   leading: const Icon(FontAwesomeIcons.arrowLeft),
      // ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SvgPicture.asset(
              Assets.images.backgroundW,
              fit: BoxFit.cover,
            ),
          ),
          const SafeArea(
              child: Padding(
            padding: EdgeInsets.only(top: 30.0, left: 22.0),
            child: Icon(FontAwesomeIcons.arrowLeft, size: 27.0),
          )),
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 80.0, left: 22.0, right: 22.0),
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
                      InputLabel(
                          label: "confirmez votre Numero de telephone",
                          paddingTop: 13.0),
                      InputField(
                        labelText: "",
                        hasIcon: false,
                        isElevated: false,
                        hasShadow: false,
                        hasSuffix: true,
                        contentPadding: 16.0,
                        // isPhoneNumber: true,
                        suffixIcon: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(FontAwesomeIcons.eye),
                            SizedBox(width: 18.0),
                            Icon(FontAwesomeIcons.eye),
                          ],
                        ),
                        icon: FontAwesomeIcons.a,
                        keyboardType: TextInputType.visiblePassword,
                        iconColor: AppColors.dark,
                        value: "",
                        onChanged: (String value) {},
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: PrimaryButton(
                      textButton: "continuer",
                      buttonColor: AppColors.dark,
                      hasIcon: false,
                      circleIconColor: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
