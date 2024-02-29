import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';

class WebSiteWidget extends StatelessWidget {
  final String webSiteName;
  const WebSiteWidget({super.key, required this.webSiteName});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80.0),
            color: AppColors.white,
            border: Border.all(color: AppColors.dark, width: 2.0)),
        child: Center(
          child: Text(
            // caracteristics.name!,
            webSiteName.capitalize!,
            textAlign: TextAlign.center,
            style: AppStyles.textStyle(
                color: AppColors.dark, size: 12.0, weight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
