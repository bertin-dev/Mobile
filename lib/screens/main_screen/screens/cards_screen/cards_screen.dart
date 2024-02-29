import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/card_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/widgets/small_card_widget.dart';
import 'package:secure_app/screens/main_screen/main_screen.dart';
import 'package:secure_app/screens/main_screen/screens/cards_screen/components/last_card_loader_component.dart';
import 'package:secure_app/widgets/card_button_widget.dart';
import 'package:shimmer/shimmer.dart';

class CardsScreen extends StatelessWidget {
  CardsScreen({super.key});
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());
  final CardController _cardController = Get.put(CardController());

  final ScrollController _scrollController = ScrollController();


  final _hasInternet = true.obs;

  Future<void> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    _hasInternet.value = connectivityResult != ConnectivityResult.none;
  }

  void showNoInternetToast() {
    Constants.snackBar(
        bgColor: Colors.red,
        textColor: Colors.white,
        description:
        'Aucune connexion internet !');
    }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0), //22.0
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 38.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Acheter',
                          style: AppStyles.textStyle(
                            color: AppColors.primary,
                            size: 39,
                            height: 0.9,
                            weight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: ' en ligne avec les ',
                          style: AppStyles.textStyle(
                            color: AppColors.dark,
                            size: 39,
                            height: 0.99,
                            weight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: 'meilleurs taux',
                          style: AppStyles.textStyle(
                            color: AppColors.primary,
                            size: 39,
                            height: 0.99,
                            weight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: ' du dollars',
                          style: AppStyles.textStyle(
                            color: AppColors.dark,
                            size: 39,
                            height: 0.99,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Tu peux créer jusqu’à 06 cartes virtuelles",
                    style: TextStyle(
                        color: AppColors.dark,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 8.0),
                  child: Text(
                    'Derniere carte',
                    style: AppStyles.textStyle(
                      color: AppColors.dark,
                      size: 18,
                      weight: FontWeight.w700,
                    ),
                  ),
                ),
                _hasInternet.value
                ? GestureDetector(
                  onTap: () {
                    _cardController.selectedCardIndex!(_cardController.cards!
                        .indexOf(_cardController.cards!.last));
                    _topNavBarController.pageIndex(7);
                    _topNavBarController.scrollController.jumpTo(0);
                    Get.to(() => const MainScreen());
                  },
                  child: _cardController.isLoading.value
                      ? LastCardLoaderComponent()
                      : Container(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.08,
                            vertical: MediaQuery.of(context).size.width * 0.032,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Carte ${_cardController.cards!.last.brand!.capitalize!}',
                                    style: AppStyles.textStyle(
                                      color: AppColors.white,
                                      size: MediaQuery.of(context).size.width *
                                          0.04,
                                      weight: FontWeight.w500,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                      _cardController.cards!.last.brand ==
                                              "VISA"
                                          ? Assets.icons.visaBleu
                                          : Assets.icons.masterCard),
                                ],
                              ),
                              Text(
                                'Numéro de carte',
                                style: AppStyles.textStyle(
                                  color: AppColors.white,
                                  size:
                                      MediaQuery.of(context).size.width * 0.027,
                                  weight: FontWeight.w400,
                                ),
                              ),
                              FittedBox(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '•••• •••• •••• ',
                                        style: AppStyles.textStyle(
                                          color: AppColors.white,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.12,
                                          height: 0.9,
                                          weight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            _cardController.cards!.last.number!
                                                .substring(
                                                    (_cardController.cards!.last
                                                            .number!.length -
                                                        4),
                                                    _cardController.cards!.last
                                                        .number!.length),
                                        style: AppStyles.textStyle(
                                          color: AppColors.white,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.07,
                                          weight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CardButtonWidget(
                                        buttonLabel: "Carte de debit",
                                        color: AppColors.white,
                                        textColor: AppColors.dark,
                                        padding:
                                            MediaQuery.of(context).size.width *
                                                0.015,
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.015),
                                      CardButtonWidget(
                                        buttonLabel: "Multiusage",
                                        color: AppColors.dark,
                                        textColor: AppColors.white,
                                        padding:
                                            MediaQuery.of(context).size.width *
                                                0.015,
                                      ),
                                    ],
                                  ),
                                  Opacity(
                                    opacity: 0.50,
                                    child: FittedBox(
                                      child: Text(
                                        'Crée le 03 Juillet 2023',
                                        style: AppStyles.textStyle(
                                          color: AppColors.white,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                          weight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                )
                : Container(),
                Container(
                  margin: const EdgeInsets.only(top: 11.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20.0),
                  decoration: BoxDecoration(
                      color: AppColors.facebookAdsCardBgColor,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(Assets.icons.facebookPng.path),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Facebook Ads',
                                  style: AppStyles.textStyle(
                                    color: AppColors.dark,
                                    size:
                                        Constants.screenWidth(context) * 0.034,
                                    weight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Hier, 15:35',
                                  style: AppStyles.textStyle(
                                    color: AppColors.dark,
                                    size:
                                        Constants.screenWidth(context) * 0.027,
                                    weight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '-15.50 XAF',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Constants.screenWidth(context) * 0.043,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0.09,
                        ),
                      )
                    ],
                  ),
                ),
                _cardController.cards!.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 26.0, bottom: 7.0),
                        child: Text(
                          'Toutes mes cartes',
                          style: AppStyles.textStyle(
                            color: AppColors.dark,
                            size: 18,
                            weight: FontWeight.w700,
                          ),
                        ),
                      )
                    : const SizedBox(),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 7.0,
                  childAspectRatio: 1.2,
                  mainAxisSpacing: 7.0,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  children:
                      List.generate(_cardController.cards!.length, (index) {
                    return SmallCardWidget(
                      color: AppColors.primary,
                      card: _cardController.cards![index],
                    );
                  }),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: GestureDetector(
                //         onTap: () {
                //           _topNavBarController.setPageIndex(7);
                //         },
                //         child: Container(
                //           padding: const EdgeInsets.all(11.0),
                //           decoration: BoxDecoration(
                //             color: AppColors.cardColor1,
                //             borderRadius: BorderRadius.circular(10.0),
                //           ),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text(
                //                 'Carte Visa',
                //                 style: AppStyles.textStyle(
                //                   color: AppColors.white,
                //                   size: 14,
                //                   weight: FontWeight.w500,
                //                 ),
                //               ),
                //               const Text(
                //                 '**** **** **** 5547',
                //                 style: TextStyle(
                //                   color: Color(0xFFFAF7F0),
                //                   fontSize: 13,
                //                   fontFamily: 'Poppins',
                //                   fontWeight: FontWeight.w500,
                //                 ),
                //               ),
                //               const Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   CardButtonWidget(
                //                     buttonLabel: "Carte de debit",
                //                     color: AppColors.white,
                //                     textColor: AppColors.dark,
                //                     padding: 8.0,
                //                   ),
                //                   SizedBox(width: 7.0),
                //                   CardButtonWidget(
                //                     buttonLabel: "Multiusage",
                //                     color: AppColors.dark,
                //                     textColor: AppColors.white,
                //                     padding: 8.0,
                //                   ),
                //                 ],
                //               ),
                //               const Padding(
                //                 padding: EdgeInsets.only(top: 10.0),
                //                 child: Opacity(
                //                   opacity: 0.50,
                //                   child: Text(
                //                     'Créée le 03 Juillet 2023',
                //                     style: TextStyle(
                //                       color: Colors.white,
                //                       fontSize: 10,
                //                       fontFamily: 'Poppins',
                //                       fontWeight: FontWeight.w400,
                //                       height: 0,
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Image.asset(Assets.icons.visa.path),
                //                   Container(
                //                     padding: const EdgeInsets.all(8.0),
                //                     decoration: const BoxDecoration(
                //                       color: AppColors.dark,
                //                       shape: BoxShape.circle,
                //                     ),
                //                     child: const Center(
                //                       child: Icon(
                //                         FontAwesomeIcons.arrowRight,
                //                         color: AppColors.white,
                //                         size: 10.0,
                //                       ),
                //                     ),
                //                   )
                //                 ],
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     const SizedBox(
                //         width: 16.0), // Espace entre les deux conteneurs
                //     Expanded(
                //       child: GestureDetector(
                //         onTap: () {
                //           _topNavBarController.setPageIndex(7);
                //         },
                //         child: Container(
                //           padding: const EdgeInsets.all(11.0),
                //           decoration: BoxDecoration(
                //             color: AppColors.cardColor2,
                //             borderRadius: BorderRadius.circular(10.0),
                //           ),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text(
                //                 'Mastercard',
                //                 style: AppStyles.textStyle(
                //                   color: AppColors.white,
                //                   size: 14,
                //                   weight: FontWeight.w500,
                //                 ),
                //               ),
                //               const Text(
                //                 '**** **** **** 5547',
                //                 style: TextStyle(
                //                   color: Color(0xFFFAF7F0),
                //                   fontSize: 13,
                //                   fontFamily: 'Poppins',
                //                   fontWeight: FontWeight.w500,
                //                 ),
                //               ),
                //               const Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   CardButtonWidget(
                //                     buttonLabel: "Carte de debit",
                //                     color: AppColors.white,
                //                     textColor: AppColors.dark,
                //                     padding: 8.0,
                //                   ),
                //                   SizedBox(width: 7.0),
                //                   CardButtonWidget(
                //                     buttonLabel: "Multiusage",
                //                     color: AppColors.dark,
                //                     textColor: AppColors.white,
                //                     padding: 8.0,
                //                   ),
                //                 ],
                //               ),
                //               const Padding(
                //                 padding: EdgeInsets.only(top: 10.0),
                //                 child: Opacity(
                //                   opacity: 0.50,
                //                   child: Text(
                //                     'Créée le 03 Juillet 2023',
                //                     style: TextStyle(
                //                       color: Colors.white,
                //                       fontSize: 10,
                //                       fontFamily: 'Poppins',
                //                       fontWeight: FontWeight.w400,
                //                       height: 0,
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   SvgPicture.asset(Assets.icons.masterCardWhite),
                //                   Container(
                //                     padding: const EdgeInsets.all(8.0),
                //                     decoration: const BoxDecoration(
                //                       color: AppColors.dark,
                //                       shape: BoxShape.circle,
                //                     ),
                //                     child: const Center(
                //                       child: Icon(
                //                         FontAwesomeIcons.arrowRight,
                //                         color: AppColors.white,
                //                         size: 10.0,
                //                       ),
                //                     ),
                //                   )
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 16.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: GestureDetector(
                //         onTap: () {
                //           _topNavBarController.setPageIndex(7);
                //         },
                //         child: Container(
                //           // width: Constants.screenWidth(context) / 3,
                //           padding: const EdgeInsets.all(11.0),
                //           decoration: BoxDecoration(
                //             color: AppColors.primary,
                //             borderRadius: BorderRadius.circular(10.0),
                //           ),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text(
                //                 'Mastercard',
                //                 style: AppStyles.textStyle(
                //                   color: AppColors.white,
                //                   size: 14,
                //                   weight: FontWeight.w500,
                //                 ),
                //               ),
                //               const Text(
                //                 '**** **** **** 5547',
                //                 style: TextStyle(
                //                   color: Color(0xFFFAF7F0),
                //                   fontSize: 13,
                //                   fontFamily: 'Poppins',
                //                   fontWeight: FontWeight.w500,
                //                 ),
                //               ),
                //               const Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   CardButtonWidget(
                //                     buttonLabel: "Carte de debit",
                //                     color: AppColors.white,
                //                     textColor: AppColors.dark,
                //                     padding: 8.0,
                //                   ),
                //                   SizedBox(width: 7.0),
                //                   CardButtonWidget(
                //                     buttonLabel: "Multiusage",
                //                     color: AppColors.dark,
                //                     textColor: AppColors.white,
                //                     padding: 8.0,
                //                   ),
                //                 ],
                //               ),
                //               const Padding(
                //                 padding: EdgeInsets.only(top: 10.0),
                //                 child: Opacity(
                //                   opacity: 0.50,
                //                   child: Text(
                //                     'Créée le 03 Juillet 2023',
                //                     style: TextStyle(
                //                       color: Colors.white,
                //                       fontSize: 10,
                //                       fontFamily: 'Poppins',
                //                       fontWeight: FontWeight.w400,
                //                       height: 0,
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   SvgPicture.asset(Assets.icons.masterCardWhite),
                //                   Container(
                //                     padding: const EdgeInsets.all(8.0),
                //                     decoration: const BoxDecoration(
                //                         color: AppColors.dark,
                //                         shape: BoxShape.circle),
                //                     child: const Center(
                //                         child: Icon(
                //                       FontAwesomeIcons.arrowRight,
                //                       color: AppColors.white,
                //                       size: 10.0,
                //                     )),
                //                   )
                //                 ],
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     const SizedBox(
                //         width: 16.0), // Espace entre les deux conteneurs
                //     Expanded(
                //       child: GestureDetector(
                //         onTap: () {
                //           _topNavBarController.setPageIndex(7);
                //         },
                //         child: Container(
                //           // width: Constants.screenWidth(context) / 3,
                //           padding: const EdgeInsets.all(11.0),
                //           decoration: BoxDecoration(
                //             color: AppColors.cardColor3,
                //             borderRadius: BorderRadius.circular(10.0),
                //           ),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text(
                //                 'Mastercard',
                //                 style: AppStyles.textStyle(
                //                   color: AppColors.white,
                //                   size: 14,
                //                   weight: FontWeight.w500,
                //                 ),
                //               ),
                //               const Text(
                //                 '**** **** **** 5547',
                //                 style: TextStyle(
                //                   color: Color(0xFFFAF7F0),
                //                   fontSize: 13,
                //                   fontFamily: 'Poppins',
                //                   fontWeight: FontWeight.w500,
                //                 ),
                //               ),
                //               const Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   CardButtonWidget(
                //                     buttonLabel: "Carte de debit",
                //                     color: AppColors.white,
                //                     textColor: AppColors.dark,
                //                     padding: 8.0,
                //                   ),
                //                   SizedBox(width: 7.0),
                //                   CardButtonWidget(
                //                     buttonLabel: "Multiusage",
                //                     color: AppColors.dark,
                //                     textColor: AppColors.white,
                //                     padding: 8.0,
                //                   ),
                //                 ],
                //               ),
                //               const Padding(
                //                 padding: EdgeInsets.only(top: 10.0),
                //                 child: Opacity(
                //                   opacity: 0.50,
                //                   child: Text(
                //                     'Créée le 03 Juillet 2023',
                //                     style: TextStyle(
                //                       color: Colors.white,
                //                       fontSize: 10,
                //                       fontFamily: 'Poppins',
                //                       fontWeight: FontWeight.w400,
                //                       height: 0,
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   SvgPicture.asset(Assets.icons.masterCardWhite),
                //                   Container(
                //                     padding: const EdgeInsets.all(8.0),
                //                     decoration: const BoxDecoration(
                //                         color: AppColors.dark,
                //                         shape: BoxShape.circle),
                //                     child: const Center(
                //                       child: Icon(
                //                         FontAwesomeIcons.arrowRight,
                //                         color: AppColors.white,
                //                         size: 10.0,
                //                       ),
                //                     ),
                //                   )
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     )
                //   ],
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Attention Les données de votre carte et de votre compte sekure doivent rester personnelles. Protegez toujours  vos informations et assurez vous de la crédibilité et de la sécurisation des sites ^sur lesquels vous entrez vos données ',
                    style: AppStyles.textStyle(
                        color: AppColors.dark,
                        size: 10.0,
                        weight: FontWeight.w300),
                  ),
                ),
                SizedBox(height: Constants.screenHeight(context) / 8),
              ],
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: const PrimaryButton(
          //     textButton: "Obtenir une nouvelle carte",
          //     buttonColor: AppColors.dark,
          //     hasIcon: true,
          //     paddingleft: 0.0,
          //     sizedBoxSizes: 0.0,
          //     circleIconColor: AppColors.white,
          //   ),
          // ),
        ],
      );
    });
  }
}
