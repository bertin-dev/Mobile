import 'package:flutter/material.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';

class HorizontalTabElementWidget2 extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool hasMargin;
  final Color color;
  final double fem;
  final double ffem;
  const HorizontalTabElementWidget2(
      {super.key,
      required this.label,
      this.isSelected = false,
      this.hasMargin = false,
      this.color = AppColors.horizontalTabUnselectedColor,
      required this.fem,
      required this.ffem});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: double.infinity,
      height: 40.36*fem,
      child: Container(
        margin: EdgeInsets.fromLTRB(0*fem, 0.88*fem, 5.04*fem, 0*fem),
        width: 81.96*fem,
        height: 39.48*fem,
        decoration: BoxDecoration (
          border: !isSelected ? Border.all(color: color) : Border.all(color: AppColors.chatBubleBg),
          color: !isSelected ? color : AppColors.chatBubleBg,
          borderRadius: BorderRadius.circular(22*fem),
        ),
        child: Center(
          child: Center(
            child: Text(
              label,
              style: AppStyles.textStyle (
                size: 12*ffem,
                weight: FontWeight.w500,
                height: 2.875*ffem/fem,
                letterSpacing: -0.06*fem,
                color: !isSelected ? AppColors.chatBubleBg : AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
