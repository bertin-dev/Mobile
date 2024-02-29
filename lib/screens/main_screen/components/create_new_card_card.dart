import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/models/card_model.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/widgets/card_button_widget.dart';

class CreateNewCardCard extends StatelessWidget {
  final double fem;
  final double ffem;
  CreateNewCardCard({
    super.key, required this.fem, required this.ffem
  });
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _topNavBarController.pageIndex(5);
        _topNavBarController.scrollController.jumpTo(2);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(33.35*fem, 22.5*fem, 13.14*fem, 10*fem),
        width: 168.57*fem,
        height: double.infinity,
        decoration: BoxDecoration (
          color: AppColors.green100Color,
          borderRadius: BorderRadius.circular(10*fem),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 19.08*fem, 14*fem),
                constraints: BoxConstraints (
                  maxWidth: 103*fem,
                ),
                child: Text(
                  'Créer une nouvelle Carte virtuelle',
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyle (
                    fontFamily: 'Lufga',
                    size: 14*ffem,
                    weight: FontWeight.w500,
                    height: 0.8571428571*ffem/fem,
                    letterSpacing: -0.42*fem,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5.08*fem, 0*fem, 0*fem, 0*fem),
              width: 117*fem,
              height: 69.5*fem,
              child: Stack(
                children: [
                  Positioned(
                    left: 92.9999996566*fem,
                    top: 45.5001220703*fem,
                    child: Align(
                      child: SizedBox(
                        width: 24*fem,
                        height: 24*fem,
                        child: Image.asset(
                          'assets/images/group-115-FZD.png',
                          width: 24*fem,
                          height: 24*fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0*fem,
                    top: 0*fem,
                    child: Container(
                      width: 93*fem,
                      height: 51*fem,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(24.5000019073*fem),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(24.5000019073*fem),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0.0000028153*fem,
                              top: 1.5001144409*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 93*fem,
                                  height: 49*fem,
                                  child: Container(
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(24.5000019073*fem),
                                      color: AppColors.primary,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.yellow200Color,
                                          offset: Offset(0*fem, 10*fem),
                                          blurRadius: 5*fem,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 36.1809663773*fem,
                              top: 0*fem,
                              child: Center(
                                child: Align(
                                  child: SizedBox(
                                    width: 20*fem,
                                    height: 51*fem,
                                    child: Text(
                                      '+',
                                      textAlign: TextAlign.center,
                                      style: AppStyles.textStyle (
                                        fontFamily: 'Poppins',
                                        size: 40*ffem,
                                        weight: FontWeight.w400,
                                        height: 1.2575*ffem/fem,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
