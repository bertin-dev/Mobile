import 'package:flutter/material.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';

class InputLabel extends StatelessWidget {
  final String label;
  final double paddingTop;
  final Color color;
  final bool hasSpecialCaraters;
  const InputLabel({
    super.key,
    required this.label,
    required this.paddingTop,
    this.color = AppColors.dark,
    this.hasSpecialCaraters = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, bottom: 2.0),
      child: Text(
        label,
        style: hasSpecialCaraters
            ? AppStyles.textPoppinsStyle(color: color, size: 11.0)
            : AppStyles.textStyle(color: color, size: 12.0),
      ),
    );
  }
}
