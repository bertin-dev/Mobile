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

class NotificationOrderComponent extends StatelessWidget {
  final bool isOrder;
  final String orderDescription;
  final String notificationSender;
  final bool isDisabled;
  final NotificationModel notification;
  NotificationOrderComponent({
    super.key,
    required this.isOrder,
    this.orderDescription = "",
    this.notificationSender = "",
    this.isDisabled = false,
    required this.notification,
  });
  final NotificationController _notificationController =
      Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: isOrder
          ? Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    _notificationController.isLoading.value
                        ? Shimmer.fromColors(
                            enabled: true,
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: const BoxDecoration(
                                  color: AppColors.grey300,
                                  shape: BoxShape.circle),
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle),
                            child: SvgPicture.asset(
                              Assets.icons.sekureIcon,
                              width: 25.0,
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _notificationController.isLoading.value
                              ? Shimmer.fromColors(
                                  enabled: true,
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Container(
                                    height: 15.0,
                                    width: 120.0,
                                    color: AppColors.grey300,
                                  ),
                                )
                              : Text(
                                  'Validate your order',
                                  style: AppStyles.textStyle(
                                    color: Colors.black,
                                    size: 13,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                          _notificationController.isLoading.value
                              ? Shimmer.fromColors(
                                  enabled: true,
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 5.0),
                                    height: 15.0,
                                    width: Constants.screenWidth(context) / 2,
                                    color: AppColors.grey300,
                                  ),
                                )
                              : Text(
                                  '06kgs gaz... , lignt bulb repla...',
                                  style: AppStyles.textPoppinsStyle(
                                    color: const Color(0xFF333333),
                                    size: 13,
                                  ),
                                ),
                          _notificationController.isLoading.value
                              ? Shimmer.fromColors(
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
                              : Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text(
                                    '15:54',
                                    textAlign: TextAlign.right,
                                    style: AppStyles.textPoppinsStyle(
                                      color: const Color(0xFFAAAAAA),
                                      size: 10,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    )
                  ]),
                  _notificationController.isLoading.value
                      ? Shimmer.fromColors(
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
                        )
                      : Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF18BC7A),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          child: Text(
                            'view order',
                            style: AppStyles.textPoppinsStyle(
                              color: Colors.white,
                              size: 11,
                              weight: FontWeight.w600,
                            ),
                          ),
                        )
                ],
              );
            })
          : Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                      color: AppColors.primary, shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    Assets.icons.sekureIcon,
                    width: 25.0,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Constants.screenWidth(context) / 1.4,
                      child: Text(
                        notification.message!,
                        style: AppStyles.textPoppinsStyle(
                          color: Colors.black,
                          size: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        notification.createdAt!.split(" ")[1],
                        textAlign: TextAlign.right,
                        style: AppStyles.textPoppinsStyle(
                          color: const Color(0xFFAAAAAA),
                          size: 10,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
    );
  }
}
