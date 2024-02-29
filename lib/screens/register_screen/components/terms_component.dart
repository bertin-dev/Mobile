import 'package:flutter/material.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';

class TermsComponents extends StatelessWidget {
  final String termDescription;
  final bool isChecked;
  final bool isTerms;
  final void Function() onTap;
  const TermsComponents(
      {super.key,
      required this.termDescription,
      required this.isChecked,
      this.isTerms = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      margin: const EdgeInsets.only(top: 11.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              height: 20.0,
              width: 20.0,
              duration: const Duration(milliseconds: 300),
              // padding:
              // const EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
              decoration: BoxDecoration(
                color: isChecked ? AppColors.primary : Colors.grey[300],
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: isChecked
                    ? Icon(
                        Icons.check,
                        size: 18.0,
                        color: AppColors.white,
                        key: UniqueKey(),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            const SizedBox(width: 11.0),
            Expanded(
              child: Container(
                  // width: Constants.screenWidth(context) / 1.3,
                  child: isTerms
                      ?
                      // Row(
                      //     children: [
                      //       Text("j’ai lu et accepté les"),
                      //       Column(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: [
                      //           Text(
                      //             ' termes et conditions',
                      //             style: AppStyles.textStyle(
                      //               color: AppColors.primary,
                      //               size: 12.0,
                      //               // isUderLine: true,
                      //             ),
                      //           ),
                      //           Container(
                      //             height: 1.0,
                      //             width: 122.0,
                      //             color: AppColors.primary,
                      //           )
                      //         ],
                      //       ),
                      //       Text(
                      //         ' de Sekure',
                      //         style: AppStyles.textStyle(
                      //             color: AppColors.dark, size: 12.0),
                      //       ),
                      //     ],
                      //   )
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'j’ai lu et accepté les',
                                style: AppStyles.textStyle(
                                    color: AppColors.dark, size: 12.0),
                              ),
                              TextSpan(
                                text: ' termes et conditions',
                                style: AppStyles.textStyle(
                                  color: AppColors.primary,
                                  size: 12.0,
                                  isUderLine: true,
                                ),
                              ),
                              TextSpan(
                                text: ' de Sekure',
                                style: AppStyles.textStyle(
                                    color: AppColors.dark, size: 12.0),
                              ),
                            ],
                          ),
                        )
                      : Text(
                          termDescription,
                          style: AppStyles.textStyle(
                              color: AppColors.dark, size: 12.0),
                        )),
            )
          ],
        ),
      ),
    );
  }
}
