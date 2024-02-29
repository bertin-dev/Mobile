import 'package:flutter/material.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';

class AppButtonWidget extends StatelessWidget {
  final String label;
  const AppButtonWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        decoration: BoxDecoration(
            color: AppColors.primary, borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: Text(
            label,
            style: AppStyles.textStyle(
              color: AppColors.white,
              size: 14.0,
              weight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
