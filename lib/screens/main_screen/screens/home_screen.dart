import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gleap_sdk/gleap_sdk.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:secure_app/controllers/card_controller.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/info_controller.dart';
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
import 'package:secure_app/screens/main_screen/components/create_new_card_card.dart';
import 'package:secure_app/widgets/small_card_widget.dart';
import 'package:secure_app/screens/notification_screen/notification_screen.dart';
import 'package:secure_app/screens/profile_screen/profile_screen.dart';
import 'package:secure_app/widgets/info_component.dart';
import 'package:secure_app/widgets/loading_info_component.dart';
import 'package:shimmer/shimmer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'history_screen.dart';

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
  final CardController _cardController = Get.put(CardController());
  final InfoController _infoController = Get.put(InfoController());

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
    _cardController.onInit();
    _infoController.onInit();
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
      child: SizedBox(
        width: double.infinity,
        child: Container(
          width: double.infinity,
          height: _cardController.cards!.isNotEmpty ? 1475*fem : 1295*fem,
          decoration: BoxDecoration (
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x3f000000),
                offset: Offset(0*fem, 0.5*fem),
                blurRadius: 1*fem,
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0*fem,
                top: 0*fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(22*fem, 21*fem, 19*fem, 22*fem),
                  width: 393*fem,
                  height: 599*fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      //Header
                      Container(
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 19.5*fem),
                        width: double.infinity,
                        height: 55.5*fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.offAll(() => const ProfileScreen());
                              },
                              child: Container(
                                //padding: EdgeInsets.fromLTRB(0*fem, 2*fem, 142*fem, 0*fem),
                                height: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 0*fem),
                                      width: 52*fem,
                                      height: double.infinity,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0*fem,
                                            top: 0*fem,
                                            child: Align(
                                              child: SizedBox(
                                                width: 50*fem,
                                                height: 50*fem,
                                                child: TextButton(
                                                  onPressed: () {
                                                    Get.offAll(() => const ProfileScreen());
                                                  },
                                                  style: TextButton.styleFrom (
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration (
                                                      borderRadius: BorderRadius.circular(25*fem),
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
                                                          Assets.icons.sekureUserCircle,
                                                          fit: BoxFit.cover);
                                                    })
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 31*fem,
                                            top: 33*fem,
                                            child: Align(
                                              child: SizedBox(
                                                width: 21*fem,
                                                height: 21*fem,
                                                child: Image.asset(
                                                  'assets/images/group-169-2pK.png',
                                                  width: 21*fem,
                                                  height: 21*fem,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0*fem, 11*fem, 0*fem, 15.5*fem),
                                      height: double.infinity,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
                                            child: RichText(
                                              text: TextSpan(
                                                style: AppStyles.textStyle (
                                                  size: 16*ffem,
                                                  weight: FontWeight.w400,
                                                  height: 0.75*ffem/fem,
                                                  letterSpacing: -0.08*fem,
                                                  color: AppColors.chatBubleBg,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: 'Salut, ',
                                                    style: AppStyles.textStyle (
                                                      size: 16*ffem,
                                                      weight: FontWeight.w400,
                                                      height: 0.75*ffem/fem,
                                                      letterSpacing: -0.08*fem,
                                                      color: AppColors.chatBubleBg,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: localUser.name!.split(" ")[0],
                                                    style: AppStyles.textStyle (
                                                      size: 16*ffem,
                                                      weight: FontWeight.w700,
                                                      height: 0.75*ffem/fem,
                                                      letterSpacing: -0.08*fem,
                                                      color: AppColors.chatBubleBg,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'voir mon profil ',
                                            style: AppStyles.textStyle (
                                              fontFamily: 'Poppins',
                                              size: 11*ffem,
                                              weight: FontWeight.w400,
                                              height: 1.0909090909*ffem/fem,
                                              letterSpacing: -0.055*fem,
                                              color: AppColors.seeProfilColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(() => const NotificationScreen());
                              },
                              style: TextButton.styleFrom (
                                padding: EdgeInsets.zero,
                              ),
                              child: SizedBox(
                                width: 52*fem,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0*fem,
                                      top: 0*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 47.84*fem,
                                          height: 48.88*fem,
                                          child: Image.asset(
                                            'assets/images/frame-91-eDy.png',
                                            width: 47.84*fem,
                                            height: 48.88*fem,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 29*fem,
                                      top: 31.5*fem,
                                      child: Container(
                                        width: 23*fem,
                                        height: 24*fem,
                                        decoration: BoxDecoration (
                                          color: AppColors.primary,
                                          borderRadius: BorderRadius.circular(44*fem),
                                        ),
                                        child: Center(
                                          child: Obx((){
                                            return Text(
                                              _notificationController.countUnreadMessages.value
                                                  .toString(),
                                              style: AppStyles.textStyle (
                                                fontFamily: 'Poppins',
                                                size: 12*ffem,
                                                weight: FontWeight.w400,
                                                height: 2*ffem/fem,
                                                color: AppColors.white,
                                              ),
                                            );
                                          })
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                      //card
                      Container(
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 0*fem),
                        padding: EdgeInsets.fromLTRB(34*fem, 0*fem, 0*fem, 27*fem),
                        width: 349*fem,
                        decoration: const BoxDecoration (
                          image: DecorationImage (
                            fit: BoxFit.cover,
                            image: AssetImage (
                              'assets/images/rectangle-1.png',
                            ),
                          ),
                        ),
                        child: Obx( () {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 159*fem,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 82*fem,
                                      top: 0*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 233*fem,
                                          height: 159*fem,
                                          child: Image.asset(
                                            'assets/images/frame-127.png',
                                            width: 233*fem,
                                            height: 159*fem,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0*fem,
                                      top: 80*fem,
                                      child: Align(
                                        child: SizedBox(
                                          //width: 195*fem,
                                          height: 59*fem,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                              children : [
                                                Text(
                                                  'Recharge ',
                                                  style: AppStyles.textStyle (
                                                    size: 34*ffem,
                                                    weight: FontWeight.w500,
                                                    height: 0.8676470588*ffem/fem,
                                                    letterSpacing: -0.17*fem,
                                                    color: AppColors.white,
                                                  ),
                                                ),
                                                Text(
                                                  'ton compte ',
                                                  style: AppStyles.textStyle (
                                                    size: 34*ffem,
                                                    weight: FontWeight.w500,
                                                    height: 0.8676470588*ffem/fem,
                                                    letterSpacing: -0.17*fem,
                                                    color: AppColors.white,
                                                  ),
                                                ),
                                          ]
                                          )
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 278*fem,
                                      top: 24*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 23*fem,
                                          height: 8*fem,
                                          child: Image.asset(
                                            'assets/images/group-864.png',
                                            width: 23*fem,
                                            height: 8*fem,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0*fem,
                                      top: 32*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 29*fem,
                                          height: 29*fem,
                                          child: TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom (
                                              padding: EdgeInsets.zero,
                                            ),
                                            child: Image.asset(Assets.icons.appIcon.path,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 34*fem, 13*fem),
                                width: 281*fem,
                                height: 122*fem,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(7*fem),
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(18*fem, 5.5*fem, 15*fem, 4*fem),
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration (
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(7*fem),
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 89*fem,
                                          height: double.infinity,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
                                                //width: 70*fem,
                                                height: 60.5*fem,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      left: 0.4998779297*fem,
                                                      top: 0*fem,
                                                      child: Align(
                                                        child: SizedBox(
                                                          //width: 44*fem,
                                                          height: 35*fem,
                                                          child: Text(
                                                            'Solde XAF',
                                                            style: AppStyles.textStyle (
                                                              fontFamily: 'Lufga',
                                                              size: 11*ffem,
                                                              weight: FontWeight.w300,
                                                              height: 3.1363636364*ffem/fem,
                                                              letterSpacing: -0.055*fem,
                                                              color: AppColors.txtSoldeColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 0*fem,
                                                      top: 25.5*fem,
                                                      child: Align(
                                                        child: _transactionController
                                                            .isLoading.value
                                                            ? Shimmer.fromColors(
                                                          enabled: true,
                                                          baseColor: Colors
                                                              .grey.shade300,
                                                          highlightColor:
                                                          Colors.grey
                                                              .shade100,
                                                          child: Container(
                                                            height: 20*fem,
                                                            width: 120*fem,
                                                            color: AppColors
                                                                .grey300,
                                                          ),
                                                        )
                                                            : SizedBox(
                                                          //width: 120*fem,
                                                          height: 35*fem,
                                                          child: Text(
                                                            !_topNavBarController
                                                                .isXAFBalanceVisible
                                                                .value
                                                                ? "••••••"
                                                                : localUser.currentBalance != null &&
                                                                localUser.sponsorshipBalance !=
                                                                    null
                                                                ? _transactionController
                                                                .formatAmount((double.parse(localUser.currentBalance!) + int.parse(localUser.sponsorshipBalance!)))
                                                                .toString()
                                                                : '00,00',
                                                            style: AppStyles.textStyle (
                                                              fontFamily: 'Poppins',
                                                              size: 25*ffem,
                                                              weight: FontWeight.w500,
                                                              height: 1.38*ffem/fem,
                                                              letterSpacing: -0.125*fem,
                                                              color: AppColors.txtSoldeColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                height: 47*fem,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      left: 0*fem,
                                                      top: 0*fem,
                                                      child: Align(
                                                        child: SizedBox(
                                                          //width: 89*fem,
                                                          height: 35*fem,
                                                          child: Text(
                                                            'Dernière transaction:',
                                                            style: AppStyles.textStyle (
                                                              size: 10*ffem,
                                                              weight: FontWeight.w400,
                                                              height: 3.45*ffem/fem,
                                                              letterSpacing: -0.05*fem,
                                                              color: AppColors.grey300,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 0*fem,
                                                      top: 12*fem,
                                                      child: Align(
                                                        child: SizedBox(
                                                          //width: 29*fem,
                                                          height: 35*fem,
                                                          child: _transactionController
                                                              .isLoading.value
                                                              ? Shimmer.fromColors(
                                                            enabled: true,
                                                            baseColor: Colors
                                                                .grey.shade300,
                                                            highlightColor: Colors
                                                                .grey.shade100,
                                                            child: Container(
                                                              margin: EdgeInsets.only(top: 10*fem),
                                                              height: 35*fem,
                                                              width: 40*fem,
                                                              color:
                                                              AppColors.grey300,
                                                            ),
                                                          )
                                                              : _transactionController
                                                              .transactions!
                                                              .isNotEmpty
                                                              ? Row(
                                                            children: [
                                                              Text(
                                                                _transactionController.transactions!.first.type!.toLowerCase() ==
                                                                    "recharge" ||
                                                                    (_transactionController.transactions!.first.type!.toLowerCase() ==
                                                                        "transfert" &&
                                                                        _transactionController.transactions!.first.number !=
                                                                            localUser.phone)
                                                                    ? "+"
                                                                    : "-",
                                                                style: AppStyles.textStyle (
                                                                  size: 9*ffem,
                                                                  fontFamily: 'Poppins',
                                                                  weight: FontWeight.w500,
                                                                  height: 3.8333333333*ffem/fem,
                                                                  letterSpacing: -0.045*fem,
                                                                  color: AppColors.txtSoldeColor,
                                                                ),
                                                              ),
                                                              Text(
                                                                !_topNavBarController
                                                                    .isXAFBalanceVisible
                                                                    .value
                                                                    ? "••••••"
                                                                    : _transactionController
                                                                    .transactions!
                                                                    .isNotEmpty
                                                                    ? _transactionController.transactions!.first.type!.toLowerCase() == "recharge" ||
                                                                    (_transactionController.transactions!.first.type!.toLowerCase() == "transfert" && _transactionController.transactions!.first.number != localUser.phone)
                                                                    ? "${(double.parse(_transactionController.transactions!.first.amount!))} XAF"
                                                                    : "${(double.parse(_transactionController.transactions!.first.amount!))} XAF"
                                                                    : "00.00",
                                                                // "${_transactionController.lastTransactionType}\$${_transactionController.formatAmount(double.parse(_transactionController.lastTransactionAmount.toString()))}",
                                                                style: AppStyles.textStyle (
                                                                  size: 9*ffem,
                                                                  fontFamily: 'Poppins',
                                                                  weight: FontWeight.w500,
                                                                  height: 3.8333333333*ffem/fem,
                                                                  letterSpacing: -0.045*fem,
                                                                  color: AppColors.txtSoldeColor,
                                                                ),
                                                              ),
                                                            ],
                                                          ) :     Text(
                                                            "+00,00 Xaf",
                                                            style: AppStyles.textStyle (
                                                              size: 9*ffem,
                                                              fontFamily: 'Poppins',
                                                              weight: FontWeight.w500,
                                                              height: 3.8333333333*ffem/fem,
                                                              letterSpacing: -0.045*fem,
                                                              color: AppColors.txtSoldeColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(111*fem, 10.5*fem, 0*fem, 0*fem),
                                          height: double.infinity,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 9*fem),
                                                width: 19*fem,
                                                height: 19*fem,
                                                decoration: BoxDecoration (
                                                  borderRadius: BorderRadius.circular(9.5*fem),
                                                  image: const DecorationImage (
                                                    fit: BoxFit.cover,
                                                    image: AssetImage (
                                                      'assets/images/ellipse-25-bg.png',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: double.infinity,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _topNavBarController
                                                              .isXAFBalanceVisible(
                                                              !_topNavBarController
                                                                  .isXAFBalanceVisible
                                                                  .value);
                                                        });
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 47*fem),
                                                        width: 14*fem,
                                                        height: 11*fem,
                                                        //child: Image.asset(
                                                        //'assets/images/vector-stroke-1ET.png',
                                                        //width: 14*fem,
                                                        //height: 11*fem,
                                                        //),
                                                        child: Icon(
                                                          _topNavBarController
                                                              .isXAFBalanceVisible
                                                              .value
                                                              ? FontAwesomeIcons
                                                              .eye
                                                              : FontAwesomeIcons
                                                              .eyeSlash,
                                                          size: 14*fem,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.fromLTRB(0*fem, 9*fem, 0*fem, 0*fem),
                                                      child: Text(
                                                        'CMR',
                                                        style: AppStyles.textStyle (
                                                          size: 11*ffem,
                                                          weight: FontWeight.w700,
                                                          height: 3.1363636364*ffem/fem,
                                                          letterSpacing: -0.055*fem,
                                                          color: AppColors.txtSoldeColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 34*fem, 0*fem),
                                width: 281*fem,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom (
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: 57*fem,
                                          decoration: BoxDecoration (
                                            color: AppColors.txtSoldeColor,
                                            borderRadius: BorderRadius.circular(7*fem),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 14*fem,
                                                top: 1*fem,
                                                child: SizedBox(
                                                  //width: 249*fem,
                                                  height: 38*fem,
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 111*fem, 3*fem),
                                                        child: Text(
                                                          'Solde Parrainage',
                                                          style: AppStyles.textStyle (
                                                            size: 12*ffem,
                                                            weight: FontWeight.w500,
                                                            height: 2.875*ffem/fem,
                                                            letterSpacing: -0.06*fem,
                                                            color: AppColors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        //margin: EdgeInsets.fromLTRB(0*fem, 3*fem, 0*fem, 0*fem),
                                                        child: _transactionController
                                                            .isLoading.value
                                                            ? Shimmer.fromColors(
                                                          enabled: true,
                                                          baseColor:
                                                          Colors.grey.shade300,
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
                                                              .isUSDBalanceVisible
                                                              .value
                                                              ? "••••••"
                                                              : localUser.sponsorshipBalance !=
                                                              null &&
                                                              localUser
                                                                  .sponsorshipBalance !=
                                                                  "0"
                                                              ? "+${_transactionController.formatAmount(double.parse(localUser.sponsorshipBalance!))} XAF"
                                                              : "00.00",
                                                          textAlign: TextAlign.right,
                                                          style: AppStyles.textStyle (
                                                            fontFamily: 'Poppins',
                                                            size: 12*ffem,
                                                            weight: FontWeight.w500,
                                                            height: 2.875*ffem/fem,
                                                            letterSpacing: -0.06*fem,
                                                            color: AppColors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 14*fem,
                                                top: 20*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    //width: 110*fem,
                                                    height: 35*fem,
                                                    child: Text(
                                                      'retrait dans : 07J : 16H  : 5 min',
                                                      style: AppStyles.textStyle (
                                                        size: 9*ffem,
                                                        weight: FontWeight.w500,
                                                        height: 3.8333333333*ffem/fem,
                                                        letterSpacing: -0.045*fem,
                                                        color: AppColors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    //recharger et retirer
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.13*fem, 0*fem),
                                      width: double.infinity,
                                      height: 50*fem,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0.17*fem),
                                            child: TextButton(
                                              onPressed: () async {
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
                                              style: TextButton.styleFrom (
                                                padding: EdgeInsets.zero,
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(15*fem, 8*fem, 7*fem, 7.83*fem),
                                                height: double.infinity,
                                                decoration: BoxDecoration (
                                                  color: AppColors.white,
                                                  borderRadius: BorderRadius.circular(22*fem),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.fromLTRB(0*fem, 0.46*fem, 12*fem, 0*fem),
                                                      child: Text(
                                                        'Recharger',
                                                        style: AppStyles.textStyle (
                                                          size: 14*ffem,
                                                          weight: FontWeight.w500,
                                                          height: 1*ffem/fem,
                                                          letterSpacing: -0.07*fem,
                                                          color: AppColors.txtSoldeColor,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 34*fem,
                                                      height: 34*fem,
                                                      child: Image.asset(
                                                        'assets/images/group-124-wuM.png',
                                                        width: 34*fem,
                                                        height: 34*fem,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0*fem, 0.17*fem, 0*fem, 0*fem),
                                            child: TextButton(
                                              onPressed: () {
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
                                              style: TextButton.styleFrom (
                                                padding: EdgeInsets.zero,
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(14*fem, 7.83*fem, 10.87*fem, 8*fem),
                                                height: double.infinity,
                                                decoration: BoxDecoration (
                                                  color: AppColors.white,
                                                  borderRadius: BorderRadius.circular(22*fem),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.fromLTRB(0*fem, 0.46*fem, 30*fem, 0*fem),
                                                      child: Text(
                                                        'Retirer',
                                                        style: AppStyles.textStyle (
                                                          size: 14*ffem,
                                                          weight: FontWeight.w500,
                                                          height: 1*ffem/fem,
                                                          letterSpacing: 0.07*fem,
                                                          color: AppColors.txtSoldeColor,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      // group124tZZ (I1:643;1:16580)
                                                      width: 34*fem,
                                                      height: 34*fem,
                                                      child: Image.asset(
                                                        'assets/images/group-124-Y9h.png',
                                                        width: 34*fem,
                                                        height: 34*fem,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0*fem,
                top: 559*fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 0*fem),
                  width: 638*fem,
                  height: 484*fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => Container(
                        margin: EdgeInsets.fromLTRB(12*fem, 0*fem, 0*fem, 18*fem),
                        //width: double.infinity,
                        //height: 72*fem,
                        child: _infoController.isLoading.value
                            ? const LoadingInfoComponent()
                            : _infoController.infos!.length == 1
                            ? InfoComponent(
                            info: _infoController.infos![0],
                            isOnlyOne: true,
                            fem: fem,
                            ffem: ffem
                        )
                            : CarouselSlider(
                          options: CarouselOptions(
                            height:
                            _infoController.infos!.isNotEmpty ? 90.0 : 0.0,
                            initialPage: 0,
                            viewportFraction: 0.9,
                            enableInfiniteScroll: false,
                            // pageSnapping: false,
                            reverse: false,
                            autoPlay: true,
                            padEnds: false,
                            // enlargeCenterPage: true,
                          ),
                          items: _infoController.infos!.map((info) {
                            return InfoComponent(
                                info: info,
                                isOnlyOne: false,
                                fem: fem,
                                ffem: ffem
                            );
                          }).toList(),
                        ),
                      ),),
                      SizedBox(
                        width: 370.14*fem,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 23.14*fem, 19*fem),
                              constraints: BoxConstraints (
                                maxWidth: 303*fem,
                              ),
                              child: RichText(
                                text: TextSpan(
                                  style: AppStyles.textStyle (
                                    size: 35*ffem,
                                    weight: FontWeight.w300,
                                    height: 1*ffem/fem,
                                    letterSpacing: -0.175*fem,
                                    color: AppColors.chatBubleBg,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Payer n’importe quoi ',
                                      style: AppStyles.textStyle (
                                        size: 35*ffem,
                                        weight: FontWeight.w400,
                                        height: 1*ffem/fem,
                                        letterSpacing: -0.175*fem,
                                        color: AppColors.chatBubleBg,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'en ligne depuis l’Afrique ',
                                      style: AppStyles.textStyle (
                                        size: 35*ffem,
                                        weight: FontWeight.w400,
                                        height: 1*ffem/fem,
                                        letterSpacing: -0.175*fem,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'va devenir plus ',
                                      style: AppStyles.textStyle (
                                        size: 35*ffem,
                                        weight: FontWeight.w400,
                                        height: 1*ffem/fem,
                                        letterSpacing: -0.175*fem,
                                        color: AppColors.chatBubleBg,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'facile',
                                      style: AppStyles.textStyle (
                                        size: 35*ffem,
                                        weight: FontWeight.w400,
                                        height: 1*ffem/fem,
                                        letterSpacing: -0.175*fem,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' avec les cartes ',
                                      style: AppStyles.textStyle (
                                        size: 35*ffem,
                                        weight: FontWeight.w400,
                                        height: 1*ffem/fem,
                                        letterSpacing: -0.175*fem,
                                        color: AppColors.chatBubleBg,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'sekure',
                                      style: AppStyles.textStyle (
                                        size: 35*ffem,
                                        weight: FontWeight.w400,
                                        height: 1*ffem/fem,
                                        letterSpacing: -0.175*fem,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '...',
                                      style: AppStyles.textStyle (
                                        size: 35*ffem,
                                        weight: FontWeight.w400,
                                        height: 1*ffem/fem,
                                        letterSpacing: -0.175*fem,
                                        color: AppColors.chatBubleBg,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0*fem,
                top: 840*fem,
                child: Obx(() {
                  return Column(
                   children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(14*fem, 28*fem, 22*fem, 0*fem),
                        width: 393*fem,
                        //height: 712*fem,
                        child: _cardController.cards!.isEmpty
                            ? Container(
                          margin: EdgeInsets.fromLTRB(9*fem, 10*fem, 0*fem, 0*fem),
                          child: TextButton(
                            onPressed: () {
                              _topNavBarController.pageIndex(5);
                              _topNavBarController.scrollController.jumpTo(2);
                            },
                            style: TextButton.styleFrom (
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(80*fem, 9.5*fem, 0*fem, 9.5*fem),
                              width: double.infinity,
                              decoration: BoxDecoration (
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(32*fem),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 34*fem, 0*fem),
                                    child: Text(
                                      'Créer une nouvelle carte',
                                      style: AppStyles.textStyle (
                                        fontFamily: 'Lufga',
                                        size: 14*ffem,
                                        weight: FontWeight.w500,
                                        height: 2.15625*ffem/fem,
                                        letterSpacing: -0.05*fem,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 29*fem,
                                    height: 29*fem,
                                    child: Image.asset(
                                      'assets/images/Group 95-add.png',
                                      width: 29*fem,
                                      height: 29*fem,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                            : SizedBox(
                          height: 140.0,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: _cardController.cards!.length + 1,
                              itemBuilder: (BuildContext context, index) {
                                return index < _cardController.cards!.length
                                    ? Padding(
                                  padding: EdgeInsets.only(
                                      left: index != 0 ? 10.0 : 0.0),
                                  child: SmallCardWidget(
                                    color: AppColors.primary,
                                    card: _cardController.cards![index],
                                  ),
                                )
                                    : CreateNewCardCard(fem: fem, ffem: ffem);
                              }),
                        ),
                      ),
                     _cardController.cards!.isNotEmpty
                     ? Container(
                       //margin: EdgeInsets.fromLTRB(9*fem, 0*fem, 29*fem, 0*fem),
                       padding: EdgeInsets.fromLTRB(14*fem, 18*fem, 34*fem, 0*fem),
                       width: 393*fem,
                       child: TextButton(
                         onPressed: () {
                           print('voir la liste des cartes');
                           _topNavBarController.pageIndex(8);
                           _topNavBarController.scrollController.jumpTo(2);
                         },
                         style: TextButton.styleFrom (
                           padding: EdgeInsets.zero,
                         ),
                         child: Container(
                           padding: EdgeInsets.fromLTRB(110*fem, 9.5*fem, 0*fem, 9.5*fem),
                           width: double.infinity,
                           decoration: BoxDecoration (
                             color: AppColors.dark,
                             borderRadius: BorderRadius.circular(32*fem),
                           ),
                           child: Row(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Container(
                                 margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 44*fem, 0*fem),
                                 child: Text(
                                   'Voir mes cartes',
                                   style: AppStyles.textStyle (
                                     fontFamily: 'Lufga',
                                     size: 16*ffem,
                                     weight: FontWeight.w500,
                                     height: 2.15625*ffem/fem,
                                     letterSpacing: -0.05*fem,
                                     color: AppColors.white,
                                   ),
                                 ),
                               ),
                               SizedBox(
                                 width: 38*fem,
                                 height: 38*fem,
                                 child: Image.asset(
                                   'assets/images/Group 95.png',
                                   width: 29*fem,
                                   height: 29*fem,
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ),
                     )
                     : const SizedBox(),
                     HistoryScreen(isSeeMoreVisibles: true, fem: fem, ffem: ffem)
                   ]
                 );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
