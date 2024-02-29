import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';

class QuestionComponent extends StatelessWidget {
  final String question;
  final String response;
  final bool isResponseVisible;
  const QuestionComponent(
      {super.key,
      required this.question,
      required this.response,
      required this.isResponseVisible});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(13.0)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    Assets.icons.question,
                    color: AppColors.primary,
                    width: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.33),
                    child: SizedBox(
                      width: Constants.screenWidth(context) / 1.5,
                      child: Text(
                        question,
                        textAlign: TextAlign.start,
                        style: AppStyles.textStyle(
                          color: isResponseVisible
                              ? AppColors.primary
                              : AppColors.dark,
                          size: 14.0,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Icon(
                !isResponseVisible
                    ? FontAwesomeIcons.chevronDown
                    : FontAwesomeIcons.chevronUp,
                size: 20.0,
              )
            ],
          ),
          isResponseVisible
              ? Padding(
                  padding: const EdgeInsets.only(left: 30.33, top: 12.0),
                  child: Text(
                    response,
                    textAlign: TextAlign.start,
                    style: AppStyles.textStyle(
                      color: AppColors.dark,
                      size: 11.0,
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
