import 'package:flutter/material.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';

class NotificationDate extends StatelessWidget {
  final String date;
  const NotificationDate({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: AppStyles.textStyle(color: AppColors.chatDateColor, size: 15.0),
    );
  }
}
