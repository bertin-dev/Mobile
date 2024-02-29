import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/main_screen/main_screen.dart';
import 'package:secure_app/screens/rechage_account_screen/recharge_account_screen.dart';
import 'package:secure_app/widgets/primary_button.dart';

class IdentityVerificationSuccessScreen extends StatelessWidget {
  IdentityVerificationSuccessScreen({super.key});
  final FormController _formController = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          SvgPicture.asset(
            Assets.images.background,
            fit: BoxFit.cover,
            color: AppColors.white,
          ),
          SizedBox(
            height: Constants.screenHeight(context),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(),
                  Column(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.certifyWhite,
                      ),
                      const SizedBox(height: 45.0),
                      SizedBox(
                        width: 276,
                        child: Text(
                          'Vous etes vérifiés !!',
                          textAlign: TextAlign.center,
                          style: AppStyles.textPoppinsStyle(
                            color: AppColors.white,
                            size: 30,
                            weight: FontWeight.w500,
                            height: 0.9,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        width: 236,
                        height: 45,
                        child: Text(
                          'vous pouvez desormais effectuer vos transactions et créer votre carte virtuelle',
                          textAlign: TextAlign.center,
                          style: AppStyles.textStyle(
                            color: Colors.white,
                            size: 12,
                            weight: FontWeight.w300,
                            height: 0.9,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 22.0, right: 22.0, bottom: 30.0),
                    child: GestureDetector(
                      onTap: () {
                        // _formController.isAccountVerified(true); //TODO: uncomment this
                        Get.off(const MainScreen());
                        // Get.to(RechargeAccountScreen());
                      },
                      child: const PrimaryButton(
                        textButton: "continuer",
                        buttonColor: AppColors.dark,
                        hasIcon: true,
                        circleIconColor: AppColors.white,
                      ),
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
