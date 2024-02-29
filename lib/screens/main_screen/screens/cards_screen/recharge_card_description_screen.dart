import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:secure_app/controllers/add_card_controller.dart';
import 'package:secure_app/controllers/card_controller.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/main_screen/components/history_item_component.dart';
import 'package:secure_app/screens/main_screen/components/loading_history_item_component.dart';
import 'package:secure_app/screens/main_screen/main_screen.dart';
import 'package:secure_app/screens/main_screen/screens/cards_screen/components/recharge_card_component.dart';
import 'package:secure_app/screens/main_screen/screens/cards_screen/components/see_account_button_component.dart';
import 'package:secure_app/screens/main_screen/screens/loader_screen/loader_screen.dart';
import 'package:secure_app/widgets/history_item_widget.dart';

class RechargeCardDescriptionScreen extends StatelessWidget {
  RechargeCardDescriptionScreen({super.key});
  final AddCardController _addCardController = Get.put(AddCardController());
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());
  final FormController _formController = Get.put(FormController());
  final CardController _cardController = Get.put(CardController());
  final TransactionController _transactionController =
      Get.put(TransactionController());

  final List<Color> cardColors = [
    AppColors.primary,
    AppColors.yellowLight,
    AppColors.red,
    AppColors.yellow,
    AppColors.dark,
    AppColors.purple,
    AppColors.orange,
    AppColors.red,
    AppColors.pink,
    AppColors.green
  ];

  final List<Color> cardTextColors = [
    AppColors.dark,
    AppColors.dark,
    AppColors.dark,
    AppColors.dark,
    AppColors.white,
    AppColors.dark,
    AppColors.dark,
    AppColors.dark,
    AppColors.dark,
    AppColors.dark,
  ];

  final List<Color> bubleColors = [
    AppColors.dark,
    AppColors.dark,
    AppColors.dark,
    AppColors.dark,
    AppColors.white,
    AppColors.dark,
    AppColors.dark,
    AppColors.dark,
    AppColors.dark,
    AppColors.dark,
  ];

  final List<Color> bubleTextColors = [
    AppColors.white,
    AppColors.white,
    AppColors.white,
    AppColors.white,
    AppColors.dark,
    AppColors.white,
    AppColors.white,
    AppColors.white,
    AppColors.white,
    AppColors.white,
  ];

  final List<String> tabListItem = [
    "Tout",
    "Solde",
    "Cartes",
    "Transferts",
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          Container(
            color: AppColors.bgColor,
            child: SingleChildScrollView(
              controller: _topNavBarController.scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 29.0, bottom: 21.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _topNavBarController.pageIndex(5);
                                  _topNavBarController.scrollController
                                      .jumpTo(0);
                                  // Get.back();
                                },
                                child: const Icon(
                                  FontAwesomeIcons.arrowLeft,
                                  // size: 25.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'Details de ma carte',
                                  style: AppStyles.textStyle(
                                    color: Colors.black,
                                    size: 18,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Recharge ta carte pour',
                                  style: AppStyles.textStyle(
                                    color: AppColors.dark,
                                    size: 39.0,
                                    height: 0.9,
                                    weight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: ' payer',
                                  style: AppStyles.textStyle(
                                    color: AppColors.primary,
                                    size: 39.0,
                                    height: 0.9,
                                    weight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        // Padding(
                        //   padding: const EdgeInsets.only(bottom: 5.0, top: 18.0),
                        //   child: Text(
                        //     'Appuyez longuement sur une section pour copier les details de carte',
                        //     style: AppStyles.textStyle(
                        //       color: AppColors.dark,
                        //       size: 12.0,
                        //       // height: 0.11,
                        //       weight: FontWeight.w300,
                        //     ),
                        //   ),
                        // ),
                        Obx(() {
                          return RechargeCardComponent(
                            isVisa:
                                _topNavBarController.isVisaCardChoosed.value,
                            cardTextColor: cardTextColors[
                                _addCardController.selectedColor.value],
                            cardColor: cardColors[
                                _addCardController.selectedColor.value],
                            bubleColor: bubleColors[
                                _addCardController.selectedColor.value],
                            bubleTextColor: bubleTextColors[
                                _addCardController.selectedColor.value],
                            iconColor: _addCardController.selectedColor.value ==
                                        4 &&
                                    _topNavBarController.isVisaCardChoosed.value
                                ? AppColors.white
                                : null,
                          );
                        }),
                        IntrinsicHeight(
                          child: Container(
                            margin: const EdgeInsets.only(top: 12.0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0),
                            decoration: BoxDecoration(
                                color: AppColors.dark,
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Text(
                                    'Solde de la carte',
                                    style: AppStyles.textStyle(
                                      color: Colors.white,
                                      size: 12,
                                      weight: FontWeight.w500,
                                      // height: 0.24,
                                    ),
                                  ),
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // const Text(
                                    //   '\$',
                                    //   style: TextStyle(
                                    //     color: Colors.white,
                                    //     fontSize: 30,
                                    //     fontFamily: 'Poppins',
                                    //     fontWeight: FontWeight.w500,
                                    //     // height: 0.04,
                                    //     letterSpacing: -0.15,
                                    //   ),
                                    // ),
                                    Text(
                                      "${double.parse(_cardController.cards![_cardController.selectedCardIndex!.value].amount!)}  fcfa",
                                      style: AppStyles.textPoppinsStyle(
                                        color: Colors.white,
                                        size: 22,
                                        weight: FontWeight.w500,
                                        // height: 0.04,
                                      ),
                                    ),
                                  ],
                                ),
                                // GestureDetector(
                                //   onTap: () {
                                //     _formController.isBottomSheetShow(true);
                                //     _formController.isRechargeBottomSheet(true);
                                //   },
                                // child:
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _formController.isBottomSheetShow(true);
                                        _formController
                                            .isRechargeBottomSheet(true);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7.0, horizontal: 10.0),
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FittedBox(
                                              child: Text(
                                                "Recharger",
                                                style: AppStyles.textStyle(
                                                    color: AppColors.dark,
                                                    size: 12.0,
                                                    weight: FontWeight.w500),
                                              ),
                                            ),
                                            const SizedBox(width: 5.0),
                                            Container(
                                              // height: 30.0,
                                              // width: 30.0,
                                              // margin: EdgeInsets.only(right: 16.0),
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              decoration: const BoxDecoration(
                                                  color: AppColors.dark,
                                                  shape: BoxShape.circle),
                                              child: SvgPicture.asset(
                                                Assets.icons.remove,
                                                height: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _formController.isBottomSheetShow(true);
                                        _formController
                                            .isRechargeBottomSheet(false);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7.0,
                                            horizontal: 10.0), //16.0
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FittedBox(
                                              child: Text(
                                                "Retirer",
                                                style: AppStyles.textStyle(
                                                    color: AppColors.dark,
                                                    size: 12.0,
                                                    weight: FontWeight.w500),
                                              ),
                                            ),
                                            const SizedBox(width: 5.0),
                                            Container(
                                              // height: 30.0,
                                              // width: 30.0,
                                              // margin: EdgeInsets.only(right: 16.0),
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              decoration: const BoxDecoration(
                                                  color: AppColors.dark,
                                                  shape: BoxShape.circle),
                                              child: SvgPicture.asset(
                                                Assets.icons.remove,
                                                height: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    (_cardController
                                                .cards![_cardController
                                                    .selectedCardIndex!.value]
                                                .status ==
                                            "ACTIVE")
                                        ? GestureDetector(
                                            onTap: () async {
                                              // _topNavBarController
                                              //     .loaderProvider(
                                              //         "card action");
                                              // Get.off(
                                              //     () => const LoaderScreen());

                                              showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder: (context) {
                                                  return Container(
                                                    color: Colors.transparent,
                                                    child:
                                                        LoadingAnimationWidget
                                                            .inkDrop(
                                                      color: AppColors.primary,
                                                      size: 50,
                                                    ),
                                                  );
                                                },
                                              );

                                              await _cardController.freezeCard(
                                                _cardController
                                                    .cards![_cardController
                                                        .selectedCardIndex!
                                                        .value]
                                                    .mapId!,
                                              );
                                              if (_cardController
                                                  .err.isNotEmpty) {
                                                Get.back();
                                                Constants.snackBar(
                                                    bgColor: AppColors.red,
                                                    textColor: AppColors.white,
                                                    description: _cardController
                                                        .err.value);
                                              } else {
                                                Get.back();
                                                Constants.snackBar(
                                                    bgColor: AppColors.primary,
                                                    textColor: AppColors.white,
                                                    description:
                                                        "Carte bloquee avec succes!");
                                              }
                                            },
                                            child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5.0,
                                                        horizontal: 10.0),
                                                decoration: BoxDecoration(
                                                  color: AppColors
                                                      .rechargeAndWithdrawColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      // height: 30.0,
                                                      // width: 30.0,
                                                      // margin: EdgeInsets.only(right: 16.0),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      decoration: BoxDecoration(
                                                          color: AppColors.dark,
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .dark,
                                                              width: 2.0),
                                                          shape:
                                                              BoxShape.circle),
                                                      child: SvgPicture.asset(
                                                        Assets.icons.lock,
                                                        width: 10.0, //12.0
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5.0),
                                                    FittedBox(
                                                      child: Text(
                                                        "Bloquer",
                                                        style:
                                                            AppStyles.textStyle(
                                                                color: AppColors
                                                                    .dark,
                                                                size:
                                                                    12.0, //14.0
                                                                weight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          )
                                        : GestureDetector(
                                            onTap: () async {
                                              // _topNavBarController
                                              //     .loaderProvider(
                                              //         "card action");
                                              // Get.off(
                                              //     () => const LoaderScreen());
                                              showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder: (context) {
                                                  return Container(
                                                    color: Colors.transparent,
                                                    child:
                                                        LoadingAnimationWidget
                                                            .inkDrop(
                                                      color: AppColors.primary,
                                                      size: 50,
                                                    ),
                                                  );
                                                },
                                              );

                                              await _cardController
                                                  .unfreezeCard(
                                                _cardController
                                                    .cards![_cardController
                                                        .selectedCardIndex!
                                                        .value]
                                                    .mapId!,
                                              );
                                              if (_cardController
                                                  .err.isNotEmpty) {
                                                Get.back();
                                                Constants.snackBar(
                                                    bgColor: AppColors.red,
                                                    textColor: AppColors.white,
                                                    description: _cardController
                                                        .err.value);
                                              } else {
                                                Get.back();
                                                Constants.snackBar(
                                                    bgColor: AppColors.primary,
                                                    textColor: AppColors.white,
                                                    description:
                                                        "Carte debloquee avec succes!");
                                              }
                                            },
                                            child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5.0,
                                                        horizontal: 10.0),
                                                decoration: BoxDecoration(
                                                  color: AppColors
                                                      .unlockCardRedBtn,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    FittedBox(
                                                      child: Text(
                                                        "Debloquer",
                                                        style: AppStyles.textStyle(
                                                            color: AppColors
                                                                .unlockCardRed,
                                                            size: 12.0,
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
                                                          color: AppColors
                                                              .unlockCardRed,
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .unlockCardRed,
                                                              width: 2.0),
                                                          shape:
                                                              BoxShape.circle),
                                                      child: SvgPicture.asset(
                                                        Assets.icons.lock,
                                                        width: 10.0,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          )
                                  ],
                                ),
                                // )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 12.0, bottom: 5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  'Pour recharger votre carte, Rassurez vous d’avoir de l’argent dans votre compte Sekure',
                                  style: AppStyles.textStyle(
                                    color: Colors.black,
                                    size: 12,
                                    weight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                Assets.icons.heart,
                              )
                            ],
                          ),
                        ),
                        SeeAccountButtonComponent(),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(26.0),
                            topRight: Radius.circular(26.0))),
                    padding: const EdgeInsets.only(left: 22.0, right: 22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 38.0, bottom: 7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Transactions',
                                style: AppStyles.textStyle(
                                  color: AppColors.dark,
                                  size: 18,
                                  weight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'voir plus',
                                style: AppStyles.textStyle(
                                  color: const Color(0xFF848484),
                                  size: 16,
                                  weight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: ListView.builder(
                              shrinkWrap: true,
                              // scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: _transactionController
                                  .cardTransactions!.length,
                              itemBuilder: ((context, index) {
                                return _transactionController.isLoading.value
                                    ? const LoadingHistoryItemComponent()
                                    : HistoryItemComponent(
                                        transaction: _transactionController
                                            .cardTransactions![index]);
                              })),
                        ),
                        ((_transactionController.cardTransactions != null &&
                                _transactionController
                                    .cardTransactions!.isEmpty))
                            ? Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height:
                                            Constants.screenHeight(context) /
                                                20),
                                    SvgPicture.asset(
                                      Assets.images.noItemsSvg,
                                      width: 250.0,
                                    ),
                                    // Image.asset(
                                    //   Assets.images.noItems.path,
                                    //   width: 250.0,
                                    // ),
                                    SizedBox(
                                      width:
                                          Constants.screenWidth(context) / 1.5,
                                      child: Text(
                                        "Aucune transaction pour l'instant",
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
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
