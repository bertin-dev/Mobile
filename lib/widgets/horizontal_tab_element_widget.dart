import 'package:flutter/material.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';

class HorizontalTabElementWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool hasMargin;
  final Color color;
  const HorizontalTabElementWidget(
      {super.key,
      required this.label,
      this.isSelected = false,
      this.hasMargin = false,
      this.color = AppColors.horizontalTabUnselectedColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10.0),
      margin: hasMargin ? const EdgeInsets.only(left: 10.0) : null,
      decoration: BoxDecoration(
          color: !isSelected ? color : AppColors.dark,
          borderRadius: BorderRadius.circular(50.0)),
      child: Text(
        label,
        style: AppStyles.textStyle(
          color: !isSelected ? AppColors.dark : AppColors.white,
          size: 12,
          weight: FontWeight.w500,
        ),
      ),
    );
  }
}
