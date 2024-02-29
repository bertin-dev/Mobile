import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/card_controller.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/widgets/card_button_widget.dart';

class RechargeCardComponent extends StatelessWidget {
  final bool isVisa;
  final Color cardColor;
  final Color cardTextColor;
  final Color bubleColor;
  final Color bubleTextColor;
  final Color? iconColor;
  RechargeCardComponent(
      {super.key,
      required this.isVisa,
      required this.cardColor,
      required this.cardTextColor,
      required this.bubleColor,
      required this.bubleTextColor,
      this.iconColor});

  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());
  final FormController _formController = Get.put(FormController());
  final CardController _cardController = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _topNavBarController.scrollController,
      child: Obx(() {
        return Container(
          // width: Constants.screenWidth(context),
          // height: Constants.screenHeight(context) / 2,
          decoration: BoxDecoration(
              // color: AppColors.cardColor4.withOpacity(0.24),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  cardColor,
                  cardColor.withOpacity(0.5),
                  cardColor
                  // AppColors.cardColor4,
                  // Color(0XFFffeab7),
                  // AppColors.cardColor4,
                ],
              ),
              borderRadius: BorderRadius.circular(12.0)),
          child: Stack(
            children: [
              Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: SvgPicture.asset(Assets.images.cardDescRightBg)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // // width: Constants.screenWidth(context),
                    // // height: Constants.screenHeight(context) / 2,
                    // padding:
                    //     const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0),
                    // decoration: BoxDecoration(
                    //     color: cardColor,
                    //     borderRadius: BorderRadius.circular(12.0)),
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          Assets.images.cardBg,
                          color: cardColor.withOpacity(0.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 16.0, bottom: 16.0, left: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Carte ${_cardController.cards![_cardController.selectedCardIndex!.value].brand!.capitalize!}',
                                          style: AppStyles.textStyle(
                                            color: cardTextColor,
                                            size: 23.0,
                                            // height: 0.11,
                                            weight: FontWeight.w500,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 16.0),
                                          child: SvgPicture.asset(
                                              Assets.icons.menu),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, bottom: 1.5, right: 16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CardButtonWidget(
                                                buttonLabel: "Carte de debit",
                                                color: AppColors.primary,
                                                textColor: AppColors.white,
                                                padding: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.015,
                                              ),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.015),
                                              CardButtonWidget(
                                                buttonLabel: "Multiusage",
                                                color: bubleColor,
                                                textColor: bubleTextColor,
                                                padding: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.015,
                                              ),
                                            ],
                                          ),
                                          if (_cardController
                                                  .cards![_cardController
                                                      .selectedCardIndex!.value]
                                                  .status !=
                                              "ACTIVE")
                                            CardButtonWidget(
                                              buttonLabel: "Bloqué",
                                              color: AppColors.redFSecondary,
                                              textColor: AppColors.white,
                                              padding: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.015,
                                            ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 18.0, bottom: 13.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Numéro de carte',
                                            style: AppStyles.textPoppinsStyle(
                                              color: cardTextColor,
                                              size: 10,
                                              weight: FontWeight.w400,
                                              // height: 0,
                                            ),
                                          ),
                                          // _topNavBarController.isCardDetailsActivated.value
                                          //     ? Padding(
                                          //         padding:
                                          //             const EdgeInsets.only(right: 16.0),
                                          //         child: Row(
                                          //           mainAxisAlignment:
                                          //               MainAxisAlignment.spaceBetween,
                                          //           children: [
                                          //             SizedBox(
                                          //               child: Text(
                                          //                 '5577  2233  5566  4455',
                                          //                 style: AppStyles.textPoppinsStyle(
                                          //                   color: cardTextColor,
                                          //                   size: MediaQuery.of(context)
                                          //                           .size
                                          //                           .width *
                                          //                       0.046,
                                          //                   // height: 0.5,
                                          //                   weight: FontWeight.w700,
                                          //                 ),
                                          //               ),
                                          //             ),
                                          //             GestureDetector(
                                          //               onTap: () {
                                          //                 Get.rawSnackbar(
                                          //                     backgroundColor:
                                          //                         AppColors.dark,
                                          //                     borderRadius: 10.0,
                                          //                     // colorText: AppColors.white,
                                          //                     snackPosition:
                                          //                         SnackPosition.BOTTOM,
                                          //                     margin: const EdgeInsets.only(
                                          //                         bottom: 40.0,
                                          //                         left: 22.0,
                                          //                         right: 22.0),
                                          //                     messageText: Center(
                                          //                       child: Text(
                                          //                         'copié',
                                          //                         style:
                                          //                             AppStyles.textStyle(
                                          //                           color: Colors.white,
                                          //                           size: 12,
                                          //                           weight: FontWeight.w400,
                                          //                         ),
                                          //                       ),
                                          //                     ),
                                          //                     padding: const EdgeInsets
                                          //                         .symmetric(
                                          //                         vertical: 10.0));
                                          //               },
                                          //               child: Container(
                                          //                 padding:
                                          //                     const EdgeInsets.symmetric(
                                          //                         horizontal: 12.0,
                                          //                         vertical: 6.0),
                                          //                 decoration: BoxDecoration(
                                          //                     color: AppColors.dark,
                                          //                     borderRadius:
                                          //                         BorderRadius.circular(5)),
                                          //                 child: Text(
                                          //                   'copier',
                                          //                   style:
                                          //                       AppStyles.textPoppinsStyle(
                                          //                     color: Colors.white,
                                          //                     size: 12,
                                          //                     weight: FontWeight.w700,
                                          //                     // height: 0.17,
                                          //                     // letterSpacing: -0.48,
                                          //                   ),
                                          //                 ),
                                          //               ),
                                          //             )
                                          //           ],
                                          //         ),
                                          //       )
                                          //     : const SizedBox(),
                                          // !_topNavBarController.isCardDetailsActivated.value
                                          //     ?
                                          SizedBox(
                                            child: Text(
                                              '•••• •••• •••• ${_cardController.cards![_cardController.selectedCardIndex!.value].number!.substring((_cardController.cards![_cardController.selectedCardIndex!.value].number!.length - 4), _cardController.cards![_cardController.selectedCardIndex!.value].number!.length)!} ',
                                              style: AppStyles.textStyle(
                                                color: cardTextColor,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.11,
                                                height: 0.5,
                                                weight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                          // : const SizedBox(),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Nom Complet',
                                          style: AppStyles.textStyle(
                                            color: cardTextColor,
                                            size: 10,
                                            // height: 0.11,
                                            weight: FontWeight.w400,
                                          ),
                                        ),
                                        // _topNavBarController.isCardDetailsActivated.value
                                        //     ? Padding(
                                        //         padding: const EdgeInsets.only(right: 16.0),
                                        //         child: Row(
                                        //           mainAxisAlignment:
                                        //               MainAxisAlignment.spaceBetween,
                                        //           children: [
                                        //             SizedBox(
                                        //               child: Text(
                                        //                 'Adeola Ofemilago Sarah Precious',
                                        //                 style: AppStyles.textPoppinsStyle(
                                        //                   color: cardTextColor,
                                        //                   size: MediaQuery.of(context)
                                        //                           .size
                                        //                           .width *
                                        //                       0.03,
                                        //                   // height: 0.5,
                                        //                   weight: FontWeight.w700,
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //             GestureDetector(
                                        //               onTap: () {
                                        //                 Get.rawSnackbar(
                                        //                     backgroundColor: AppColors.dark,
                                        //                     borderRadius: 10.0,
                                        //                     // colorText: AppColors.white,
                                        //                     snackPosition:
                                        //                         SnackPosition.BOTTOM,
                                        //                     margin: const EdgeInsets.only(
                                        //                         bottom: 40.0,
                                        //                         left: 22.0,
                                        //                         right: 22.0),
                                        //                     messageText: Center(
                                        //                       child: Text(
                                        //                         'copié',
                                        //                         style: AppStyles.textStyle(
                                        //                           color: Colors.white,
                                        //                           size: 12,
                                        //                           weight: FontWeight.w400,
                                        //                         ),
                                        //                       ),
                                        //                     ),
                                        //                     padding:
                                        //                         const EdgeInsets.symmetric(
                                        //                             vertical: 10.0));
                                        //               },
                                        //               child: Container(
                                        //                 padding: const EdgeInsets.symmetric(
                                        //                     horizontal: 12.0,
                                        //                     vertical: 6.0),
                                        //                 decoration: BoxDecoration(
                                        //                     color: AppColors.dark,
                                        //                     borderRadius:
                                        //                         BorderRadius.circular(5)),
                                        //                 child: Text(
                                        //                   'copier',
                                        //                   style: AppStyles.textPoppinsStyle(
                                        //                     color: Colors.white,
                                        //                     size: 12,
                                        //                     weight: FontWeight.w700,
                                        //                     // height: 0.17,
                                        //                     // letterSpacing: -0.48,
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //             )
                                        //           ],
                                        //         ),
                                        //       )
                                        //     : const SizedBox(),
                                        // !_topNavBarController.isCardDetailsActivated.value
                                        //     ?
                                        Text(
                                          _cardController
                                              .cards![_cardController
                                                  .selectedCardIndex!.value]
                                              .name!
                                              .capitalize!,
                                          style: AppStyles.textStyle(
                                            color: cardTextColor,
                                            size: 13.0,
                                            // height: 0.11,
                                            weight: FontWeight.w400,
                                          ),
                                        )
                                        // : const SizedBox(),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'CVV',
                                                style: AppStyles.textStyle(
                                                  color: cardTextColor,
                                                  size: 10,
                                                  // height: 0.11,
                                                  weight: FontWeight.w400,
                                                ),
                                              ),
                                              // _topNavBarController
                                              //         .isCardDetailsActivated.value
                                              //     ? Text(
                                              //         '557',
                                              //         style: AppStyles.textPoppinsStyle(
                                              //           color: cardTextColor,
                                              //           size: 18,
                                              //           weight: FontWeight.w700,
                                              //         ),
                                              //       )
                                              //     :
                                              Text(
                                                '•••',
                                                style: AppStyles.textStyle(
                                                  color: cardTextColor,
                                                  size: 35,
                                                  height: 0.5,
                                                  weight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 30.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Expiration',
                                                  style: AppStyles.textStyle(
                                                    color: cardTextColor,
                                                    size: 10,
                                                    // height: 0.11,
                                                    weight: FontWeight.w400,
                                                  ),
                                                ),
                                                // _topNavBarController
                                                //         .isCardDetailsActivated.value
                                                //     ? Text(
                                                //         '04/26',
                                                //         style: AppStyles.textPoppinsStyle(
                                                //           color: cardTextColor,
                                                //           size: 18,
                                                //           weight: FontWeight.w700,
                                                //         ),
                                                //       )
                                                //     :
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: '••',
                                                        style:
                                                            AppStyles.textStyle(
                                                          color: cardTextColor,
                                                          size: 35,
                                                          weight:
                                                              FontWeight.w400,
                                                          height: 0.5,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '/',
                                                        style: TextStyle(
                                                          color: cardTextColor,
                                                          fontSize: 20,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0.5,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '••••',
                                                        style:
                                                            AppStyles.textStyle(
                                                          color: cardTextColor,
                                                          size: 35,
                                                          weight:
                                                              FontWeight.w400,
                                                          height: 0.5,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 18.0, bottom: 1.5, right: 16.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SvgPicture.asset(
                                            isVisa
                                                ? Assets.icons.visaBleu
                                                : Assets.icons.masterCard,
                                            width: 60.0,
                                            color: iconColor,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _topNavBarController
                                                        .isCardDetailsActivated
                                                        .value
                                                    ? "Cacher"
                                                    : 'Voir details',
                                                style: AppStyles.textStyle(
                                                  color: cardTextColor,
                                                  size: 13,
                                                  weight: FontWeight.w500,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  if (_topNavBarController
                                                      .isCardDetailsActivated
                                                      .value) {
                                                    _topNavBarController
                                                        .isCardDetailsActivated(
                                                            false);
                                                    _formController
                                                        .isCardDetailsBottomSheetShow(
                                                            false);
                                                  } else {
                                                    _formController
                                                        .isCardDetailsRequestPasswordBottomSheetShow(
                                                            true);
                                                  }
                                                },
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      height: 35.0,
                                                      width: 90.0,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              AppColors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30.0)),
                                                    ),
                                                    Positioned(
                                                      right: _topNavBarController
                                                              .isCardDetailsActivated
                                                              .value
                                                          ? 0
                                                          : null,
                                                      // alignment: Alignment.cent,
                                                      child: Container(
                                                        height: 35.0,
                                                        width: 35.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                                color: AppColors
                                                                    .dark,
                                                                shape: BoxShape
                                                                    .circle),
                                                        child: Center(
                                                          child: Icon(
                                                            _topNavBarController
                                                                    .isCardDetailsActivated
                                                                    .value
                                                                ? FontAwesomeIcons
                                                                    .eyeSlash
                                                                : FontAwesomeIcons
                                                                    .eye,
                                                            color:
                                                                AppColors.white,
                                                            size: 13.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // _formController.isCardRechargeMessageVisible.value
                              //     ? Container(
                              //         padding: const EdgeInsets.only(
                              //             top: 12.0,
                              //             bottom: 12.0,
                              //             left: 12.0,
                              //             right: 8.0),
                              //         decoration: BoxDecoration(
                              //             color: AppColors.redFSecondary,
                              //             borderRadius:
                              //                 BorderRadius.circular(12.0)),
                              //         child: Row(
                              //             mainAxisAlignment:
                              //                 MainAxisAlignment.spaceBetween,
                              //             children: [
                              //               SvgPicture.asset(
                              //                 Assets.icons.sekureIconRed,
                              //                 // width: 15.0,
                              //               ),
                              //               SizedBox(
                              //                 width: Constants.screenWidth(
                              //                         context) /
                              //                     1.5,
                              //                 child: Text.rich(
                              //                   TextSpan(
                              //                     children: [
                              //                       TextSpan(
                              //                         text:
                              //                             'Hello ${localUser.name},',
                              //                         style:
                              //                             AppStyles.textStyle(
                              //                           color: AppColors.white,
                              //                           size: 10,
                              //                           weight: FontWeight.w700,
                              //                           height: 1,
                              //                         ),
                              //                       ),
                              //                       TextSpan(
                              //                         text:
                              //                             ' La recharge de carte est présentement indisponibles. Pas de panique, nous y travaillons déjà',
                              //                         style:
                              //                             AppStyles.textStyle(
                              //                           color: AppColors.white,
                              //                           size: 10,
                              //                           weight: FontWeight.w400,
                              //                           height: 1,
                              //                         ),
                              //                       ),
                              //                     ],
                              //                   ),
                              //                 ),
                              //               ),
                              //               GestureDetector(
                              //                 onTap: () {
                              //                   _formController
                              //                       .isCardRechargeMessageVisible(
                              //                           false);
                              //                 },
                              //                 child: Container(
                              //                   padding:
                              //                       const EdgeInsets.all(6.0),
                              //                   child: const Icon(
                              //                       FontAwesomeIcons.close,
                              //                       color: AppColors.white,
                              //                       size: 17.0),
                              //                 ),
                              //               ),
                              //             ]),
                              //       )
                              //     : const SizedBox()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
