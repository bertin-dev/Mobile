import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';

class SectionToUpdateComponent extends StatelessWidget {
  final String title;
  final String icon;
  const SectionToUpdateComponent({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(13.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                icon,
                // width: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.33),
                child: SizedBox(
                  width: Constants.screenWidth(context) / 1.5,
                  child: Text(
                    title,
                    textAlign: TextAlign.start,
                    style: AppStyles.textStyle(
                      color: AppColors.dark,
                      size: 14.0,
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
          const Icon(
            FontAwesomeIcons.chevronRight,
            size: 20.0,
          )
        ],
      ),
    );
  }
}
