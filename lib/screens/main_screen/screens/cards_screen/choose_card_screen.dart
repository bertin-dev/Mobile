import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/add_card_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/main_screen/screens/cards_screen/components/card_component.dart';

class ChooseCardScreen extends StatelessWidget {
  ChooseCardScreen({super.key});
  final AddCardController _addCardController = Get.put(AddCardController());
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());

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
    AppColors.white,
    AppColors.dark,
    AppColors.dark,
    AppColors.dark,
    AppColors.white,
    AppColors.white,
    AppColors.dark,
    AppColors.dark,
    AppColors.dark,
    AppColors.dark,
  ];

  final List<Color> bubleColors = [
    AppColors.white,
    AppColors.dark,
    AppColors.dark,
    AppColors.dark,
    AppColors.white,
    AppColors.white,
    AppColors.dark,
    AppColors.dark,
    AppColors.dark,
    AppColors.dark,
  ];

  final List<Color> bubleTextColors = [
    AppColors.dark,
    AppColors.white,
    AppColors.white,
    AppColors.white,
    AppColors.dark,
    AppColors.dark,
    AppColors.white,
    AppColors.white,
    AppColors.white,
    AppColors.white,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor,
      child: SingleChildScrollView(
        controller: _topNavBarController.scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 29.0, bottom: 21.0),
              child: GestureDetector(
                onTap: () {
                  _topNavBarController.pageIndex(1);
                  _topNavBarController.scrollController.jumpTo(0);
                  // Get.back();
                },
                child: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  // size: 25.0,
                ),
              ),
            ),
            SizedBox(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Cr',
                      style: AppStyles.textStyle(
                        color: AppColors.primary,
                        size: 39.0,
                        height: 0.9,
                        weight: FontWeight.w500,
                      ),
                    ),
                    const TextSpan(
                      text: 'é',
                      style: TextStyle(
                        color: Color(0xFF18BC7A),
                        fontSize: 39.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.9,
                        letterSpacing: -0.20,
                      ),
                    ),
                    TextSpan(
                      text: 'e',
                      style: AppStyles.textStyle(
                        color: AppColors.primary,
                        size: 39.0,
                        height: 0.9,
                        weight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: ' ta carte, recharge et ',
                      style: AppStyles.textStyle(
                        color: AppColors.dark,
                        size: 39.0,
                        height: 0.9,
                        weight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: 'ach',
                      style: AppStyles.textStyle(
                        color: AppColors.primary,
                        size: 39.0,
                        height: 0.9,
                        weight: FontWeight.w500,
                      ),
                    ),
                    const TextSpan(
                      text: 'è',
                      style: TextStyle(
                        color: Color(0xFF18BC7A),
                        fontSize: 39,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.9,
                        letterSpacing: -0.20,
                      ),
                    ),
                    TextSpan(
                      text: 'te',
                      style: AppStyles.textStyle(
                        color: AppColors.primary,
                        size: 39.0,
                        height: 0.9,
                        weight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: ' en ligne',
                      style: AppStyles.textStyle(
                        color: AppColors.dark,
                        size: 39.0,
                        height: 0.9,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0, top: 18.0),
              child: Text(
                'Obtiens une carte Visa ou Mastercard qui te convient',
                style: AppStyles.textStyle(
                  color: AppColors.dark,
                  size: 12.0,
                  // height: 0.11,
                  weight: FontWeight.w300,
                ),
              ),
            ),
            Container(
              // height: 50.0,
              // width: 16.0,
              width: Constants.screenWidth(context),
              margin: const EdgeInsets.only(bottom: 21.0),
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Text(
                        'Choisis une couleur pour ta carte',
                        style: AppStyles.textStyle(
                          color: AppColors.dark,
                          size: 10.0,
                          // height: 0.11,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () {
                            _addCardController.selectedColor.value = 0;
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 16.0,
                                  width: 16.0,
                                  // margin: EdgeInsets.only(),
                                  decoration: BoxDecoration(
                                    color: cardColors[0],
                                    border: Border.all(),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Obx(() {
                                  return _addCardController
                                              .selectedColor.value ==
                                          0
                                      ? Container(
                                          margin: const EdgeInsets.only(),
                                          height: 3.0,
                                          width: 16.0,
                                          color: AppColors.dark,
                                        )
                                      : const SizedBox();
                                }),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () {
                            _addCardController.selectedColor.value = 1;
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 16.0,
                                  width: 16.0,
                                  margin: const EdgeInsets.only(),
                                  decoration: BoxDecoration(
                                    color: cardColors[1],
                                    border: Border.all(),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Obx(() {
                                  return _addCardController
                                              .selectedColor.value ==
                                          1
                                      ? Container(
                                          // margin: EdgeInsets.only(),
                                          height: 3.0,
                                          width: 16.0,
                                          color: AppColors.dark,
                                        )
                                      : const SizedBox();
                                }),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () {
                            _addCardController.selectedColor.value = 2;
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 16.0,
                                  width: 16.0,
                                  margin: const EdgeInsets.only(),
                                  decoration: BoxDecoration(
                                    color: cardColors[2],
                                    border: Border.all(),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Obx(() {
                                  return _addCardController
                                              .selectedColor.value ==
                                          2
                                      ? Container(
                                          margin: const EdgeInsets.only(),
                                          height: 3.0,
                                          width: 16.0,
                                          color: AppColors.dark,
                                        )
                                      : const SizedBox();
                                }),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () {
                            _addCardController.selectedColor.value = 3;
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 16.0,
                                  width: 16.0,
                                  margin: const EdgeInsets.only(),
                                  decoration: BoxDecoration(
                                    color: cardColors[3],
                                    border: Border.all(),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Obx(() {
                                  return _addCardController
                                              .selectedColor.value ==
                                          3
                                      ? Container(
                                          margin: const EdgeInsets.only(),
                                          height: 3.0,
                                          width: 16.0,
                                          color: AppColors.dark,
                                        )
                                      : const SizedBox();
                                }),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () {
                            _addCardController.selectedColor.value = 4;
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 16.0,
                                  width: 16.0,
                                  margin: const EdgeInsets.only(),
                                  decoration: BoxDecoration(
                                    color: cardColors[4],
                                    border: Border.all(),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Obx(() {
                                  return _addCardController
                                              .selectedColor.value ==
                                          4
                                      ? Container(
                                          margin: const EdgeInsets.only(),
                                          height: 3.0,
                                          width: 16.0,
                                          color: AppColors.dark,
                                        )
                                      : const SizedBox();
                                }),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () {
                            _addCardController.selectedColor.value = 5;
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 16.0,
                                  width: 16.0,
                                  margin: const EdgeInsets.only(),
                                  decoration: BoxDecoration(
                                    color: cardColors[5],
                                    border: Border.all(),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Obx(() {
                                  return _addCardController
                                              .selectedColor.value ==
                                          5
                                      ? Container(
                                          margin: const EdgeInsets.only(),
                                          height: 3.0,
                                          width: 16.0,
                                          color: AppColors.dark,
                                        )
                                      : const SizedBox();
                                }),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () {
                            _addCardController.selectedColor.value = 6;
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 16.0,
                                  width: 16.0,
                                  margin: const EdgeInsets.only(),
                                  decoration: BoxDecoration(
                                    color: cardColors[6],
                                    border: Border.all(),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Obx(() {
                                  return _addCardController
                                              .selectedColor.value ==
                                          6
                                      ? Container(
                                          margin: const EdgeInsets.only(),
                                          height: 3.0,
                                          width: 16.0,
                                          color: AppColors.dark,
                                        )
                                      : const SizedBox();
                                }),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () {
                            _addCardController.selectedColor.value = 7;
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 16.0,
                                  width: 16.0,
                                  margin: const EdgeInsets.only(),
                                  decoration: BoxDecoration(
                                    color: cardColors[7],
                                    border: Border.all(),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Obx(() {
                                  return _addCardController
                                              .selectedColor.value ==
                                          7
                                      ? Container(
                                          margin: const EdgeInsets.only(),
                                          height: 3.0,
                                          width: 16.0,
                                          color: AppColors.dark,
                                        )
                                      : const SizedBox();
                                }),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () {
                            _addCardController.selectedColor.value = 8;
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 16.0,
                                  width: 16.0,
                                  margin: const EdgeInsets.only(),
                                  decoration: BoxDecoration(
                                    color: cardColors[8],
                                    border: Border.all(),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Obx(() {
                                  return _addCardController
                                              .selectedColor.value ==
                                          8
                                      ? Container(
                                          margin: const EdgeInsets.only(),
                                          height: 3.0,
                                          width: 16.0,
                                          color: AppColors.dark,
                                        )
                                      : const SizedBox();
                                }),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () {
                            _addCardController.selectedColor.value = 9;
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 16.0,
                                  width: 16.0,
                                  margin: const EdgeInsets.only(),
                                  decoration: BoxDecoration(
                                    color: cardColors[9],
                                    border: Border.all(),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Obx(() {
                                  return _addCardController
                                              .selectedColor.value ==
                                          9
                                      ? Container(
                                          margin: const EdgeInsets.only(),
                                          height: 3.0,
                                          width: 16.0,
                                          color: AppColors.dark,
                                        )
                                      : const SizedBox();
                                }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Container(
                    //   height: 45.0,
                    //   child: ListView.builder(
                    //     shrinkWrap: true,
                    //     itemCount: cardColors.length,
                    //     // padding: EdgeInsets.only(left: 10.0),
                    //     scrollDirection: Axis.horizontal,
                    //     itemBuilder: (context, index) {
                    //       return GestureDetector(
                    //         onTap: () {
                    //           _addCardController.selectedColor.value = index;
                    //         },
                    //         child: Center(
                    //           child: Column(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Container(
                    //                 height: 16.0,
                    //                 width: 16.0,
                    //                 margin: EdgeInsets.only(
                    //                     left: index > 0 ? 13.0 : 0.0),
                    //                 decoration: BoxDecoration(
                    //                   color: cardColors[index],
                    //                   border: Border.all(),
                    //                   shape: BoxShape.circle,
                    //                 ),
                    //               ),
                    //               Obx(() {
                    //                 return _addCardController
                    //                             .selectedColor.value ==
                    //                         index
                    //                     ? Container(
                    //                         margin: EdgeInsets.only(
                    //                             left: index > 0 ? 13.0 : 0.0),
                    //                         height: 3.0,
                    //                         width: 16.0,
                    //                         color: AppColors.dark,
                    //                       )
                    //                     : SizedBox();
                    //               }),
                    //             ],
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.only(top: 16.0),
                    //   height: 3.0,
                    //   // width: 16.0,
                    //   child: ListView.builder(
                    //       shrinkWrap: true,
                    //       itemCount: cardColors.length,
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: (context, index) {
                    //         print(index);
                    //         return Obx(() {
                    //           return _addCardController.selectedColor.value ==
                    //                   index
                    //               ? Container(
                    //                   margin: EdgeInsets.only(
                    //                       left: index > 0 ? 28.0 : 0.0),
                    //                   height: 3.0,
                    //                   width: 16.0,
                    //                   color: AppColors.dark,
                    //                 )
                    //               : const SizedBox();
                    //         });
                    //       }),
                    // ),
                  ],
                ),
              ),
            ),
            Obx(() {
              return CardComponent(
                isVisa: false,
                cardTextColor:
                    cardTextColors[_addCardController.selectedColor.value],
                cardColor: cardColors[_addCardController.selectedColor.value],
                bubleColor: bubleColors[_addCardController.selectedColor.value],
                bubleTextColor:
                    bubleTextColors[_addCardController.selectedColor.value],
                cardDescription:
                    "Idéale pour les sites de E-commerce, les abonnements aux plateformes multimedia et les achats sur applications sur Google.",
                buttonLabel: "Obtenir Mastercard",
              );
            }),
            Container(
              margin: const EdgeInsets.only(top: 24.0, bottom: 32.0),
              height: 3.0,
              color: AppColors.dark,
            ),
            Obx(() {
              return CardComponent(
                isVisa: true,
                cardColor: cardColors[_addCardController.selectedColor.value],
                cardTextColor:
                    cardTextColors[_addCardController.selectedColor.value],
                bubleColor: bubleColors[_addCardController.selectedColor.value],
                bubleTextColor:
                    bubleTextColors[_addCardController.selectedColor.value],
                cardDescription:
                    "Idéale pour les publicités sur les reseaux sociaux, les sites webs de E-commerce et les applications bancaires comme Wise, Payoneer, etc ...",
                buttonLabel: "Obtenir Visa",
                iconColor: _addCardController.selectedColor.value == 4
                    ? AppColors.white
                    : null,
              );
            }),
            SizedBox(
              height: Constants.screenHeight(context) / 25,
            )
          ]),
        ),
      ),
    );
  }
}
