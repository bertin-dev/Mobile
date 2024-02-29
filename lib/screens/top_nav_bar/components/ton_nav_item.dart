import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';

class TopNavItem extends StatelessWidget {
  final String title;
  final String icon;
  final bool isActive;
  final void Function() onTap;
  const TopNavItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: const EdgeInsets.only(top: 0.0, bottom: 10.0),
            // width: Constants.screenWidth(context) / 5.5,
            // height: 120.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /*isActive
                    ? Container(
                        width: 35.0,
                        height: 4.0,
                        // margin: EdgeInsets.only(top: 14.42),
                        decoration:
                            const BoxDecoration(color: AppColors.primary),
                      )
                    : const SizedBox(),*/
                const SizedBox(height: 14.42),
                Column(
                  children: [

                    SvgPicture.asset(
                      icon,
                      width:
                          title == "Cartes" || title == "Accueil" ? 27.0 : 23.0,
                      height: 22.0,
                      color:
                          isActive ? AppColors.primary : AppColors.gray700,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      title,
                      style: AppStyles.textStyle(
                        fontFamily: 'Poppins',
                          //TODO: Change font to poppins
                          color: isActive
                              ? AppColors.primary
                              : AppColors.gray700,
                          size: 8.0,
                          weight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
