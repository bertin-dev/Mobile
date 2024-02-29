import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/identity_verification_screen/identity_verification_success_screen.dart';
import 'package:secure_app/widgets/timer_widget.dart';

class IdentityVerificationLoader extends StatefulWidget {
  final List<String> imgFilesPath;
  const IdentityVerificationLoader({super.key, required this.imgFilesPath});

  @override
  State<IdentityVerificationLoader> createState() =>
      _IdentityVerificationLoaderState();
}

class _IdentityVerificationLoaderState
    extends State<IdentityVerificationLoader> {
  final FormController _formController = Get.put(FormController());

  final UserController _userController = Get.put(UserController());
  Timer? delay;
  void verifyProfile() async {
    _userController.verifyProfile();
    await _userController
        .uploadPapersPicture(widget.imgFilesPath)
        .then((value) async {
      if (_userController.err.isEmpty) {
        Get.off(IdentityVerificationSuccessScreen());
        // _formController.isAccountVerified(true); //TODO: uncomment this
        _userController.resetIdentityData();
        _userController.resetLoginData();
      } else {
        print("Failed to verify profile");
        // Get.off(() => TransactionFailedScreen());
      }
    });
    // const splashDuration = Duration(seconds: 60);
    // delay = Timer(splashDuration, () async {
    //   Get.off(IdentityVerificationSuccessScreen());
    //   // _formController.isAccountVerified(true); //TODO: uncomment this
    //   _userController.resetIdentityData();
    //   _userController.resetLoginData();
    // });
  }

  @override
  void initState() {
    verifyProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // const splashDuration = Duration(seconds: 3);
    // var delay = Timer(splashDuration, () {
    //   _formController.isAccountVerified(true);
    //   _userController.resetIdentityData();

    //   Get.off(IdentityVerificationSuccessScreen());
    // });
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
            delay!.cancel();
          },
          child: const Icon(FontAwesomeIcons.arrowLeft),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(),
            const SizedBox(),
            const SizedBox(),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  // width: 22.59,
                  height: 80,
                  width: 80,
                  child: LoadingAnimationWidget.inkDrop(
                    color: AppColors.primary,
                    size: 50,
                  ),
                  // CircularProgressIndicator(
                  //   color: AppColors.brown,
                  //   strokeWidth: 7.0,
                  // ),
                ),
                SvgPicture.asset(
                  Assets.icons.certify,
                  width: 55.0,
                  height: 55.0,
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 276,
                  child: Text(
                    'votre verification sera validée dans quelques minutes',
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyle(
                      color: AppColors.dark,
                      size: 30,
                      weight: FontWeight.w500,
                      height: 0.9,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  width: 236,
                  child: Text(
                    'Ne quittez pas cette page svp, nous verifions vos informations ... ',
                    textAlign: TextAlign.center,
                    style: AppStyles.textPoppinsStyle(
                      color: Colors.black,
                      size: 12,
                      weight: FontWeight.w300,
                      height: 0.99,
                    ),
                  ),
                ),
                TimerWidget(
                  duration: 60,
                  label: "",
                  // restartTimer: () {},
                )
              ],
            ),
            SvgPicture.asset(
              Assets.images.identificationLoaderBg,
              width: Constants.screenWidth(context),
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
