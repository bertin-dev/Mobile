import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/notification_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/models/notiifcation_model.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:shimmer/shimmer.dart';

class LoadingNotificationOrderComponent extends StatelessWidget {
  final bool isOrder;
  LoadingNotificationOrderComponent({
    super.key,
    required this.isOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: isOrder
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Shimmer.fromColors(
                    enabled: true,
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: const BoxDecoration(
                          color: AppColors.grey300, shape: BoxShape.circle),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          enabled: true,
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            height: 15.0,
                            width: 120.0,
                            color: AppColors.grey300,
                          ),
                        ),
                        Shimmer.fromColors(
                          enabled: true,
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            height: 15.0,
                            width: Constants.screenWidth(context) / 2,
                            color: AppColors.grey300,
                          ),
                        ),
                        Shimmer.fromColors(
                          enabled: true,
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            height: 15.0,
                            width: 50.0,
                            color: AppColors.grey300,
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
                Shimmer.fromColors(
                  enabled: true,
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    decoration: ShapeDecoration(
                      color: AppColors.grey300,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    margin: const EdgeInsets.only(top: 5.0),
                    height: 30.0,
                    width: Constants.screenWidth(context) / 5,
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Shimmer.fromColors(
                  enabled: true,
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    height: 50.0,
                    width: 50.0,
                    decoration: const BoxDecoration(
                        color: AppColors.grey300, shape: BoxShape.circle),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          enabled: true,
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            height: 15.0,
                            width: Constants.screenWidth(context) / 1.5,
                            color: AppColors.grey300,
                          ),
                        ),
                        Shimmer.fromColors(
                          enabled: true,
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            height: 15.0,
                            width: Constants.screenWidth(context) / 3,
                            color: AppColors.grey300,
                          ),
                        ),
                      ],
                    ),
                    Shimmer.fromColors(
                      enabled: true,
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        height: 15.0,
                        width: 50.0,
                        color: AppColors.grey300,
                      ),
                    )
                  ],
                ),
              ],
            ),
    );
  }
}
