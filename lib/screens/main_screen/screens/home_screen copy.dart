import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gleap_sdk/gleap_sdk.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/notification_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/account_verification_screen/account_verification_description_screen.dart';
import 'package:secure_app/widgets/small_card_widget.dart';
import 'package:secure_app/screens/main_screen/screens/cards_screen/add_card_description_screen.dart';
import 'package:secure_app/screens/main_screen/screens/history_screen.dart';
import 'package:secure_app/screens/notification_screen/notification_screen.dart';
import 'package:secure_app/screens/profile_screen/profile_screen.dart';
import 'package:secure_app/widgets/primary_button.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shimmer/shimmer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FormController _formController = Get.put(FormController());

  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());

  final TransactionController _transactionController =
      Get.put(TransactionController());

  final NotificationController _notificationController =
      Get.put(NotificationController());
  final UserController _userController = Get.put(UserController());

  final List<String> tabListItem = [
    "Tout",
    "Solde",
    "Cartes",
    "Transferts",
  ];

  StreamSubscription? connection;
  bool isOnline = false;
  bool isDeviceConnected = false;

  @override
  void initState() {
    _userController.isProfileExist(localUser.photo!);
    _notificationController.countUnreadMessages(_notificationController
        .notifications!
        .where((notification) => notification.status == "unread")
        .toList()
        .length);
    Gleap.setLanguage(language: 'fr-FR');
    Gleap.initialize(token: 'TPn5IL5Nia4C57aRWoXebaZdnNnYZVLc');
    Gleap.showFeedbackButton(false);

    _transactionController.onInit();
    connection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      // whenevery connection status is changed.
      if (result != ConnectivityResult.none) {
        print("object, $result");
        isDeviceConnected = await InternetConnectionChecker().hasConnection;

        print("deviceConnected, $isDeviceConnected");

        setState(() {
          isOnline = true;
        });
      }
      if (result == ConnectivityResult.none) {
        setState(() {
          isOnline = false;
          isDeviceConnected = false;
        });
      }
    });
    initPlatform();
    super.initState();
  }

  Future<void> initPlatform() async {
    OneSignal.login(localUser.id!);
    // print("subscriptionIds, ${OneSignal.User.pushSubscription.id}");
    // print("token , ${OneSignal.User.pushSubscription.token}");
    // OneSignal.User.pushSubscription.addObserver((state) {
    //   //

    //   print("state, ${state.current.jsonRepresentation()}");
    // });
  }

  getConnectionStatus() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    // whenevery connection status is changed.
    if (connectivityResult != ConnectivityResult.none) {
      print("object, $connectivityResult");
      isDeviceConnected = await InternetConnectionChecker.createInstance(
        checkTimeout: const Duration(seconds: 1), // Custom check timeout
        checkInterval: const Duration(seconds: 1), // Custom check interval
      ).hasConnection;

      print("deviceConnected, $isDeviceConnected");

      setState(() {
        isOnline = true;
      });

      _userController.isProfileExist(localUser.photo!);
    }
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isOnline = false;
        isDeviceConnected = false;
      });
    }
  }

  @override
  void dispose() {
    connection!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return GestureDetector(
      onTap: () {
        if (_formController.isAccountTransactionBottomSheetShow.value) {
          _formController.isAccountTransactionBottomSheetShow(false);
          _transactionController.clearData();
          _formController.resetFormErrors();
        } else if (_formController.showTransactionDetailsBottomSheet.value) {
          _formController.showTransactionDetailsBottomSheet(false);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 38.0, left: 22.0, right: 22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.offAll(() => const ProfileScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      badges.Badge(
                          badgeAnimation: const badges.BadgeAnimation.slide(
                              animationDuration: Duration(seconds: 0),
                              colorChangeAnimationDuration:
                                  Duration(seconds: 0),
                              loopAnimation: false,
                              toAnimate: false,
                              slideTransitionPositionTween: badges.SlideTween(
                                  begin: Offset(0, 0), end: Offset(0.0, 0.0))),
                          position: badges.BadgePosition.bottomEnd(
                              bottom: -10, end: -12),
                          badgeStyle: const badges.BadgeStyle(
                              badgeColor: Colors.transparent),
                          badgeContent: SvgPicture.asset(
                            Assets.icons.certify,
                            // width: 30.0,
                            fit: BoxFit.cover,
                          ),
                          child: Obx(() {
                            return _userController.isProfileImageExist.value &&
                                    localUser.photo != null &&
                                    localUser.photo!.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(54),
                                    child: Image.network(
                                      localUser.photo!,
                                      width: 50.0,
                                      fit: BoxFit.contain,
                                    ),
                                  )
                                : SvgPicture.asset(
                                    Assets.icons.sekureUserCircle);
                          })),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: AppStyles.textStyle(
                                    //TODO: Change font to poppins
                                    color: AppColors.dark,
                                    size: 16.0),
                                children: [
                                  const TextSpan(text: "Salut "),
                                  TextSpan(
                                      text: localUser.name!.split(" ")[0],
                                      style: AppStyles.textStyle(
                                          //TODO: Change font to poppins
                                          color: AppColors.dark,
                                          weight: FontWeight.w700,
                                          size: 16.0))
                                ],
                              ),
                            ),
                            Text("voir mon profil",
                                style: AppStyles.textStyle(
                                    //TODO: Change font to poppins
                                    color: AppColors.grey,
                                    size: 11.0))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.icons.cameroun.path,
                        width: 38.0,
                      ),
                      const SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const NotificationScreen());
                        },
                        child: badges.Badge(
                          badgeAnimation: const badges.BadgeAnimation.slide(
                              animationDuration: Duration(seconds: 0),
                              colorChangeAnimationDuration:
                                  Duration(seconds: 0),
                              loopAnimation: false,
                              toAnimate: false,
                              slideTransitionPositionTween: badges.SlideTween(
                                  begin: Offset(0, 0), end: Offset(0.0, 0.0))),
                          position: badges.BadgePosition.bottomEnd(
                              bottom: -10, end: -7),
                          badgeStyle: const badges.BadgeStyle(
                            badgeColor: AppColors.primary,
                            // padding: EdgeInsets.all(10.0),
                          ),
                          badgeContent: Obx(() {
                            return Text(
                              _notificationController.countUnreadMessages.value
                                  .toString(),
                              style: AppStyles.textPoppinsStyle(
                                  //TODO: Change font to poppins
                                  color: AppColors.white,
                                  size: 15.0),
                            );
                          }),
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: const BoxDecoration(
                                color: AppColors.imputBg,
                                shape: BoxShape.circle),
                            child: Center(
                                child: SvgPicture.asset(Assets.icons.bell)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Container(
                //   padding: EdgeInsets.all(20.0),
                //   decoration: BoxDecoration(
                //       color: AppColors.imputBg, shape: BoxShape.circle),
                //   child: Center(child: SvgPicture.asset(Assets.icons.bell)),
                // )
              ],
            ),
          ),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 22.0, right: 22.0, top: 14.0),
              child: IntrinsicWidth(
                child: Obx(() {
                  return Stack(
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: SizedBox(
                                  height: 380,
                                  // decoration: BoxDecoration(),
                                  child: SvgPicture.asset(
                                    Assets.images.rect,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              Positioned(
                                  right: 15.0,
                                  top: 25.0,
                                  child: SvgPicture.asset(
                                    Assets.icons.menu,
                                    width: 25.0,
                                  )),
                              Positioned(
                                right: 0.0,
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: SvgPicture.asset(
                                        Assets.images.topRectBg)),
                              ),
                            ],
                          )),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 32.0, left: 30.0, right: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(Assets.icons.appIcon.path),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Recharge",
                                      style: AppStyles.textStyle(
                                          color: AppColors.white,
                                          size: 32.0,
                                          // height: 0.99,
                                          weight: FontWeight.w500),
                                    ),
                                    Text(
                                      "ton compte",
                                      style: AppStyles.textStyle(
                                          color: AppColors.white,
                                          size: 32.0,
                                          height: 0.3,
                                          weight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  // _transactionController.transactions!
                                  //     .sort((a, b) {
                                  //   DateTime dateA = DateTime.parse(a.createdAt!);
                                  //   DateTime dateB = DateTime.parse(b.createdAt!);
                                  //   return dateA.compareTo(dateB);
                                  // });
                                  // await _transactionController
                                  //     .getTransactions(localUser);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(7.0)),
                                  padding: const EdgeInsets.all(11.0),
                                  // margin: const EdgeInsets.only(right: 30.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Solde total",
                                          style: AppStyles.textStyle(
                                              color: AppColors.dark,
                                              weight: FontWeight.w500,
                                              size: 20.0)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          _transactionController.isLoading.value
                                              ? Shimmer.fromColors(
                                                  enabled: true,
                                                  baseColor:
                                                      Colors.grey.shade300,
                                                  highlightColor:
                                                      Colors.grey.shade100,
                                                  child: Container(
                                                    height: 20.0,
                                                    width: 70.0,
                                                    color: AppColors.grey300,
                                                  ),
                                                )
                                              : Row(
                                                  children: [
                                                    // _topNavBarController
                                                    //         .isBalanceVisible
                                                    //         .value
                                                    //     ? const Text(
                                                    //         "",
                                                    //         style: TextStyle(
                                                    //             color: AppColors
                                                    //                 .dark,
                                                    //             fontWeight:
                                                    //                 FontWeight
                                                    //                     .w500,
                                                    //             fontSize: 16.0),
                                                    //       )
                                                    //     : const SizedBox(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 2.0),
                                                      child: Text(
                                                        !_topNavBarController
                                                                .isBalanceVisible
                                                                .value
                                                            ? "••••••"
                                                            : localUser.currentBalance !=
                                                                        null &&
                                                                    localUser
                                                                            .sponsorshipBalance !=
                                                                        null
                                                                ? _transactionController
                                                                        .formatAmount((double.parse(localUser.currentBalance!) +
                                                                            int.parse(localUser.sponsorshipBalance!)))
                                                                        .toString() +
                                                                    "FCFA"
                                                                : "00,00",
                                                        style: AppStyles
                                                            .textPoppinsStyle(
                                                                color: AppColors
                                                                    .dark,
                                                                weight:
                                                                    FontWeight
                                                                        .w500,
                                                                size: 18.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                          GestureDetector(
                                              onTap: () {
                                                _topNavBarController
                                                    .isBalanceVisible(
                                                        !_topNavBarController
                                                            .isBalanceVisible
                                                            .value);
                                              },
                                              child: Icon(
                                                _topNavBarController
                                                        .isBalanceVisible.value
                                                    ? FontAwesomeIcons.eye
                                                    : FontAwesomeIcons.eyeSlash,
                                                size: 22.0,
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(7.0)),
                                padding: const EdgeInsets.all(11.0),
                                margin: const EdgeInsets.only(top: 9.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Derniere transaction",
                                      style: AppStyles.textStyle(
                                          color: AppColors.dark,
                                          size: 12.0,
                                          weight: FontWeight.w500),
                                    ),
                                    _transactionController.isLoading.value
                                        ? Shimmer.fromColors(
                                            enabled: true,
                                            baseColor: Colors.grey.shade300,
                                            highlightColor:
                                                Colors.grey.shade100,
                                            child: Container(
                                              height: 20.0,
                                              width: 70.0,
                                              color: AppColors.grey300,
                                            ),
                                          )
                                        : Text(
                                            !_topNavBarController
                                                    .isBalanceVisible.value
                                                ? "••••••"
                                                : _transactionController
                                                        .transactions!
                                                        .isNotEmpty
                                                    ? _transactionController
                                                                    .transactions!
                                                                    .first
                                                                    .type!
                                                                    .toLowerCase() ==
                                                                "recharge" ||
                                                            (_transactionController
                                                                        .transactions!
                                                                        .first
                                                                        .type!
                                                                        .toLowerCase() ==
                                                                    "transfert" &&
                                                                _transactionController
                                                                        .transactions!
                                                                        .first
                                                                        .number !=
                                                                    localUser
                                                                        .phone)
                                                        ? "+${(double.parse(_transactionController.transactions!.first.amount!))} XAF"
                                                        : "-${(double.parse(_transactionController.transactions!.first.amount!))} XAF"
                                                    : "00.00",
                                            // "${_transactionController.lastTransactionType}\$${_transactionController.formatAmount(double.parse(_transactionController.lastTransactionAmount.toString()))}",
                                            style: const TextStyle(
                                                color: AppColors.dark,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.0))
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: AppColors.dark,
                                    borderRadius: BorderRadius.circular(7.0)),
                                padding: const EdgeInsets.all(11.0),
                                margin: const EdgeInsets.only(top: 9.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Solde Parrainage",
                                      style: AppStyles.textStyle(
                                          color: AppColors.white,
                                          size: 12.0,
                                          weight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: _transactionController
                                              .isLoading.value
                                          ? Shimmer.fromColors(
                                              enabled: true,
                                              baseColor: Colors.grey.shade300,
                                              highlightColor:
                                                  Colors.grey.shade100,
                                              child: Container(
                                                height: 20.0,
                                                width: 70.0,
                                                color: AppColors.grey
                                                    .withOpacity(.3),
                                              ),
                                            )
                                          : Text(
                                              !_topNavBarController
                                                      .isBalanceVisible.value
                                                  ? "••••••"
                                                  : localUser.sponsorshipBalance !=
                                                              null &&
                                                          localUser
                                                                  .sponsorshipBalance !=
                                                              "0"
                                                      ? "+${_transactionController.formatAmount(double.parse(localUser.sponsorshipBalance!))} XAF"
                                                      : "00.00",
                                              style: const TextStyle(
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13.0)),
                                    )
                                  ],
                                ),
                              ),
                              // Container(
                              //     margin: const EdgeInsets.only(
                              //         top: 34.0, bottom: 22.0),
                              //     height: 1.0,
                              //     color: AppColors.dark),
                              // Container(
                              //   decoration: BoxDecoration(
                              //       color: AppColors.white,
                              //       borderRadius: BorderRadius.circular(7.0)),
                              //   padding: const EdgeInsets.all(11.0),
                              //   margin: const EdgeInsets.only(top: 9.0),
                              //   child: const Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Text("Solde Parrainage"),
                              //       Text("+\$00,00")
                              //     ],
                              //   ),
                              // ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () async {
                                            await getConnectionStatus();
                                            print(
                                                "StatusInternet, $isOnline, $isDeviceConnected");
                                            if (isOnline && isDeviceConnected) {
                                              if (_formController
                                                  .isAccountTransactionBottomSheetShow
                                                  .value) {
                                                _formController
                                                    .isAccountTransactionBottomSheetShow(
                                                        false);
                                                _transactionController
                                                    .clearData();
                                                _formController
                                                    .resetFormErrors();
                                              } else {
                                                _formController
                                                    .isRechargeBottomSheet(
                                                        true);
                                                _formController
                                                    .isAccountTransactionBottomSheetShow(
                                                        true);
                                              }
                                              if (_formController
                                                  .showTransactionDetailsBottomSheet
                                                  .value) {
                                                _formController
                                                    .showTransactionDetailsBottomSheet(
                                                        false);
                                              }
                                            } else {
                                              Constants.snackBar(
                                                  bgColor: Colors.red,
                                                  textColor: Colors.white,
                                                  description:
                                                      'Aucune connexion internet !');
                                            }
                                          },
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 16.0),
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  FittedBox(
                                                    child: Text(
                                                      "Recharger",
                                                      style:
                                                          AppStyles.textStyle(
                                                              color: AppColors
                                                                  .dark,
                                                              size: 14.0,
                                                              weight: FontWeight
                                                                  .w500),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5.0),
                                                  Container(
                                                    // height: 30.0,
                                                    // width: 30.0,
                                                    // margin: EdgeInsets.only(right: 16.0),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    decoration:
                                                        const BoxDecoration(
                                                            color:
                                                                AppColors.dark,
                                                            shape: BoxShape
                                                                .circle),
                                                    child: SvgPicture.asset(
                                                        Assets.icons.remove),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            if (_formController
                                                .isAccountTransactionBottomSheetShow
                                                .value) {
                                              _formController
                                                  .isAccountTransactionBottomSheetShow(
                                                      false);
                                              _transactionController
                                                  .clearData();
                                              _formController.resetFormErrors();
                                            } else {
                                              _formController
                                                  .isRechargeBottomSheet(false);
                                              _formController
                                                  .isAccountTransactionBottomSheetShow(
                                                      true);
                                            }
                                            if (_formController
                                                .showTransactionDetailsBottomSheet
                                                .value) {
                                              _formController
                                                  .showTransactionDetailsBottomSheet(
                                                      false);
                                            }
                                          },
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 16.0),
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  FittedBox(
                                                    child: Text(
                                                      "Retirer",
                                                      style:
                                                          AppStyles.textStyle(
                                                              color: AppColors
                                                                  .dark,
                                                              size: 14.0,
                                                              weight: FontWeight
                                                                  .w500),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5.0),
                                                  Container(
                                                    // height: 30.0,
                                                    // width: 30.0,
                                                    // margin: EdgeInsets.only(right: 16.0),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColors.primary,
                                                        border: Border.all(
                                                            color:
                                                                AppColors.dark,
                                                            width: 2.0),
                                                        shape: BoxShape.circle),
                                                    child: SvgPicture.asset(
                                                        Assets.icons.recharge),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // SvgPicture.asset(Assets.icons.recharge),
                      // SvgPicture.asset(Assets.icons.remove)
                    ],
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 28.0, top: 26.0, bottom: 8.0, right: 28.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Recharge ton compte Sekure par Mobile money avant de transferer ou de recharger ta carte virtuelle',
                    style: AppStyles.textStyle(
                      color: const Color(0xFF1E1E1E),
                      size: 14,
                      weight: FontWeight.w500,
                      height: 0.9,
                      // letterSpacing: -0.07,
                    ),
                  ),
                ),
                SizedBox(width: Constants.screenWidth(context) / 8),
                SvgPicture.asset(
                  Assets.icons.heart,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                top: 18.0, bottom: 26.0, left: 22.0, right: 22.0),
            height: 3.0,
            color: AppColors.dark,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Payer n’importe quoi ',
                    style: AppStyles.textStyle(
                      color: const Color(0xFF242424),
                      size: 35,
                      weight: FontWeight.w300,
                      height: 0.9,
                      // letterSpacing: -0.17,
                    ),
                  ),
                  TextSpan(
                    text: 'en ligne depuis l',
                    style: AppStyles.textStyle(
                      color: const Color(0xFF18BC7A),
                      size: 35,
                      weight: FontWeight.w500,
                      height: 0.9,
                      // letterSpacing: -0.17,
                    ),
                  ),
                  const TextSpan(
                    text: "'",
                    style: TextStyle(
                      color: Color(0xFF18BC7A),
                      fontSize: 35,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0.9,
                      letterSpacing: -0.17,
                    ),
                  ),
                  TextSpan(
                    text: 'Afrique',
                    style: AppStyles.textStyle(
                      color: const Color(0xFF18BC7A),
                      size: 35,
                      weight: FontWeight.w500,
                      height: 0.9,
                      // letterSpacing: -0.17,
                    ),
                  ),
                  TextSpan(
                    text: ' ',
                    style: AppStyles.textStyle(
                      color: const Color(0xFF18BC7A),
                      size: 35,
                      weight: FontWeight.w300,
                      height: 0.9,
                      // letterSpacing: -0.17,
                    ),
                  ),
                  TextSpan(
                    text: 'va devenir plus ',
                    style: AppStyles.textStyle(
                      color: const Color(0xFF242424),
                      size: 35,
                      weight: FontWeight.w300,
                      height: 0.9,
                      // letterSpacing: -0.17,
                    ),
                  ),
                  TextSpan(
                    text: 'facile',
                    style: AppStyles.textStyle(
                      color: const Color(0xFF18BC7A),
                      size: 35,
                      weight: FontWeight.w500,
                      height: 0.9,
                      // letterSpacing: -0.17,
                    ),
                  ),
                  TextSpan(
                    text: ' avec les cartes ',
                    style: AppStyles.textStyle(
                      color: const Color(0xFF242424),
                      size: 35,
                      weight: FontWeight.w300,
                      height: 0.9,
                      // letterSpacing: -0.17,
                    ),
                  ),
                  TextSpan(
                    text: 'sekure',
                    style: AppStyles.textStyle(
                      color: const Color(0xFF18BC7A),
                      size: 35,
                      weight: FontWeight.w500,
                      height: 0.9,
                      // letterSpacing: -0.17,
                    ),
                  ),
                  TextSpan(
                    text: '...',
                    style: AppStyles.textStyle(
                      color: const Color(0xFF242424),
                      size: 35,
                      weight: FontWeight.w300,
                      height: 0.9,
                      // letterSpacing: -0.17,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //TODO: Add this when we have cards
          // Padding(
          //   padding: const EdgeInsets.only(
          //       left: 22.0, right: 22.0, top: 20.0, bottom: 33.0),
          //   child: SizedBox(
          //     height: 140.0,
          //     child: ListView.builder(
          //         shrinkWrap: true,
          //         padding: EdgeInsets.zero,
          //         itemCount: 3,
          //         scrollDirection: Axis.horizontal,
          //         itemBuilder: ((context, index) {
          //           return GestureDetector(
          //             onTap: () {
          //               _topNavBarController.setPageIndex(7);
          //             },
          //             child: SmallCardComponent(
          //               isVisa: index.isEven,
          //               color: index == 0
          //                   ? AppColors.cardColor1
          //                   : index == 1
          //                       ? AppColors.cardColor2
          //                       : AppColors.primary,
          //             ),
          //           );
          //         })),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 22.0, right: 22.0, top: 33.0),
            child: GestureDetector(
              onTap: () {
                _topNavBarController.pageIndex(5);
                _topNavBarController.scrollController.jumpTo(2);
              },
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xA3FFDF95),
                      blurRadius: 20,
                      offset: Offset(0, 15),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: const PrimaryButton(
                  textButton: "Créer une nouvelle carte",
                  buttonColor: AppColors.primary,
                  hasIcon: true,
                  icon: FontAwesomeIcons.plus,
                  circleIconColor: AppColors.white,
                  iconColor: AppColors.primary,
                ),
              ),
            ),
          ),
          HistoryScreen(isSeeMoreVisibles: true, fem: fem, ffem: ffem)
        ],
      ),
    );
  }
}
