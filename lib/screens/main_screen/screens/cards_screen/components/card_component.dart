import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/card_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/main_screen/screens/loader_screen/loader_screen.dart';
import 'package:secure_app/widgets/card_button_widget.dart';
import 'package:secure_app/widgets/primary_button.dart';

class CardComponent extends StatelessWidget {
  final bool isVisa;
  final String cardDescription;
  final String buttonLabel;
  final Color cardColor;
  final Color cardTextColor;
  final Color bubleColor;
  final Color bubleTextColor;
  final Color? iconColor;
  CardComponent(
      {super.key,
      required this.isVisa,
      required this.cardDescription,
      required this.buttonLabel,
      required this.cardColor,
      required this.cardTextColor,
      required this.bubleColor,
      required this.bubleTextColor,
      this.iconColor});

  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());
  final CardController _cardController = Get.put(CardController());
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          Container(
            // height: Constants.screenHeight(context) / 2,
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0),
            decoration: BoxDecoration(
                color: cardColor, borderRadius: BorderRadius.circular(12.0)),
            child: Stack(
              children: [
                Positioned(
                    bottom: 20,
                    right: 0.0,
                    child: SvgPicture.asset(Assets.icons.cardDescRightBg)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          isVisa ? "Carte Visa" : 'Carte Mastercard',
                          style: AppStyles.textStyle(
                            color: cardTextColor,
                            size: 23.0,
                            // height: 0.11,
                            weight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: SvgPicture.asset(
                            isVisa
                                ? Assets.icons.visaBleu
                                : Assets.icons.masterCard,
                            color: iconColor,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Numéro de carte',
                            style: TextStyle(
                              color: Color(0xFF1E1E1E),
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              // height: 0,
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              '•••• •••• •••• •••• ',
                              style: AppStyles.textStyle(
                                color: cardTextColor,
                                size: MediaQuery.of(context).size.width * 0.11,
                                height: 0.5,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // width: Constants.screenWidth(context) / 2.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    Text(
                                      'Titulaire de la carte',
                                      style: AppStyles.textStyle(
                                        color: cardTextColor,
                                        size: 13.0,
                                        // height: 0.11,
                                        weight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      Text(
                                        'XXX',
                                        style: AppStyles.textStyle(
                                          color: cardTextColor,
                                          size: 13,
                                          // height: 0.11,
                                          weight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        Text(
                                          'XX / 20XX',
                                          style: TextStyle(
                                            color: cardTextColor,
                                            fontSize: 13,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 43.0, bottom: 1.5),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CardButtonWidget(
                                      buttonLabel: "Carte de debit",
                                      color: AppColors.primary,
                                      textColor: AppColors.white,
                                      padding:
                                          MediaQuery.of(context).size.width *
                                              0.015,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.015),
                                    CardButtonWidget(
                                      buttonLabel: "Multiusage",
                                      color: bubleColor,
                                      textColor: bubleTextColor,
                                      padding:
                                          MediaQuery.of(context).size.width *
                                              0.015,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CardButtonWidget(
                                    buttonLabel: "Aucun frais mensuels",
                                    color: bubleColor,
                                    textColor: bubleTextColor,
                                    padding: MediaQuery.of(context).size.width *
                                        0.015,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.015),
                                  CardButtonWidget(
                                    hasSpecialCaracters: true,
                                    buttonLabel: "Limité à 10 000 USD/mois",
                                    color: bubleColor,
                                    textColor: bubleTextColor,
                                    padding: MediaQuery.of(context).size.width *
                                        0.015,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   width: 164,
                        //   height: 180,
                        //   // width: Constants.screenWidth(context) / 2.83,
                        //   child: SvgPicture.asset(
                        //     Assets.icons.cardDescRightBg,
                        //     fit: BoxFit.cover,
                        //   ),
                        // )
                      ],
                    ),
                    IntrinsicHeight(
                      child: Container(
                        margin: const EdgeInsets.only(right: 16.0, top: 5.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 16.0),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              children: [
                                Text(
                                  'L’obtenir à',
                                  style: TextStyle(
                                    color: Color(0xFF1E1E1E),
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                Text(
                                  '9900 FCFA',
                                  style: TextStyle(
                                    color: Color(0xFF828181),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: AppColors.dark,
                                    decorationThickness: 2.0,
                                    height: 0,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  child: Text(
                                    '3900 Fcfa',
                                    style: TextStyle(
                                      color: Color(0xFF0F0F0F),
                                      fontSize: 25,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6.0),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: const BoxDecoration(
                                    color: AppColors.dark,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      FontAwesomeIcons.arrowRight,
                                      color: AppColors.white,
                                      size: 10.0,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 11.0, bottom: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 14.0),
                  child: SvgPicture.asset(Assets.icons.arrowRigth),
                ),
                Expanded(
                  child: Text(
                    cardDescription,
                    style: AppStyles.textStyle(
                      color: Colors.black,
                      size: 12,
                      weight: FontWeight.w300,
                      height: 0.9,
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // _topNavBarController.setPageIndex(7);
              _topNavBarController.isVisaCardChoosed(isVisa);
              _topNavBarController.loaderProvider("buy card");
              _cardController.selectedBrand(isVisa ? "VISA" : "MASTERCARD");
              if (int.tryParse(localUser.currentBalance!) != null &&
                  (int.tryParse(localUser.currentBalance!)! > 3900)) {
                Get.to(const LoaderScreen());
              } else {
                Constants.snackBar(
                    bgColor: AppColors.red,
                    textColor: AppColors.white,
                    description:
                        "Votre solde Sekure est insuffisant, Merci de recharger d'un montant de 3900 XAF pour creer votre carte");
              }
            },
            child: PrimaryButton(
              textButton: buttonLabel,
              buttonColor: AppColors.dark,
              hasIcon: true,
              circleIconColor: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
