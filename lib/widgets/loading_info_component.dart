import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:shimmer/shimmer.dart';

class LoadingInfoComponent extends StatelessWidget {
  const LoadingInfoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      width: Constants.screenWidth(context),
      // width: double.infinity,
      margin: const EdgeInsets.only(
        // left: i == 1 ? 24.0 : 10.0,
        top: 14.0,
        right: 10.0,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: ShapeDecoration(
        color: const Color(0x3ADADADA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      child: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Positioned(
            left: 10.0,
            child: SvgPicture.asset(
              Assets.icons.heart,
              width: 20.0,
            ),
          ),
          const SizedBox(width: 9),
          Positioned(
            left: 39.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Shimmer.fromColors(
                      enabled: true,
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 23.0,
                        width: 23.0,
                        decoration: const BoxDecoration(
                            color: AppColors.grey300, shape: BoxShape.circle),
                      ),
                    ),
                    const SizedBox(width: 8.8),
                    Shimmer.fromColors(
                      enabled: true,
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 13.0,
                        width: 120.0,
                        color: AppColors.grey300,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 4.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      enabled: true,
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 13.0,
                        width: Constants.screenWidth(context) / 1.7,
                        color: AppColors.grey300,
                      ),
                    ),
                    const SizedBox(height: 1.5),
                    Shimmer.fromColors(
                      enabled: true,
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 13.0,
                        width: Constants.screenWidth(context) / 2.5,
                        color: AppColors.grey300,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
