import 'package:flutter/material.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialCircle extends StatelessWidget {
  final IconData icon;
  final Uri url;
  const SocialCircle({super.key, required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await launchUrl(url);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            child: Center(
                child: Icon(
              icon,
              color: AppColors.white,
            )),
          ),
          SizedBox(height: Constants.screenHeight(context) / 14)
        ],
      ),
    );
  }
}
