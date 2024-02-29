
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';

class HistoryItemWidget extends StatelessWidget {
  final bool isRecharge;
  const HistoryItemWidget({super.key, required this.isRecharge});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: isRecharge ? AppColors.dark : AppColors.primary,
                      border: isRecharge ? null : Border.all(),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: SvgPicture.asset(
                      isRecharge ? Assets.icons.recharge : Assets.icons.remove),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recharge",
                        style: AppStyles.textStyle(
                          color: AppColors.dark,
                          size: 16,
                          weight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Aujourd hui",
                        style: AppStyles.textStyle(
                          color: AppColors.dark,
                          size: 12,
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
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: '- \$',
                        style: TextStyle(
                          color: Color(0xFF1E1E1E),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: '13.00',
                        style: AppStyles.textStyle(
                          color: AppColors.dark,
                          size: 16,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Reussi",
                  style: AppStyles.textStyle(
                    color: AppColors.primary,
                    size: 13,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
