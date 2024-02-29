import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/models/transaction_model.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:shimmer/shimmer.dart';

class LoadingHistoryItemComponent extends StatelessWidget {
  const LoadingHistoryItemComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 25.0),
        padding: const EdgeInsets.fromLTRB(11.25, 0, 11.25, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Shimmer.fromColors(
                  enabled: true,
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                        color: AppColors.grey300,
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        enabled: true,
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          height: 15.0,
                          width: 80.0,
                          color: AppColors.grey300,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Shimmer.fromColors(
                          enabled: true,
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            height: 15.0,
                            width: 100.0,
                            color: AppColors.grey300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Shimmer.fromColors(
                  enabled: true,
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 15.0,
                    width: 80.0,
                    color: AppColors.grey300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Shimmer.fromColors(
                    enabled: true,
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 15.0,
                      width: 50.0,
                      color: AppColors.grey300,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
