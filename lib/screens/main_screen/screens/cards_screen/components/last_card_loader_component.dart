import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/card_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/widgets/card_button_widget.dart';
import 'package:shimmer/shimmer.dart';

class LastCardLoaderComponent extends StatelessWidget {
  LastCardLoaderComponent({super.key});
  final CardController _cardController = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.08,
        vertical: MediaQuery.of(context).size.width * 0.032,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Shimmer.fromColors(
                enabled: true,
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: 13.0,
                  width: Constants.screenWidth(context) / 3,
                  decoration: const BoxDecoration(color: AppColors.grey300),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
                child: Shimmer.fromColors(
                  enabled: true,
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 13.0,
                    width: Constants.screenWidth(context) / 5,
                    decoration: BoxDecoration(
                      color: AppColors.grey300,
                      // borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
            child: Shimmer.fromColors(
              enabled: true,
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 13.0,
                width: Constants.screenWidth(context) / 4,
                decoration: const BoxDecoration(color: AppColors.grey300),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Shimmer.fromColors(
              enabled: true,
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 13.0,
                width: Constants.screenWidth(context),
                decoration: const BoxDecoration(color: AppColors.grey300),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
                    child: Shimmer.fromColors(
                      enabled: true,
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 30.0,
                        width: Constants.screenWidth(context) / 5,
                        decoration: BoxDecoration(
                          color: AppColors.grey300,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.015),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
                    child: Shimmer.fromColors(
                      enabled: true,
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 30.0,
                        width: Constants.screenWidth(context) / 5,
                        decoration: BoxDecoration(
                          color: AppColors.grey300,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
                child: Shimmer.fromColors(
                  enabled: true,
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 13.0,
                    width: Constants.screenWidth(context) / 4.7,
                    decoration: BoxDecoration(
                      color: AppColors.grey300,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
