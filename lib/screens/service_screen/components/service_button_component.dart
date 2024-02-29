import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gleap_sdk/gleap_sdk.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceButtonComponent extends StatelessWidget {
  final String textButton;
  final Color color;
  final Color textColor;
  final bool hasIcon;
  final bool shouldOPenGleap;
  final Uri url;
  const ServiceButtonComponent({
    super.key,
    required this.textButton,
    required this.color,
    required this.textColor,
    this.hasIcon = false,
    this.shouldOPenGleap = false,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (shouldOPenGleap) {
          Gleap.open();
        } else {
          await launchUrl(url);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 25.0),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        decoration: BoxDecoration(
            color: color,
            boxShadow: const [
              BoxShadow(
                color: Color(0x38FFF27F),
                blurRadius: 7,
                offset: Offset(0, 12),
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.circular(32.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            hasIcon
                ? Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(Assets.icons.globe),
                  )
                : const SizedBox(),
            Text(
              textButton,
              textAlign: TextAlign.center,
              style: AppStyles.textStyle(
                color: textColor,
                size: 16.0,
                weight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
