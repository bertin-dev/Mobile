import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/card_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/main_screen/main_screen.dart';

class CreatedCardScreen extends StatelessWidget {
  CreatedCardScreen({super.key});
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());
  final CardController _cardController = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                Assets.images.transfertBg,
                width: Constants.screenWidth(context),
              )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 82,
                  height: 82,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 82,
                          height: 82,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF18BC7A),
                            shape: OvalBorder(),
                            shadows: [
                              BoxShadow(
                                color: Color(0x7518BC7A),
                                blurRadius: 11,
                                offset: Offset(0, 14),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: const Icon(
                            FontAwesomeIcons.check,
                            color: AppColors.white,
                            size: 40.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 74.0, right: 74.0, top: 29.0, bottom: 19.0),
                  child: SizedBox(
                    // width: 256,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Bravo',
                            style: AppStyles.textStyle(
                              color: AppColors.primary,
                              size: 30,
                              weight: FontWeight.w500,
                              height: 0.9,
                            ),
                          ),
                          const TextSpan(
                            text: '!! Votre c',
                            style: TextStyle(
                              color: Color(0xFF18BC7A),
                              fontSize: 30,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0.9,
                            ),
                          ),
                          TextSpan(
                            text: 'arte a ',
                            style: AppStyles.textStyle(
                              color: AppColors.primary,
                              size: 30,
                              weight: FontWeight.w500,
                              height: 0.9,
                            ),
                          ),
                          const TextSpan(
                            text: 'é',
                            style: TextStyle(
                              color: Color(0xFF18BC7A),
                              fontSize: 30,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0.9,
                            ),
                          ),
                          TextSpan(
                            text: 't',
                            style: AppStyles.textStyle(
                              color: AppColors.primary,
                              size: 30,
                              weight: FontWeight.w500,
                              height: 0.9,
                            ),
                          ),
                          const TextSpan(
                            text: 'é',
                            style: TextStyle(
                              color: Color(0xFF18BC7A),
                              fontSize: 30,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0.9,
                            ),
                          ),
                          TextSpan(
                            text: ' cr',
                            style: AppStyles.textStyle(
                              color: AppColors.primary,
                              size: 30,
                              weight: FontWeight.w500,
                              height: 0.9,
                            ),
                          ),
                          const TextSpan(
                            text: 'é',
                            style: TextStyle(
                              color: Color(0xFF18BC7A),
                              fontSize: 30,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0.9,
                            ),
                          ),
                          TextSpan(
                            text: 'e ',
                            style: AppStyles.textStyle(
                              color: AppColors.primary,
                              size: 30,
                              weight: FontWeight.w500,
                              height: 0.9,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 69.0, right: 69.0, bottom: 16.0),
                  // width: 256,
                  // height: 45,
                  child: Text(
                    'Appuyez longuement sur une section pour copier les details de carte',
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyle(
                      color: AppColors.dark,
                      size: 12,
                      weight: FontWeight.w300,
                      height: 0.9,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _topNavBarController.setPageIndex(7);
                    Get.off(MainScreen());
                    Get.rawSnackbar(
                        backgroundColor: AppColors.yellowLight,
                        borderRadius: 10.0,
                        // colorText: AppColors.white,
                        snackPosition: SnackPosition.BOTTOM,
                        margin: const EdgeInsets.only(
                            bottom: 40.0, left: 22.0, right: 22.0),
                        messageText: Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Feicitations!! ',
                                  style: AppStyles.textPoppinsStyle(
                                    color: const Color(0xFF222222),
                                    size: 12,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Nouvelle carte crée',
                                  style: AppStyles.textStyle(
                                    color: const Color(0xFF222222),
                                    size: 12,
                                    weight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10.0));
                  },
                  child: Container(
                    width: 227,
                    height: 51,
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF18BC7A),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9)),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x38FFF27F),
                          blurRadius: 7,
                          offset: Offset(0, 12),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 8),
                        Text(
                          'Voir ma carte',
                          style: AppStyles.textStyle(
                            color: AppColors.white,
                            size: 14,
                            weight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
