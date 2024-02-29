import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:secure_app/controllers/card_controller.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/main_screen/main_screen.dart';
import 'package:secure_app/screens/responses_screens/created_card_screen.dart';
import 'package:secure_app/screens/responses_screens/transaction_failed.dart';
import 'package:secure_app/screens/responses_screens/transaction_success.dart';
import 'package:secure_app/widgets/timer_widget.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());

  final FormController _formController = Get.put(FormController());

  final CardController _cardController = Get.put(CardController());

  final TransactionController _transactionController =
      Get.put(TransactionController());
  void createTransaction() async {
    if (_topNavBarController.loaderProvider.value == "card transaction") {
      await _transactionController
          .createTransaction(
              localUser,
              _formController.isRechargeBottomSheet.value,
              _transactionController.amount.value,
              _transactionController.phone.value)
          .then((value) async {
        if (_transactionController.err.isEmpty) {
          while (_transactionController.transactions == null ||
              _transactionController.transactions!.isEmpty) {
            await _transactionController.getTransactions(localUser);
          }
          // if (_transactionController.transactions != null &&
          //     _transactionController.transactions!.isNotEmpty) {
          _transactionController.clearData();
          Get.off(() => TransactionSuccessScreen());
          //   } else {}
        } else {
          Get.off(() => TransactionFailedScreen());
        }
      });
    } else if (_topNavBarController.loaderProvider.value == "transfert") {
      await _transactionController.createTransfert(
          _transactionController.phone.value,
          _transactionController.amount.value,
          _transactionController.message.value);
      if (_transactionController.err.isEmpty) {
        while (_transactionController.transactions == null ||
            _transactionController.transactions!.isEmpty) {
          await _transactionController.getTransactions(localUser);
        }
        // if (_transactionController.transactions != null &&
        //     _transactionController.transactions!.isNotEmpty) {
        _transactionController.clearData();
        Get.off(() => TransactionSuccessScreen());
        //   } else {}
      } else {
        Get.off(() => TransactionFailedScreen());
      }
    } else if (_topNavBarController.loaderProvider.value == "buy card") {
      await _cardController
          .createCard(
        _cardController.selectedBrand.value,
      )
          .then((value) async {
        _topNavBarController.scrollController.jumpTo(0);
        if (_cardController.err.isEmpty) {
          // _cardController.cards = null;
          // while (
          //     _cardController.cards == null || _cardController.cards!.isEmpty) {
          //   await _cardController.getCards(localUser);
          // }
          Get.off(() => CreatedCardScreen());
        } else {
          Get.off(() => TransactionFailedScreen());
        }
      });
      // const splashDuration = Duration(seconds: 3);
      // var delay = Timer(splashDuration, () {
      //   Get.off(() => CreatedCardScreen());
      // });
    } else if (_topNavBarController.loaderProvider.value == "open details") {
      const splashDuration = Duration(seconds: 3);
      var delay = Timer(splashDuration, () {
        _topNavBarController.pageIndex.value = 7;
        _topNavBarController.isCardDetailsActivated(true);
        Get.off(() => const MainScreen());
      });
    }
    // else if (_topNavBarController.loaderProvider.value == "card action") {
    //   if (_cardController
    //           .cards![_cardController.selectedCardIndex!.value].status ==
    //       "ACTIVE") {
    //     await _cardController
    //         .freezeCard(
    //       _cardController
    //           .cards![_cardController.selectedCardIndex!.value].mapId!,
    //     )
    //         .then((value) async {
    //       _topNavBarController.scrollController.jumpTo(0);
    //       if (_cardController.err.isEmpty) {
    //         // _cardController.cards = null;
    //         // while (
    //         //     _cardController.cards == null || _cardController.cards!.isEmpty) {
    //         //   await _cardController.getCards(localUser);
    //         // }
    //         Get.off(() => CreatedCardScreen());
    //       } else {
    //         Get.off(() => TransactionFailedScreen());
    //       }
    //     });
    //   } else {
    //     await _cardController
    //         .unfreezeCard(
    //       _cardController
    //           .cards![_cardController.selectedCardIndex!.value].mapId!,
    //     )
    //         .then((value) async {
    //       _topNavBarController.scrollController.jumpTo(0);
    //       if (_cardController.err.isEmpty) {
    //         // _cardController.cards = null;
    //         // while (
    //         //     _cardController.cards == null || _cardController.cards!.isEmpty) {
    //         //   await _cardController.getCards(localUser);
    //         // }
    //         Get.off(() => CreatedCardScreen());
    //       } else {
    //         Get.off(() => TransactionFailedScreen());
    //       }
    //     });
    //   }
    // }
  }

  @override
  void initState() {
    createTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              if (_topNavBarController.loaderProvider.value == "buy card") {
                _topNavBarController.pageIndex(6);
                _topNavBarController.scrollController.jumpTo(0);
                Get.off(() => const MainScreen());
                // Get.off(CreatedCardScreen());
              } else if (_topNavBarController.loaderProvider.value ==
                  "card transaction") {
                _topNavBarController.pageIndex(7);
                _topNavBarController.scrollController.jumpTo(0);
                Get.off(() => const MainScreen());
              }
              // delay.cancel();
            },
            child: const Icon(FontAwesomeIcons.arrowLeft)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              // width: 22.59,
              height: 80,
              width: 80,
              child: LoadingAnimationWidget.inkDrop(
                color: AppColors.primary,
                size: 50,
              ),
            ),
            SizedBox(
              width: _topNavBarController.loaderProvider.value == "transfert"
                  ? 194
                  : 300,
              child: Text(
                _topNavBarController.loaderProvider.value == "transfert"
                    ? 'Transfert en cours'
                    : _formController.isRechargeBottomSheet.value
                        ? 'Transaction en attente de validation'
                        : "Traitement en cours",
                textAlign: TextAlign.center,
                style: AppStyles.textStyle(
                  color: AppColors.dark,
                  size: 30,
                  weight: FontWeight.w500,
                  height: 0.9,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: 236,
                  height: 45,
                  child: Text(
                    _topNavBarController.loaderProvider.value == "transfert"
                        ? "Merci de patienter nous envoyons votre argent"
                        : _topNavBarController.loaderProvider.value ==
                                "buy card"
                            ? "Merci de patienter le temps de la creation de votre carte"
                            : !_formController.isRechargeBottomSheet.value
                                ? _transactionController.mobileOperator.value ==
                                        "MTN_MOMO"
                                    ? "Merci de patienter nous reversons l'argent dans votre compte MTN mobile money"
                                    : "Merci de patienter nous reversons l'argent dans votre compte Orange money"
                                : _transactionController.mobileOperator.value ==
                                        "MTN_MOMO"
                                    ? 'Composez le *126# sur votre telephone pour confirmer'
                                    : 'Composez le #150*50# sur votre telephone pour confirmer',
                    textAlign: TextAlign.center,
                    style: AppStyles.textPoppinsStyle(
                      color: Colors.black,
                      size: 12,
                      weight: FontWeight.w300,
                      height: 0.9,
                    ),
                  ),
                ),
                SizedBox(
                  width: 236,
                  child: Text(
                    'Ne quittez pas cette page svp ... ',
                    textAlign: TextAlign.center,
                    style: AppStyles.textPoppinsStyle(
                      color: Colors.black,
                      size: 12,
                      weight: FontWeight.w300,
                      height: 0.99,
                    ),
                  ),
                ),
                TimerWidget(
                  duration: _formController.isRechargeBottomSheet.value
                      ? 120
                      : _topNavBarController.loaderProvider.value == "buy card"
                          ? 180
                          : 60,
                  label: "",
                  isLoader: true,
                  // restartTimer: () {},
                  onEnd: () {
                    Constants.snackBar(
                        // duration: const Duration(seconds: 5),
                        bgColor: AppColors.red,
                        textColor: AppColors.white,
                        hasSpecialCharacters: true,
                        description:
                            "Votre transaction a pris plus de temps que prévu nous allons vous renvoyer à la page d'accueil,  vous recevrez le statut final de votre transaction sous peu. Merci de votre patience");

                    Future.delayed(const Duration(seconds: 10), () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const MainScreen()),
                        (route) => false,
                      );
                    });
                  },
                )
              ],
            ),
            SvgPicture.asset(
              Assets.images.loaderCenterBg,
              width: Constants.screenWidth(context),
              fit: BoxFit.cover,
            ),
            const SizedBox(),
            const SizedBox(),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
