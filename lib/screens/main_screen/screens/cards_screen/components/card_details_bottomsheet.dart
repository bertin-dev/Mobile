import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gleap_sdk/gleap_sdk.dart';
import 'package:secure_app/controllers/card_controller.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';

class CardDetailsBottomSheet extends StatelessWidget {
  CardDetailsBottomSheet({super.key});
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());

  final FormController _formController = Get.put(FormController());

  final TransactionController _transactionController =
      Get.put(TransactionController());
  final CardController _cardController = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return _formController.isCardDetailsBottomSheetShow.value
          ? Align(
              alignment: Alignment.bottomCenter,
              child: IntrinsicHeight(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 32.0, left: 25.0, right: 25.0),
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x33000000),
                            blurRadius: 24,
                            offset: Offset(0, -12),
                            spreadRadius: 0,
                          )
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(26.0),
                            topRight: Radius.circular(26.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Détails de la carte',
                              style: AppStyles.textPoppinsStyle(
                                color: const Color(0xFF0F0F0F),
                                size: 19,
                                weight: FontWeight.w600,
                                height: 0.9,
                                // letterSpacing: -0.12,
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  _formController
                                      .isCardDetailsBottomSheetShow(false);
                                  _topNavBarController
                                      .isCardDetailsActivated(false);
                                },
                                child: const Icon(FontAwesomeIcons.close)),
                          ],
                        ),
                        const Divider(),
                        CardDetailsElementComponent(
                            attribute: "Nom",
                            value: _cardController
                                .cards![
                                    _cardController.selectedCardIndex!.value]
                                .name!),
                        CardDetailsElementComponent(
                          attribute: "Numero",
                          value: _cardController
                              .cards![_cardController.selectedCardIndex!.value]
                              .number!,
                        ),
                        CardDetailsElementComponent(
                            attribute: "Expiration",
                            value: _cardController
                                .cards![
                                    _cardController.selectedCardIndex!.value]
                                .expiredAt!),
                        CardDetailsElementComponent(
                            attribute: "CVV",
                            value: _cardController
                                .cards![
                                    _cardController.selectedCardIndex!.value]
                                .cvv!),
                        CardDetailsElementComponent(
                            attribute: "Country code",
                            value: _cardController
                                .cards![
                                    _cardController.selectedCardIndex!.value]
                                .countryCode!),
                        CardDetailsElementComponent(
                            attribute: "City",
                            value: _cardController
                                .cards![
                                    _cardController.selectedCardIndex!.value]
                                .city!),
                        CardDetailsElementComponent(
                            attribute: "Street",
                            value: _cardController
                                .cards![
                                    _cardController.selectedCardIndex!.value]
                                .street!),
                        CardDetailsElementComponent(
                            attribute: "Postal code",
                            value: _cardController
                                .cards![
                                    _cardController.selectedCardIndex!.value]
                                .postalCode!),
                        // CardDetailsElementComponent(
                        //     attribute: "Nom", value: "Mon Nom"),
                        // CardDetailsElementComponent(
                        //     attribute: "Nom", value: "Mon Nom"),

                        // SizedBox(height: Constants.screenHeight(context) / 10)
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox();
    });
  }
}

class CardDetailsElementComponent extends StatelessWidget {
  final String attribute;
  final String value;
  const CardDetailsElementComponent(
      {super.key, required this.attribute, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7.0),
      padding: const EdgeInsets.all(16.0),
      decoration: ShapeDecoration(
        color: const Color(0x99FAF4E6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  attribute,
                  style: AppStyles.textStyle(
                    color: AppColors.dark,
                    size: 14.0,
                  ),
                ),
                Text(value,
                    style: AppStyles.textPoppinsStyle(
                      color: AppColors.dark,
                      size: 14.0,
                      weight: FontWeight.w600,
                    )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              await Clipboard.setData(ClipboardData(text: value));
              Get.rawSnackbar(
                  backgroundColor: AppColors.dark,
                  borderRadius: 10.0,
                  // colorText: AppColors.white,
                  snackPosition: SnackPosition.BOTTOM,
                  margin: const EdgeInsets.only(
                      bottom: 40.0, left: 22.0, right: 22.0),
                  messageText: Center(
                    child: Text(
                      'copié',
                      style: AppStyles.textStyle(
                        color: Colors.white,
                        size: 12,
                        weight: FontWeight.w400,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10.0));
            },
            child: const Icon(
              FontAwesomeIcons.copy,
              size: 18.0,
              color: AppColors.grey,
            ),
          )
        ],
      ),
    );
  }
}
