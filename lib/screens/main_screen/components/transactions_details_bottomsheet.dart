import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gleap_sdk/gleap_sdk.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';

class TransactionDetailsBottomSheet extends StatelessWidget {
  TransactionDetailsBottomSheet({super.key});
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());

  final FormController _formController = Get.put(FormController());

  final TransactionController _transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
                  return _formController.showTransactionDetailsBottomSheet.value
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
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Détails de la transaction',
                              style: AppStyles.textStyle(
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
                                      .showTransactionDetailsBottomSheet(false);
                                },
                                child: const Icon(FontAwesomeIcons.close)),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Transaction N",
                                  style: AppStyles.textStyle(
                                    color: AppColors.dark,
                                    weight: FontWeight.w600,
                                    size: 15.0,
                                  ),
                                ),
                                Text(
                                  "Statut",
                                  style: AppStyles.textStyle(
                                    color: AppColors.dark,
                                    weight: FontWeight.w600,
                                    size: 15.0,
                                  ),
                                ),
                                Text(
                                  "Date",
                                  style: AppStyles.textStyle(
                                    color: AppColors.dark,
                                    weight: FontWeight.w600,
                                    size: 15.0,
                                  ),
                                ),
                                Text(
                                  "Montant",
                                  style: AppStyles.textStyle(
                                    color: AppColors.dark,
                                    weight: FontWeight.w600,
                                    size: 15.0,
                                  ),
                                ),
                                Text(
                                  "Débiteur",
                                  style: AppStyles.textStyle(
                                    color: AppColors.dark,
                                    weight: FontWeight.w600,
                                    size: 15.0,
                                  ),
                                ),
                                if (_transactionController
                                            .transactionForDetails.value.type ==
                                        "transfert" &&
                                    _transactionController.transactionForDetails
                                            .value.number !=
                                        localUser.phone)
                                  Text(
                                    "Expéditeur",
                                    style: AppStyles.textStyle(
                                      color: AppColors.dark,
                                      weight: FontWeight.w600,
                                      size: 15.0,
                                    ),
                                  ),
                                Text(
                                  "Type",
                                  style: AppStyles.textStyle(
                                    color: AppColors.dark,
                                    weight: FontWeight.w600,
                                    size: 15.0,
                                  ),
                                ),
                                if (_transactionController
                                        .transactionForDetails.value.type ==
                                    "transfert")
                                  Text(
                                    "Message",
                                    style: AppStyles.textStyle(
                                      color: AppColors.dark,
                                      weight: FontWeight.w600,
                                      size: 15.0,
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(width: Constants.screenWidth(context) / 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "sk${_transactionController.transactionForDetails.value.id!.substring(0, 5)}${_transactionController.transactionForDetails.value.id!.substring(_transactionController.transactionForDetails.value.id!.length - 4, _transactionController.transactionForDetails.value.id!.length)}",
                                  style: AppStyles.textStyle(
                                    color: AppColors.dark,
                                    weight: FontWeight.w500,
                                    size: 13.0,
                                  ),
                                ),
                                const SizedBox(height: 2.0),
                                Text(
                                  _transactionController.transactionForDetails.value.status != null &&
                                          _transactionController
                                                  .transactionForDetails
                                                  .value
                                                  .status!
                                                  .toLowerCase() ==
                                              "pending"
                                      ? "En cours"
                                      : _transactionController.transactionForDetails.value.status != null &&
                                              _transactionController
                                                      .transactionForDetails
                                                      .value
                                                      .status!
                                                      .toLowerCase() ==
                                                  "failed"
                                          ? "Echec"
                                          : _transactionController.transactionForDetails.value.status != null &&
                                                  _transactionController
                                                          .transactionForDetails
                                                          .value
                                                          .status!
                                                          .toLowerCase() ==
                                                      "canceled"
                                              ? "Annulé"
                                              : _transactionController
                                                              .transactionForDetails
                                                              .value
                                                              .type!
                                                              .toLowerCase() ==
                                                          "transfert" &&
                                                      _transactionController
                                                              .transactionForDetails
                                                              .value
                                                              .number ==
                                                          localUser.phone
                                                  ? "Envoyé"
                                                  : _transactionController.transactionForDetails.value.type!.toLowerCase() == "transfert" && _transactionController.transactionForDetails.value.number != localUser.phone
                                                      ? "Reçu"
                                                      : "Réussi",
                                  style: AppStyles.textStyle(
                                    color: AppColors.dark,
                                    weight: FontWeight.w500,
                                    size: 13.0,
                                  ),
                                ),
                                const SizedBox(height: 2.0),
                                Text(
                                  _transactionController
                                      .transactionForDetails.value.createdAt!,
                                  style: AppStyles.textStyle(
                                    color: AppColors.dark,
                                    weight: FontWeight.w500,
                                    size: 13.0,
                                  ),
                                ),
                                const SizedBox(height: 2.0),
                                Text(
                                  "${double.parse(_transactionController.transactionForDetails.value.amount!)} Fcfa",
                                  style: AppStyles.textStyle(
                                    color: AppColors.dark,
                                    weight: FontWeight.w500,
                                    size: 13.0,
                                  ),
                                ),
                                const SizedBox(height: 2.0),
                                Text(
                                  _transactionController.transactionForDetails
                                              .value.type ==
                                          "transfert"
                                      ? "Solde sekure"
                                      : _transactionController
                                                  .transactionForDetails
                                                  .value
                                                  .method ==
                                              "ORANGE_MONEY"
                                          ? "Orange Money"
                                          : "MTN Momo",
                                  style: AppStyles.textStyle(
                                    color: AppColors.dark,
                                    weight: FontWeight.w500,
                                    size: 13.0,
                                  ),
                                ),
                                const SizedBox(height: 2.0),
                                if (_transactionController
                                            .transactionForDetails.value.type ==
                                        "transfert" &&
                                    _transactionController.transactionForDetails
                                            .value.number !=
                                        localUser.phone)
                                  Text(
                                    _transactionController.transactionForDetails
                                            .value.expeditor?.capitalize ??
                                        "/",
                                    style: AppStyles.textStyle(
                                      color: AppColors.dark,
                                      weight: FontWeight.w500,
                                      size: 13.0,
                                    ),
                                  ),
                                const SizedBox(height: 2.0),
                                Text(
                                  _transactionController.transactionForDetails
                                                  .value.type ==
                                              "transfert" &&
                                          _transactionController
                                                  .transactionForDetails
                                                  .value
                                                  .number !=
                                              localUser.phone
                                      ? "Transfert reçu"
                                      : _transactionController
                                                      .transactionForDetails
                                                      .value
                                                      .type ==
                                                  "transfert" &&
                                              _transactionController
                                                      .transactionForDetails
                                                      .value
                                                      .number ==
                                                  localUser.phone
                                          ? "Transfert envoyé"
                                          : _transactionController
                                              .transactionForDetails
                                              .value
                                              .type!
                                              .capitalize!,
                                  style: AppStyles.textStyle(
                                    color: AppColors.dark,
                                    weight: FontWeight.w500,
                                    size: 13.0,
                                  ),
                                ),
                                const SizedBox(height: 2.0),
                                if (_transactionController
                                        .transactionForDetails.value.type ==
                                    "transfert")
                                  Text(
                                    _transactionController.transactionForDetails
                                            .value.message ??
                                        "/",
                                    style: AppStyles.textStyle(
                                      color: AppColors.dark,
                                      weight: FontWeight.w500,
                                      size: 13.0,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 18.0, bottom: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _transactionController.transactionForDetails
                                                .value.type!
                                                .toLowerCase() ==
                                            "transfert" &&
                                        _transactionController
                                                .transactionForDetails
                                                .value
                                                .number !=
                                            localUser.phone
                                    ? GestureDetector(
                                        onTap: () {
                                          final String debiteur =
                                              _transactionController
                                                          .transactionForDetails
                                                          .value
                                                          .type ==
                                                      "transfert"
                                                  ? "Solde sekure"
                                                  : _transactionController
                                                              .transactionForDetails
                                                              .value
                                                              .method ==
                                                          "ORANGE_MONEY"
                                                      ? "Orange Money"
                                                      : "MTN Momo";
                                          Gleap.preFillForm(
                                            formData: <String, dynamic>{
                                              'description':
                                                  'Signalement de la transaction ${_transactionController.transactionForDetails.value.id}',
                                              'errordescription':
                                                  'type: ${_transactionController.transactionForDetails.value.type},\nstatus: ${_transactionController.transactionForDetails.value.status},\ndate: ${_transactionController.transactionForDetails.value.createdAt},\nmontant: ${_transactionController.transactionForDetails.value.amount},\ndebiteur: $debiteur',
                                            },
                                          );
                                          Gleap.open();
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5.0,
                                                horizontal: 16.0),
                                            decoration: BoxDecoration(
                                              color: AppColors.bgColor,
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
                                                    "Signaler",
                                                    style: AppStyles
                                                        .textStyle(
                                                            color:
                                                                AppColors.dark,
                                                            size: 13.0,
                                                            weight: FontWeight
                                                                .w500),
                                                  ),
                                                ),
                                                const SizedBox(width: 20.0),
                                                Container(
                                                  // height: 30.0,
                                                  // width: 30.0,
                                                  // margin: EdgeInsets.only(right: 16.0),
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: AppColors.dark,
                                                          shape:
                                                              BoxShape.circle),
                                                  child: const Icon(
                                                    FontAwesomeIcons.close,
                                                    color: AppColors.white,
                                                    size: 15.0,
                                                  ),
                                                ),
                                              ],
                                            )),
                                      )
                                    : Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            final String debiteur =
                                                _transactionController
                                                            .transactionForDetails
                                                            .value
                                                            .type ==
                                                        "transfert"
                                                    ? "Solde sekure"
                                                    : _transactionController
                                                                .transactionForDetails
                                                                .value
                                                                .method ==
                                                            "ORANGE_MONEY"
                                                        ? "Orange Money"
                                                        : "MTN Momo";
                                            Gleap.preFillForm(
                                              formData: <String, dynamic>{
                                                'description':
                                                    'Signalement de la transaction ${_transactionController.transactionForDetails.value.id}',
                                                'errordescription':
                                                    'type: ${_transactionController.transactionForDetails.value.type},\nstatus: ${_transactionController.transactionForDetails.value.status},\ndate: ${_transactionController.transactionForDetails.value.createdAt},\nmontant: ${_transactionController.transactionForDetails.value.amount},\ndebiteur: $debiteur',
                                              },
                                            );
                                            Gleap.open();
                                          },
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 16.0),
                                              decoration: BoxDecoration(
                                                color: AppColors.bgColor,
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
                                                      "Signaler",
                                                      style: AppStyles
                                                          .textStyle(
                                                              color: AppColors
                                                                  .dark,
                                                              size: 13.0,
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
                                                    child: const Icon(
                                                      FontAwesomeIcons.close,
                                                      color: AppColors.white,
                                                      size: 15.0,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ),
                                const SizedBox(width: 30.0),
                                _transactionController.transactionForDetails
                                                .value.type!
                                                .toLowerCase() ==
                                            "transfert" &&
                                        _transactionController
                                                .transactionForDetails
                                                .value
                                                .number !=
                                            localUser.phone
                                    ? const SizedBox()
                                    : Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            _transactionController.amount(
                                                _transactionController
                                                    .transactionForDetails
                                                    .value
                                                    .amount!);
                                            _transactionController.phone(
                                                _transactionController
                                                    .transactionForDetails
                                                    .value
                                                    .number);
                                            print(_transactionController
                                                .transactionForDetails
                                                .value
                                                .number);
                                            if (_transactionController
                                                    .transactionForDetails
                                                    .value
                                                    .type ==
                                                "recharge") {
                                              _formController
                                                  .isRechargeBottomSheet(true);
                                              _formController
                                                  .isAccountTransactionBottomSheetShow(
                                                      true);
                                              _topNavBarController
                                                  .loaderProvider(
                                                      "card transaction");
                                            } else if (_transactionController
                                                    .transactionForDetails
                                                    .value
                                                    .type ==
                                                "transfert") {
                                              _formController
                                                  .isAccountTransactionBottomSheetShow(
                                                      false);
                                              _topNavBarController
                                                  .loaderProvider("transfert");

                                              _transactionController.phone(
                                                  _transactionController
                                                      .transactionForDetails
                                                      .value
                                                      .slug!
                                                      .split("-")[1]);
                                              _topNavBarController
                                                  .setPageIndex(2);
                                            } else {
                                              _topNavBarController
                                                  .loaderProvider(
                                                      "card transaction");
                                              _formController
                                                  .isRechargeBottomSheet(false);
                                              _formController
                                                  .isAccountTransactionBottomSheetShow(
                                                      true);
                                            }
                                            // Get.off(() => LoaderScreen());
                                            _formController
                                                .showTransactionDetailsBottomSheet(
                                                    false);
                                          },
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 16.0),
                                              decoration: BoxDecoration(
                                                color: AppColors.bgColor,
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
                                                      "Répéter",
                                                      style: AppStyles
                                                          .textStyle(
                                                              color: AppColors
                                                                  .dark,
                                                              size: 13.0,
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
                                                            color: AppColors
                                                                .primary,
                                                            shape: BoxShape
                                                                .circle),
                                                    child: const Icon(
                                                      FontAwesomeIcons
                                                          .arrowRight,
                                                      color: AppColors.white,
                                                      size: 14.0,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
                      : const SizedBox();
                }) ;
  }
}