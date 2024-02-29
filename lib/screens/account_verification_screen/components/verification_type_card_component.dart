import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';

class VerificationTypeCardComponent extends StatelessWidget {
  final String title;
  final String description;
  final bool isVerified;
  const VerificationTypeCardComponent(
      {super.key,
      required this.title,
      required this.description,
      required this.isVerified});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          decoration: BoxDecoration(
              color: AppColors.dark, borderRadius: BorderRadius.circular(15.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppStyles.textStyle(
                      color: AppColors.white,
                      size: 14,
                      weight: FontWeight.w600,
                      // height: 0.12,
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      description,
                      style: AppStyles.textStyle(
                        color: const Color(0xFF9A9A9A),
                        size: 10,
                        weight: FontWeight.w300,
                        // height: 0.24,
                      ),
                    ),
                  )
                ],
              ),
              isVerified
                  ? Container(
                      margin: const EdgeInsets.only(right: 16.0, left: 8.0),
                      child: SvgPicture.asset(
                        Assets.icons.certify,
                        width: 25.0,
                      ),
                    )
                  : Container(
                      height: 24.0,
                      width: 24.0,
                      margin: const EdgeInsets.only(right: 16.0, left: 8.0),
                      decoration: const BoxDecoration(
                          color: AppColors.white, shape: BoxShape.circle),
                      child: const Icon(
                        FontAwesomeIcons.chevronRight,
                        color: AppColors.dark,
                        size: 10.0,
                      ),
                    )
            ],
          )),
    );
  }
}
