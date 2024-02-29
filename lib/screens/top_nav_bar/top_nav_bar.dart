import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/notification_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/screens/account_verification_screen/account_verification_description_screen.dart';
import 'package:secure_app/screens/top_nav_bar/components/ton_nav_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main_screen/main_screen.dart';
import '../main_screen/screens/homepage_test.dart';

class TopNavBar extends StatelessWidget {
  TopNavBar({super.key});
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());
  final FormController _formController = Get.put(FormController());
  final TransactionController _transactionController =
      Get.put(TransactionController());
  final NotificationController _notificationController =
      Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return !_topNavBarController.isKeyboardVisible.value
          ? Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                elevation: 10.0,
                child: IntrinsicHeight(
                  child: Container(
                    // margin: const EdgeInsets.only(top: 0.0, bottom: 15.0),
                    // margin: const EdgeInsets.only(top: 55.0),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () async {
                              print('----------------${_topNavBarController.pageIndex.value}');
                              if (localUser.isProfileVerified != null &&
                                  !localUser.isProfileVerified!) {

                                if(_topNavBarController.pageIndex.value == 4){
                                  _topNavBarController.setPageIndex(0);
                                } else{
                                  Get.to(() => AccountVerificationScreen());
                                }

                              } else {
                                if (_formController
                                    .isAccountTransactionBottomSheetShow
                                    .value) {
                                  _formController
                                      .isAccountTransactionBottomSheetShow(
                                          false);
                                } else if (_formController
                                    .showTransactionDetailsBottomSheet.value) {
                                  _formController
                                      .showTransactionDetailsBottomSheet(false);
                                }
                              _transactionController.clearData();
                                _formController.resetFormErrors();
                                _topNavBarController.setPageIndex(0);
                                // showDialog(
                                //   context: context,
                                //   barrierDismissible: false,
                                //   builder: (context) {
                                //     return Container(
                                //       color: Colors.transparent,
                                //       child: LoadingAnimationWidget.inkDrop(
                                //         color: AppColors.primary,
                                //         size: 50,
                                //       ),
                                //     );
                                //   },
                                // );

                                // await _transactionController.getTransactions(localUser);
                                // if ((_transactionController.transactions != null &&
                                //         _transactionController.transactions!.isNotEmpty) ||
                                //     (_transactionController.soldTransactions != null &&
                                //         _transactionController
                                //             .soldTransactions!.isNotEmpty) ||
                                //     (_transactionController.transfertTransactions != null &&
                                //         _transactionController
                                //             .transfertTransactions!.isNotEmpty)) {
                                //   // SharedPreferences preferences =
                                //   //     await SharedPreferences.getInstance();
                                //   // print(_transactionController.transactions!.first.amount);
                                //   // preferences.setString(
                                //   //     "lastTransaction",
                                //   //     _transactionController.transactions!.isNotEmpty
                                //   //         ? _transactionController.transactions!.first.type!
                                //   //                     .toLowerCase() ==
                                //   //                 "recharge"
                                //   //             ? "+\$${(double.parse(_transactionController.transactions!.first.amount!) / (1 + (2 / 100))).round()}"
                                //   //             : "-\$${(double.parse(_transactionController.transactions!.first.amount!) / (1 - (3 / 100))).round()}"
                                //   //         : "\$00.00");

                                //   // localUser.lastTransaction =
                                //   //     preferences.getString("lastTransaction") ?? "";
                                //   Get.back();
                                // }
                              }
                            },
                            child: TopNavItem(
                              title: "Accueil",
                              icon: _topNavBarController.pageIndex.value == 0 ? Assets.icons.home2 : Assets.icons.home2,
                              isActive:
                                  _topNavBarController.pageIndex.value == 0,
                              onTap: () async {
                                _topNavBarController.setPageIndex(0);
                              },
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () {
                              if (localUser.isProfileVerified != null &&
                                  !localUser.isProfileVerified!) {
                                Get.to(() => AccountVerificationScreen());
                              } else {
                                if (_formController
                                    .isAccountTransactionBottomSheetShow
                                    .value) {
                                  _formController
                                      .isAccountTransactionBottomSheetShow(
                                          false);
                                } else if (_formController
                                    .showTransactionDetailsBottomSheet.value) {
                                  _formController
                                      .showTransactionDetailsBottomSheet(false);
                                }
                                _transactionController.clearData();
                                _formController.resetFormErrors();
                                _topNavBarController.pageIndex(5);
                                _topNavBarController.scrollController.jumpTo(2);
                              }
                            },
                            child: TopNavItem(
                              title: "Cartes",
                              icon: _topNavBarController.pageIndex.value ==
                                  1 ||
                                  _topNavBarController.pageIndex.value == 5 ||
                                  _topNavBarController.pageIndex.value == 6 ||
                                  _topNavBarController.pageIndex.value == 7 ? Assets.icons.card2 : Assets.icons.card,
                              isActive: _topNavBarController.pageIndex.value ==
                                      1 ||
                                  _topNavBarController.pageIndex.value == 5 ||
                                  _topNavBarController.pageIndex.value == 6 ||
                                  _topNavBarController.pageIndex.value == 7,
                              onTap: () {
                                print("object");
                                // localUser.isProfileVerified != null &&
                                //         !localUser.isProfileVerified!
                                //     ? Get.to(() => AccountVerificationScreen())
                                //     : _topNavBarController.setPageIndex(1);
                                if (localUser.isProfileVerified != null &&
                                    !localUser.isProfileVerified!) {
                                  Get.to(() => AccountVerificationScreen());
                                } else {
                                  _topNavBarController.pageIndex(5);
                                  _topNavBarController.scrollController
                                      .jumpTo(2);
                                }
                              },
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () {
                              if (localUser.isProfileVerified != null &&
                                  !localUser.isProfileVerified!) {
                                Get.to(() => AccountVerificationScreen());
                              } else {
                                if (_formController
                                    .isAccountTransactionBottomSheetShow
                                    .value) {
                                  _formController
                                      .isAccountTransactionBottomSheetShow(
                                          false);
                                } else if (_formController
                                    .showTransactionDetailsBottomSheet.value) {
                                  _formController
                                      .showTransactionDetailsBottomSheet(false);
                                }
                                _transactionController.clearData();
                                _formController.resetFormErrors();
                                _topNavBarController.setPageIndex(2);
                              }
                            },
                            child: TopNavItem(
                              title: "Transfert",
                              icon: _topNavBarController.pageIndex.value == 2 ? Assets.icons.transfert2 : Assets.icons.transfert,
                              isActive:
                                  _topNavBarController.pageIndex.value == 2,
                              onTap: () {
                                localUser.isProfileVerified != null &&
                                        !localUser.isProfileVerified!
                                    ? Get.to(() => AccountVerificationScreen())
                                    : _topNavBarController.setPageIndex(2);
                              },
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () async {
                              if (localUser.isProfileVerified != null &&
                                  !localUser.isProfileVerified!) {
                                Get.to(() => AccountVerificationScreen());
                              } else {
                                if (_formController
                                    .isAccountTransactionBottomSheetShow
                                    .value) {
                                  _formController
                                      .isAccountTransactionBottomSheetShow(
                                          false);
                                } else if (_formController
                                    .showTransactionDetailsBottomSheet.value) {
                                  _formController
                                      .showTransactionDetailsBottomSheet(false);
                                }
                                _transactionController.clearData();
                                _formController.resetFormErrors();
                                _topNavBarController.setPageIndex(3);

                                _transactionController.onInit();
                                // _notificationController.onInit();
                                // showDialog(
                                //   context: context,
                                //   barrierDismissible: false,
                                //   builder: (context) {
                                //     return Container(
                                //       color: Colors.transparent,
                                //       child: LoadingAnimationWidget.inkDrop(
                                //         color: AppColors.primary,
                                //         size: 50,
                                //       ),
                                //     );
                                //   },
                                // );

                                // await _transactionController.getTransactions(localUser);
                                // if ((_transactionController.transactions != null &&
                                //         _transactionController.transactions!.isNotEmpty) ||
                                //     (_transactionController.soldTransactions != null &&
                                //         _transactionController
                                //             .soldTransactions!.isNotEmpty) ||
                                //     (_transactionController.transfertTransactions != null &&
                                //         _transactionController
                                //             .transfertTransactions!.isNotEmpty)) {
                                //   // SharedPreferences preferences =
                                //   //     await SharedPreferences.getInstance();
                                //   // print(_transactionController.transactions!.first.amount);
                                //   // preferences.setString(
                                //   //     "lastTransaction",
                                //   //     _transactionController.transactions!.isNotEmpty
                                //   //         ? _transactionController.transactions!.first.type!
                                //   //                     .toLowerCase() ==
                                //   //                 "recharge"
                                //   //             ? "+\$${(double.parse(_transactionController.transactions!.first.amount!) / (1 + (2 / 100))).round()}"
                                //   //             : "-\$${(double.parse(_transactionController.transactions!.first.amount!) / (1 - (3 / 100))).round()}"
                                //   //         : "\$00.00");

                                //   // localUser.lastTransaction =
                                //   //     preferences.getString("lastTransaction") ?? "";
                                //   Get.back();
                                // }
                              }
                              // print("object");
                              // localUser.isProfileVerified != null &&
                              //         !localUser.isProfileVerified!
                              //     ? Get.to(() => AccountVerificationScreen())
                              //     : _topNavBarController.setPageIndex(3);
                              // if (localUser.isProfileVerified != null &&
                              //     localUser.isProfileVerified!) {
                              //   showDialog(
                              //     context: context,
                              //     barrierDismissible: false,
                              //     builder: (context) {
                              //       return Container(
                              //         color: Colors.transparent,
                              //         child: LoadingAnimationWidget.inkDrop(
                              //           color: AppColors.primary,
                              //           size: 50,
                              //         ),
                              //       );
                              //     },
                              //   );

                              //   await _transactionController.getTransactions(localUser);
                              //   if ((_transactionController.transactions != null &&
                              //           _transactionController.transactions!.isNotEmpty) ||
                              //       (_transactionController.soldTransactions != null &&
                              //           _transactionController
                              //               .soldTransactions!.isNotEmpty) ||
                              //       (_transactionController.transfertTransactions != null &&
                              //           _transactionController
                              //               .transfertTransactions!.isNotEmpty)) {
                              //     // SharedPreferences preferences =
                              //     //     await SharedPreferences.getInstance();
                              //     // print(_transactionController.transactions!.first.amount);
                              //     // preferences.setString(
                              //     //     "lastTransaction",
                              //     //     _transactionController.transactions!.isNotEmpty
                              //     //         ? _transactionController.transactions!.first.type!
                              //     //                     .toLowerCase() ==
                              //     //                 "recharge"
                              //     //             ? "+\$${(double.parse(_transactionController.transactions!.first.amount!) / (1 + (2 / 100))).round()}"
                              //     //             : "-\$${(double.parse(_transactionController.transactions!.first.amount!) / (1 - (3 / 100))).round()}"
                              //     //         : "\$00.00");

                              //     // localUser.lastTransaction =
                              //     //     preferences.getString("lastTransaction") ?? "";
                              //     Get.back();
                              //   }
                              // }
                            },
                            child: TopNavItem(
                              title: "Historique",
                              icon: _topNavBarController.pageIndex.value == 3 ? Assets.icons.history2 : Assets.icons.history,
                              isActive:
                                  _topNavBarController.pageIndex.value == 3,
                              onTap: () {
                                if (localUser.isProfileVerified != null &&
                                    !localUser.isProfileVerified!) {
                                  Get.to(() => AccountVerificationScreen());
                                } else {
                                  if (_formController
                                      .isAccountTransactionBottomSheetShow
                                      .value) {
                                    _formController
                                        .isAccountTransactionBottomSheetShow(
                                            false);
                                  } else if (_formController
                                      .showTransactionDetailsBottomSheet
                                      .value) {
                                    _formController
                                        .showTransactionDetailsBottomSheet(
                                            false);
                                  }
                                  _transactionController.clearData();
                                  _formController.resetFormErrors();
                                  _topNavBarController.setPageIndex(3);
                                }
                              },
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () {
                              print("object");
                              _topNavBarController.setPageIndex(4);
                              /*localUser.isProfileVerified != null &&
                                      !localUser.isProfileVerified!
                                  ? Get.to(() => AccountVerificationScreen())
                                  : _topNavBarController.setPageIndex(4);*/
                            },
                            child: TopNavItem(
                              title: "Support",
                              icon: Assets.icons.service,
                              isActive:
                                  _topNavBarController.pageIndex.value == 4,
                              onTap: () {
                                localUser.isProfileVerified != null &&
                                        !localUser.isProfileVerified!
                                    ? Get.to(() => AccountVerificationScreen())
                                    : (_topNavBarController.setPageIndex(4));
                              },
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            )
          : const SizedBox();
    });
  }
}
