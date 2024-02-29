import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/screens/on_board/onboard_screen.dart';

import '../../controllers/user_controller.dart';
import '../../ressources/app_styles.dart';
import '../login_screen/login_with_only_password_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final UserController _userController = Get.put(UserController());
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      if(_userController.isUSerLogedIn.value){
        Get.to(LoginWithOnlyPasswordScreen());
      } else{
        Get.to(OnBoardScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Align(
        alignment: Alignment.center,
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: SvgPicture.asset(
                Assets.images.background,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Image.asset(
                Assets.images.logoOriginIconPng.path,
                width: 111.8,
                height: 113.82,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Text(
                'Version 1.0',
                textAlign: TextAlign.center,
                style: AppStyles.textStyle(
                  color: Colors.white,
                  size: 14.0,
                  letterSpacing: -0.5,
                  weight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
