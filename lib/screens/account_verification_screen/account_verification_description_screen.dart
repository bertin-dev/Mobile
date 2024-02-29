import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/personnal_info_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/account_verification_screen/components/verification_type_card_component.dart';
import 'package:secure_app/screens/identity_verification_screen/identity_verification_screen.dart';
import 'package:secure_app/screens/main_screen/main_screen.dart';
import 'package:secure_app/screens/main_screen/screens/unverified_home_screen.dart';
import 'package:secure_app/screens/personnal_info_screen/personnal_info_Screen.dart';
import 'package:secure_app/screens/rechage_account_screen/recharge_account_screen.dart';

import 'verification_stepper_screen.dart';

class AccountVerificationScreen extends StatelessWidget {
  AccountVerificationScreen({super.key});
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());
  final PersonnalInfoController _personnalInfoController =
      Get.put(PersonnalInfoController());
  final FormController _formController = Get.put(FormController());
  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.otpFieldBg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 20.0),
            child: GestureDetector(
              onTap: () {
                _formController.isObscurePass(true);
                _formController.isObscureCPass(true);
                Get.back();
              },
              child: const Icon(
                FontAwesomeIcons.arrowLeft,
                color: AppColors.white,
                // size: 25.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 19.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 19.0),
                        child:
                            SvgPicture.asset(Assets.icons.certify, width: 40.0),
                      ),
                      SizedBox(
                        child: Text(
                          'Nous voulons en savoir plus sur vous',
                          style: AppStyles.textStyle(
                            color: Colors.white,
                            size: 39,
                            weight: FontWeight.w500,
                            height: 0.9,
                            // letterSpacing: -1.95,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      // SizedBox(
                      //   child: Text(
                      //     'Pour s’assurer que c’est bien votre numéro',
                      //     style: AppStyles.textStyle(
                      //       color: const Color(0xFF9A9A9A),
                      //       size: 10,
                      //       weight: FontWeight.w300,
                      //       // height: 0.24,
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    if (!(_formController.isPhoneVerified.value ||
                        localUser.isNumberVerified!)) {
                      _formController.showTitleOnVerificationScreens(true);
                      _formController.isPhoneVerification(true);
                      _formController.isPhoneOtpVerification(false);
                      _formController.isOtpVerification(false);
                      _userController.resetLoginData();
                      _formController.resetFormErrors();
                      Get.to(() => VerificationStepperScreen());
                    }
                  },
                  child: Obx(() {
                    return VerificationTypeCardComponent(
                      title: 'Verification Numéro',
                      description: 'Pour s’assurer que c’est bien votre numéro',
                      isVerified: _formController.isPhoneVerified.value ||
                          localUser.isNumberVerified!,
                    );
                  }),
                ),
                const SizedBox(height: 15.0),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    if (!(_formController.isMailverified.value ||
                        localUser.isEmailVerified!)) {
                      _formController.showTitleOnVerificationScreens(true);
                      _formController.isPhoneVerification(false);
                      _formController.isPhoneOtpVerification(false);
                      _formController.isOtpVerification(false);
                      _userController.resetLoginData();
                      _formController.resetFormErrors();
                      Get.to(() => VerificationStepperScreen());
                    }
                  },
                  child: Obx(() {
                    return VerificationTypeCardComponent(
                      title: "Verification Mail",
                      description:
                          "Pour s’assurer que c’est bien votre adresse",
                      isVerified: _formController.isMailverified.value ||
                          localUser.isEmailVerified!,
                    );
                  }),
                ),
                const SizedBox(height: 15.0),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    if (!(_formController.isPersonalInfosverified.value ||
                        localUser.isPersonVerified!)) {
                      _personnalInfoController.pageIndex(0);
                      _userController.resetLoginData();
                      _formController.resetFormErrors();
                      Get.to(() => PersonnalInfoScreen());
                    }
                  },
                  child: Obx(() {
                    return VerificationTypeCardComponent(
                      title: "Verification personne",
                      description: "pour en savoir plus sur vous",
                      isVerified:
                          _formController.isPersonalInfosverified.value ||
                              localUser.isPersonVerified!,
                    );
                  }),
                ),
                const SizedBox(height: 15.0),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    if ((localUser.isNumberVerified != null &&
                            localUser.isNumberVerified!) &&
                        (localUser.isEmailVerified != null &&
                            localUser.isEmailVerified!) &&
                        (localUser.isPersonVerified != null &&
                            localUser.isPersonVerified!)) {
                      if (!(_formController.isIdentified.value ||
                          (localUser.isProfileVerified != null &&
                              localUser.isProfileVerified!))) {
                        _userController.resetIdentityData();
                        _formController.resetFormErrors();
                        _formController.identitificationPageIndex(0);
                        Get.to(IdentityVerificationScreen());
                      }
                    } else {
                      Constants.snackBar(
                          bgColor: AppColors.red,
                          textColor: AppColors.white,
                          description:
                              "Veuillez faire les premieres verifications");
                    }
                    // _formController.isAccountVerified(true);
                    // Future.delayed(const Duration(seconds: 2), () {
                    //   Get.to(RechargeAccountScreen());
                    // });
                  },
                  child: Obx(() {
                    return VerificationTypeCardComponent(
                      title: "Verification identité",
                      description: "Compléter cette dernière étape",
                      isVerified: _formController.isIdentified.value ||
                          (localUser.isProfileVerified != null &&
                              localUser.isProfileVerified!),
                    );
                  }),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              Assets.images.accountVerifBg,
              width: Constants.screenWidth(context),
            ),
          ),
        ],
      ),
    );
  }
}
