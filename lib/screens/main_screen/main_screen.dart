import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gleap_sdk/gleap_sdk.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:secure_app/controllers/card_controller.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/main_screen/components/account_transaction_bottomsheet.dart';
import 'package:secure_app/screens/main_screen/components/card_details_request_password_bottomsheet.dart';
import 'package:secure_app/screens/main_screen/components/transactions_details_bottomsheet.dart';
import 'package:secure_app/screens/main_screen/screens/cards_screen/add_card_description_screen.dart';
import 'package:secure_app/screens/main_screen/screens/cards_screen/cards_list_screen.dart';
import 'package:secure_app/screens/main_screen/screens/cards_screen/choose_card_screen.dart';
import 'package:secure_app/screens/main_screen/screens/cards_screen/cards_screen.dart';
import 'package:secure_app/screens/main_screen/screens/cards_screen/components/card_details_bottomsheet.dart';
import 'package:secure_app/screens/main_screen/screens/cards_screen/components/card_transactions_bottomsheet.dart';
import 'package:secure_app/screens/main_screen/screens/cards_screen/components/create_transfert_button.dart';
import 'package:secure_app/screens/main_screen/screens/cards_screen/components/support_socials_row.dart';
import 'package:secure_app/screens/main_screen/screens/cards_screen/recharge_card_description_screen.dart';
import 'package:secure_app/screens/main_screen/screens/history_screen.dart';
import 'package:secure_app/screens/main_screen/screens/unverified_home_screen.dart';
import 'package:secure_app/screens/main_screen/screens/loader_screen/loader_screen.dart';
import 'package:secure_app/screens/main_screen/screens/service_screen.dart';
import 'package:secure_app/screens/main_screen/screens/transferts_screen.dart';
import 'package:secure_app/screens/main_screen/screens/home_screen.dart';
import 'package:secure_app/screens/service_screen/components/social_circle_component.dart';
import 'package:secure_app/screens/top_nav_bar/top_nav_bar.dart';
import 'package:secure_app/widgets/app_button_widget.dart';
import 'package:secure_app/widgets/input_field_widget.dart';
import 'package:secure_app/widgets/input_label.dart';
import 'package:secure_app/widgets/primary_button.dart';

import '../login_screen/login_with_only_password_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());

  final FormController _formController = Get.put(FormController());

  final TransactionController _transactionController =
      Get.put(TransactionController());

  final UserController _userController = Get.put(UserController());
  final CardController _cardController = Get.put(CardController());

  @override
  void initState() {
    initPlatform();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // L'application est en premier plan
      //authController.checkAuthentication();
      print("---------------L'application est en premier plan-");
    } else if (state == AppLifecycleState.paused) {
      // L'application est en arrière-plan
      //authController.logout();
      Get.to(LoginWithOnlyPasswordScreen());
      print("------------------------------------l'application est en pause");
    }
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

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          debugPrint("didPop1: $didPop");
          if (didPop) {
            return;
          }
          final bool shouldPop = await _onback(context);
          if (shouldPop) {
            SystemNavigator.pop();
          }
        },
        child: Obx(() {
          return KeyboardVisibility(
            onChanged: (bool isVisible) {
              // print(_topNavBarController.isKeyboardVisible);
              _topNavBarController.isKeyboardVisible(isVisible);
            },
            child: Scaffold(
              backgroundColor: _formController.isPageDark.value
                  ? AppColors.dark
                  : _topNavBarController.pageIndex.value == 2
                  ? AppColors.bgColor
                  : AppColors.white,
              body:
              // ((_transactionController.transactions == null ||
              //             _transactionController.transactions!.isEmpty) &&
              //         _topNavBarController.pageIndex.value == 3)
              //     ? Center(
              //         child: LoadingAnimationWidget.inkDrop(
              //           color: AppColors.primary,
              //           size: 20,
              //         ),
              //       )
              //     :
              GestureDetector(
                onTap: () {
                  _cardController.getCards(localUser);
                  if (_formController.isBottomSheetShow.value) {
                    _formController.isBottomSheetShow(false);
                  } else if (_formController
                      .isAccountTransactionBottomSheetShow.value) {
                    // _formController.isAccountTransactionBottomSheetShow(false); FIXME: uncomment this
                  } else if (_formController
                      .isCardDetailsRequestPasswordBottomSheetShow.value) {
                    _formController
                        .isCardDetailsRequestPasswordBottomSheetShow(false);
                  } else if (_formController
                      .showTransactionDetailsBottomSheet.value) {
                    _formController.showTransactionDetailsBottomSheet(false);
                  }
                },
                child: Stack(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() {
                      return _topNavBarController.pageIndex.value == 2 &&
                          !_topNavBarController.isKeyboardVisible.value
                          ? Align(
                          alignment: Alignment.topCenter, //bottomCenter
                          child: SizedBox(
                            width: double.infinity,
                            child: SvgPicture.asset(
                              Assets.images.transfertBg,
                              fit: BoxFit.cover,
                            ),
                          ))
                          : const SizedBox();
                    }),
                    Obx(() {
                      return _topNavBarController.pageIndex.value == 4
                          ? Container(
                          height: Constants.screenHeight(context),
                          width: Constants.screenWidth(context),
                          color: AppColors.white,
                          child: SvgPicture.asset(
                            Assets.images.chatBg,
                            fit: BoxFit.cover,
                            color: AppColors.grey300.withOpacity(0.3),
                          ))
                          : const SizedBox();
                    }),

                    _topNavBarController.pageIndex.value == 4
                        ? const ServiceScreen()
                        : _topNavBarController.pageIndex.value == 5
                        ? AddCardDescriptionScreen()
                        : NotificationListener<ScrollNotification>(
                      onNotification: (Notification notification) {
                        _userController.isProfileExist(localUser.photo!);
                        return true;
                      },
                      child: SingleChildScrollView(
                        controller: _topNavBarController.scrollController,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          // padding: const EdgeInsets.only(top: 90.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() => _topNavBarController
                                  .pageIndex.value ==
                                  0
                              // ? _formController.isAccountVerified.value && //TODO: uncomment this
                                  ? (localUser.isProfileVerified !=
                                  null &&
                                  localUser
                                      .isProfileVerified!) //FIXME: Remove this comment
                                  ? const HomeScreen()
                                  : const UnverifiedHomeScreen()
                                  : _topNavBarController
                                  .pageIndex.value ==
                                  1
                                  ? CardsScreen()
                                  : _topNavBarController
                                  .pageIndex.value ==
                                  2
                                  ? TransfertsScreen()
                                  : _topNavBarController
                                  .pageIndex.value ==
                                  3
                                  ? HistoryScreen(fem: fem, ffem: ffem,)

                              // : _topNavBarController
                              //             .pageIndex
                              //             .value ==
                              //         5
                              //     ? AddCardDescriptionScreen()
                                  : _topNavBarController
                                  .pageIndex
                                  .value ==
                                  6
                                  ? ChooseCardScreen()
                                  : _topNavBarController
                                  .pageIndex
                                  .value ==
                                  7
                                  ? RechargeCardDescriptionScreen()
                                  : CardsListScreen()
                              ),
                              // _topNavBarController.pageIndex.value == 5
                              //     ? Align(
                              //         alignment: Alignment.bottomCenter,
                              //         child: SvgPicture.asset(
                              //           Assets.images.createCardBg,
                              //           width: Constants.screenWidth(context),
                              //         ),
                              //       )
                              //     : SizedBox(),
                              !_topNavBarController
                                  .isKeyboardVisible.value &&
                                  _topNavBarController
                                      .pageIndex.value ==
                                      0
                                  ? SizedBox(
                                  height: Constants.screenHeight(
                                      context) /
                                      10)
                                  : const SizedBox(),
                              !_topNavBarController
                                  .isKeyboardVisible.value &&
                                  (_topNavBarController
                                      .pageIndex.value ==
                                      1 ||
                                      _topNavBarController
                                          .pageIndex.value ==
                                          6)
                                  ? SizedBox(
                                  height: Constants.screenHeight(
                                      context) /
                                      15)
                                  : const SizedBox(),
                              !_topNavBarController
                                  .isKeyboardVisible.value &&
                                  (_topNavBarController
                                      .pageIndex.value ==
                                      1 ||
                                      _topNavBarController
                                          .pageIndex.value ==
                                          7)
                                  ? SizedBox(
                                  height: Constants.screenHeight(
                                      context) /
                                      8)
                                  : const SizedBox(),
                              // _topNavBarController.isKeyboardVisible.value
                              //     ? SizedBox(
                              //         height: _topNavBarController
                              //                     .pageIndex.value !=
                              //                 4
                              //             ? Constants.screenHeight(
                              //                     context) /
                              //                 25
                              //             : Constants.screenHeight(
                              //                     context) /
                              //                 6)
                              //     : _topNavBarController
                              //                 .pageIndex.value !=
                              //             4
                              //         ? const SizedBox()
                              //         : SizedBox(
                              //             height: Constants.screenHeight(
                              //                     context) /
                              //                 6)
                            ],
                          ),
                        ),
                      ),
                    ),
                    /*_topNavBarController.pageIndex.value == 1 ||
                        _topNavBarController.pageIndex.value == 5
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (_topNavBarController.pageIndex.value == 1) {
                                  _topNavBarController.pageIndex(5);
                                } else {
                                  _topNavBarController.pageIndex(6);
                                }
                                // Get.to(AddCardDescriptionScreen());
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 22.0),
                                child: PrimaryButton(
                                  textButton:
                                      _topNavBarController.pageIndex.value == 1
                                          ? "Obtenir une nouvelle carte"
                                          : "Créer ma carte maintenant",
                                  buttonColor: AppColors.dark,
                                  hasIcon: true,
                                  paddingleft: 0.0,
                                  sizedBoxSizes: 0.0,
                                  circleIconColor: AppColors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                                height: Constants.screenHeight(context) / 10),
                            // SizedBox(
                            //     height: Constants.screenHeight(context) / 25),
                          ],
                        ),
                      )
                    : const SizedBox(),*/ //A DEBLOQUER

                    //Create transfert button
                    CreateTransfertButton(),

                    //Support socials row
                    SupportSocialsRow(),

                    //Top navigation bar
                    TopNavBar(),

                    //Card transactions bottomsheet
                    CardTransactionsBottomSheet(),

                    //Card details request password bottomsheet
                    CardDetailsRequestPasswordBottomSheet(),

                    //Account recharge bottomsheet
                    AccountTransactionBottomSheet(),

                    //Card details bottomsheet
                    CardDetailsBottomSheet(),

                    //Transactions details bottomsheet
                    TransactionDetailsBottomSheet(),
                  ],
                ),
              ),
            ),
          );
        })
    );
  }

  Future<bool> _onback(BuildContext context) async {
    bool? exitApp = await showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text('Êtes vous sur de vouloir quitter ?',
              style: TextStyle(
                fontSize: 15,
              )),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('NON')),
            TextButton(
                onPressed: () {
                  //exit(0);
                  Navigator.of(context).pop(true);
                },
                child: const Text('OUI'))
          ],
        );
      }),
    );

    return exitApp ?? false;
  }
}
