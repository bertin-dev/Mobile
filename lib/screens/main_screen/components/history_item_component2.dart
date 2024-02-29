import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/models/transaction_model.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:shimmer/shimmer.dart';

class HistoryItemComponent2 extends StatelessWidget {
  final TransactionModel transaction;
  final double fem;
  final double ffem;
  HistoryItemComponent2({super.key, required this.transaction, required this.fem, required this.ffem});
  final TransactionController _transactionController =
      Get.put(TransactionController());

  final FormController _formController = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration (
          borderRadius: BorderRadius.circular(15*fem),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                _transactionController.transactionForDetails(transaction);
                print(transaction.toJson());
                _formController.showTransactionDetailsBottomSheet(true);
              },
              style: TextButton.styleFrom (
                padding: EdgeInsets.zero,
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(11.25*fem, 7.5*fem, 11.25*fem, 7.5*fem),
                width: double.infinity,
                height: 60*fem,
                decoration: BoxDecoration (
                  color: AppColors.grey700Color,
                  borderRadius: BorderRadius.circular(15*fem),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _transactionController.isLoading.value
                          ? Shimmer.fromColors(
                        enabled: true,
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          padding: const EdgeInsets.all(24.0),
                          decoration: BoxDecoration(
                              color: AppColors.grey300,
                              borderRadius: BorderRadius.circular(12.0)),
                        ),
                      )
                          : Container(
                        width: 45*fem,
                        height: 45*fem,
                        decoration: BoxDecoration(
                            color:
                            transaction.type!.toLowerCase() == "recharge"
                                ? AppColors.primary
                                : AppColors.dark,
                            border:
                            transaction.type!.toLowerCase() == "recharge"
                                ? Border.all()
                                : null,
                            borderRadius: BorderRadius.circular(12.0)),
                        child: transaction.status != null &&
                            transaction.status!.toLowerCase() ==
                                "failed" ? Image.asset(
                          'assets/images/auto-group-2qef.png',
                          width: 45*fem,
                          height: 45*fem,
                        ) : transaction.type!.toLowerCase() == "recharge" || transaction.type!.toLowerCase() == "transfert" ? Image.asset(
                          'assets/images/auto-group-5yfq.png',
                          width: 45*fem,
                          height: 45*fem,
                        ) : Image.asset(
                          'assets/images/auto-group-txq3.png',
                          width: 45*fem,
                          height: 45*fem,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10*fem, 1*fem, 0*fem, 1*fem),
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0*fem, 3*fem, 114.5*fem, 8*fem),
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _transactionController.isLoading.value
                                      ? Shimmer.fromColors(
                                    enabled: true,
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                      height: 15.0,
                                      width: 80.0,
                                      color: AppColors.grey300,
                                    ),
                                  )
                                      : Text(
                                    transaction.type!.capitalize!,
                                    style: AppStyles.textStyle(
                                      color: transaction.status != null &&
                                          transaction.status!.toLowerCase() ==
                                              "failed"
                                          ? AppColors.white150Color
                                          : AppColors.textCustomerServiceColor,
                                      size: 13*ffem,
                                      weight: FontWeight.w500,
                                      height: 1.2575*ffem/fem,
                                    ),
                                  ),
                                  _transactionController.isLoading.value
                                      ? Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Shimmer.fromColors(
                                      enabled: true,
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.grey.shade100,
                                      child: Container(
                                        height: 15.0,
                                        width: 100.0,
                                        color: AppColors.grey300,
                                      ),
                                    ),
                                  )
                                      :
                                  Text(
                                    formatDate(transaction.createdAt!),
                                    style: AppStyles.textStyle (
                                      size: 11*ffem,
                                      color: transaction.status != null &&
                                          transaction.status!.toLowerCase() ==
                                              "failed"
                                          ? AppColors.white150Color
                                          : AppColors.dark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                _transactionController.isLoading.value
                                    ? Shimmer.fromColors(
                                  enabled: true,
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Container(
                                    height: 15*fem,
                                    width: 80*fem,
                                    color: AppColors.grey300,
                                  ),
                                )
                                    : Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                      child: Text.rich(
                                        TextSpan(
                                      children: [
                                        TextSpan(
                                          text: transaction.type!.toLowerCase() ==
                                              "recharge"
                                              ? "+ "
                                              : transaction.type!.toLowerCase() ==
                                              "transfert" &&
                                              transaction.number !=
                                                  localUser.phone
                                              ? '+ '
                                              : '- ',
                                          style: AppStyles.textStyle (
                                            fontFamily: 'Poppins',
                                            size: 12*ffem,
                                            weight: FontWeight.w500,
                                            height: 1.2575*ffem/fem,
                                            color: transaction.status != null &&
                                          transaction.status!.toLowerCase() ==
                                              "failed"
                                              ? AppColors.white150Color
                                              : AppColors.txtSoldeColor,
                                          ),
                                        ),
                                        TextSpan(
                                          text: transaction.type!.toLowerCase() ==
                                              "recharge"
                                              ? "${double.parse(transaction.amount!)} Fcfa"
                                              : "${double.parse(transaction.amount!)} Fcfa",
                                          style: AppStyles.textStyle(
                                            color: transaction.status != null &&
                                                transaction.status!.toLowerCase() ==
                                                    "failed"
                                                ? AppColors.white150Color
                                                : AppColors.txtSoldeColor,
                                              size: 12*ffem,
                                              weight: FontWeight.w500,
                                              height: 1.2575*ffem/fem,
                                          ),
                                        ),
                                      ],
                                        ),
                                      ),
                                    ),
                                _transactionController.isLoading.value
                                    ? Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Shimmer.fromColors(
                                    enabled: true,
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                      height: 15.0,
                                      width: 50.0,
                                      color: AppColors.grey300,
                                    ),
                                  ),
                                )
                                    : Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 0*fem),
                                      child: Text(
                                        transaction.status != null &&
                                        transaction.status!.toLowerCase() == "pending"
                                        ? "En cours"
                                        : transaction.status != null &&
                                        transaction.status!.toLowerCase() ==
                                            "failed"
                                        ? "Echec"
                                        : transaction.status != null &&
                                        transaction.status!.toLowerCase() ==
                                            "canceled"
                                        ? "Annulé"
                                        : transaction.type!.toLowerCase() ==
                                        "transfert" &&
                                        transaction.number ==
                                            localUser.phone
                                        ? "Envoyé"
                                        : transaction.type!.toLowerCase() ==
                                        "transfert" &&
                                        transaction.number !=
                                            localUser.phone
                                        ? "Reçu"
                                        : "Réussi",
                                        textAlign: TextAlign.right,
                                      style: AppStyles.textStyle(
                                        size: 11*ffem,
                                        weight: FontWeight.w400,
                                        height: 1.5*ffem/fem,
                                      color:
                                      transaction.status != null &&
                                          transaction.status!.toLowerCase() ==
                                              "failed"
                                          ? AppColors.white150Color
                                          : transaction.status != null &&
                                          transaction.status!.toLowerCase() ==
                                              "pending"
                                          ? AppColors.orange
                                          : AppColors.primary,
                                      ),
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
              ),
            ),
            SizedBox(
              height: 15*fem,
            ),
          ],
        ));
  }

  String formatDate(String dateString) {
    final formatter = DateFormat('dd-MM-yyyy HH:mm');
    final dateTime = formatter.parse(dateString);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    if (dateTime.isAtSameMomentAs(today)) {
      return 'Aujourd\'hui';
    } else if (dateTime.isAtSameMomentAs(yesterday)) {
      return 'Hier';
    } else {
      final difference = today.difference(dateTime).inDays;
      if (difference == 1) {
        return 'Il y a 1 jour';
      } else {
        return 'Il y a $difference jours';
      }
    }
  }
}
