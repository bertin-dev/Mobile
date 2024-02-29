import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/notification_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/notification_screen/components/loading_order_notification_component.dart';
import 'package:secure_app/screens/notification_screen/components/order_notification_component.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationController _notificationController = Get.find();
  getNotifications() {
    if (localUser.token != null && localUser.token!.isNotEmpty) {
      _notificationController.isLoading = true.obs;
      _notificationController.getNotifications(localUser);
      _notificationController.updateNotifications(
          notifics: _notificationController.notifications!,
          token: localUser.token!);
    }
  }

  @override
  void initState() {
    getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.imputBg,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Obx(() {
            return Column(
              crossAxisAlignment:
                  _notificationController.notifications != null &&
                          _notificationController.notifications!.isEmpty
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: AppColors.dark,
                          // size: 25.0,
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Text(
                        "Notifications",
                        style: AppStyles.textStyle(
                          color: AppColors.dark,
                          size: 20.0,
                          weight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),

                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: _notificationController.isLoading.value
                        ? 10
                        : _notificationController.notifications?.length,
                    itemBuilder: (context, index) {
                      return _notificationController.isLoading.value
                          ? LoadingNotificationOrderComponent(
                              isOrder: index % 3 == 0)
                          : NotificationOrderComponent(
                              isOrder: false,
                              notification:
                                  _notificationController.notifications![index],
                            );
                    }),
                (_notificationController.notifications != null &&
                        _notificationController.notifications!.isEmpty)
                    ? SizedBox(
                        // height: Constants.screenHeight(context) / 2.5,
                        // width: Constants.screenWidth(context) / 1.5,
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                  height: Constants.screenHeight(context) / 4),
                              SvgPicture.asset(Assets.images.noItemsSvg),
                              // Image.asset(
                              //   Assets.images.noItems.path,
                              //   width: 250.0,
                              // ),
                              SizedBox(
                                width: Constants.screenWidth(context) / 1.5,
                                child: Text(
                                  "Aucune notification pour l'instant",
                                  textAlign: TextAlign.center,
                                  style: AppStyles.textPoppinsStyle(
                                    color: AppColors.dark,
                                    size: 18.0,
                                    weight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
                // const Padding(
                //   padding: EdgeInsets.only(top: 17.0),
                //   child: NotificationDate(
                //     date: "Today",
                //   ),
                // ),
                // NotificationOrderComponent(isOrder: true, isDisabled: true),
                // NotificationOrderComponent(isOrder: false),
                // NotificationOrderComponent(isOrder: false),
                // NotificationOrderComponent(isOrder: true, isDisabled: true),
                // const Padding(
                //   padding: EdgeInsets.only(top: 40.0),
                //   child: NotificationDate(
                //     date: "Yesterday",
                //   ),
                // ),
                // NotificationOrderComponent(isOrder: true),
                // NotificationOrderComponent(isOrder: false),
                // NotificationOrderComponent(isOrder: false, isDisabled: true),
                // NotificationOrderComponent(isOrder: false, isDisabled: true),
                // NotificationOrderComponent(isOrder: false, isDisabled: true),
                // const Padding(
                //   padding: EdgeInsets.only(top: 40.0),
                //   child: NotificationDate(
                //     date: "Yesterday",
                //   ),
                // ),
                // NotificationOrderComponent(isOrder: true),
                // NotificationOrderComponent(isOrder: false),
                // NotificationOrderComponent(isOrder: false, isDisabled: true),
                // NotificationOrderComponent(isOrder: false, isDisabled: true),
                // NotificationOrderComponent(isOrder: false, isDisabled: true),
                const SizedBox(height: 30.0)
              ],
            );
          }),
        ),
      ),
    );
  }
}
