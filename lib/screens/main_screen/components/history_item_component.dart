import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/models/transaction_model.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:shimmer/shimmer.dart';

class HistoryItemComponent extends StatelessWidget {
  final TransactionModel transaction;
  HistoryItemComponent({super.key, required this.transaction});
  final TransactionController _transactionController =
      Get.put(TransactionController());

  final FormController _formController = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _transactionController.transactionForDetails(transaction);
        print(transaction.toJson());
        _formController.showTransactionDetailsBottomSheet(true);
      },
      child: Container(
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
              Row(
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
                          padding: const EdgeInsets.all(16.0),
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
                          child: SvgPicture.asset(
                              transaction.type!.toLowerCase() == "recharge"
                                  ? Assets.icons.remove
                                  : Assets.icons.recharge),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(left: 19.0),
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
                                      ? AppColors.red
                                      : AppColors.dark,
                                  size: 16,
                                  weight: FontWeight.w500,
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
                            : Text(
                                transaction.createdAt!,
                                // _transactionController
                                //     .parseDate(transaction.createdAt!),
                                style: AppStyles.textPoppinsStyle(
                                  color: transaction.status != null &&
                                          transaction.status!.toLowerCase() ==
                                              "failed"
                                      ? AppColors.red
                                      : AppColors.dark,
                                  size: 11,
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
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
                            height: 15.0,
                            width: 80.0,
                            color: AppColors.grey300,
                          ),
                        )
                      : Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: transaction.type!.toLowerCase() ==
                                        "recharge"
                                    ? "+ "
                                    // ? "+ \$"
                                    : transaction.type!.toLowerCase() ==
                                                "transfert" &&
                                            transaction.number !=
                                                localUser.phone
                                        ? '+ '
                                        : '- ',
                                // ? '+ \$'
                                // : '- \$',
                                style: TextStyle(
                                  color: transaction.status != null &&
                                          transaction.status!.toLowerCase() ==
                                              "failed"
                                      ? AppColors.red
                                      : AppColors.dark,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: transaction.type!.toLowerCase() ==
                                        "recharge"
                                    ? "${double.parse(transaction.amount!)} XAF"
                                    : "${double.parse(transaction.amount!)} XAF",
                                style: AppStyles.textPoppinsStyle(
                                  color: transaction.status != null &&
                                          transaction.status!.toLowerCase() ==
                                              "failed"
                                      ? AppColors.red
                                      : AppColors.dark,
                                  size: 15,
                                  weight: FontWeight.w500,
                                ),
                              ),
                            ],
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
                      : Text(
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
                          style: AppStyles.textPoppinsStyle(
                            color:
                                // transaction.status!.toLowerCase() == "pending"
                                //     ? AppColors.yellowLight
                                //     :
                                transaction.status != null &&
                                        transaction.status!.toLowerCase() ==
                                            "failed"
                                    ? AppColors.red
                                    : transaction.status != null &&
                                            transaction.status!.toLowerCase() ==
                                                "pending"
                                        ? AppColors.orange
                                        : AppColors.primary,
                            size: 13,
                          ),
                        ),
                ],
              )
            ],
          )),
    );
  }
}
