import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/models/transaction_model.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/main_screen/components/history_item_component.dart';
import 'package:secure_app/screens/main_screen/components/loading_history_item_component.dart';
import 'package:secure_app/screens/main_screen/main_screen.dart';
import 'package:secure_app/widgets/horizontal_tab_element_widget.dart';
import 'package:secure_app/widgets/input_field_widget.dart';

import '../../../widgets/horizontal_tab_element_widget2.dart';
import '../components/history_item_component2.dart';

class HistoryScreen extends StatelessWidget {
  final bool isSeeMoreVisibles;
  HistoryScreen({super.key, this.isSeeMoreVisibles = false, required this.fem, required this.ffem});
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());
  final TransactionController _transactionController =
      Get.put(TransactionController());
  final List<String> tabListItem = [
    "Tout",
    "Solde",
    "Cartes",
    "Transferts",
  ];
  final double fem;
  final double ffem;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 50*fem),
      width: 393*fem,
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(27*fem, isSeeMoreVisibles ? 0*fem : 30*fem, 8*fem, 7.64*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 82*fem, 0*fem),
                          child: Text( isSeeMoreVisibles ?
                            '\nDernieres transactions ' : ' Mes Transactions ',
                            style: AppStyles.textStyle (
                              size: isSeeMoreVisibles ? 18*ffem : 30*ffem,
                              weight: isSeeMoreVisibles ? FontWeight.w700 : FontWeight.w600,
                              height: isSeeMoreVisibles ? 1*ffem/fem : 1.15*ffem/fem,
                              letterSpacing: isSeeMoreVisibles ? -0.09*fem : -0.15*fem,
                              color: AppColors.chatBubleBg,
                            ),
                          ),
                        ),
                        isSeeMoreVisibles ?
                        Container(
                          margin: EdgeInsets.fromLTRB(0*fem, 15*fem, 0*fem, 0*fem),
                          padding: EdgeInsets.fromLTRB(0*fem, 5*fem, 0*fem, 0*fem),
                          child: TextButton(
                            onPressed: () {
                              _topNavBarController.setPageIndex(3);
                            },
                            style: TextButton.styleFrom (
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              'voir plus',
                              style: AppStyles.textStyle (
                                size: 13*ffem,
                                weight: FontWeight.w400,
                                height: 2.6538461538*ffem/fem,
                                letterSpacing: -0.065*fem,
                                color: AppColors.grey200Color,
                              ),
                            ),
                          ),
                        )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  !isSeeMoreVisibles
                      ? Padding(
                    padding: EdgeInsets.only(top: 4*fem, bottom: 5*fem),
                    child: InputField(
                      labelText:
                      "Rechercher un montant, un site, un numero, etc ...",
                      hasIcon: false,
                      isElevated: false,
                      hasShadow: false,
                      hasSuffix: true,
                      isHistorySearch: true,
                      // isPhoneNumber: true,
                      maxLine: 1,
                      hasMaxLine: true,
                      isNotRegularCaracter: true,
                      inputBg: AppColors.facebookAdsCardBgColor,
                      // contentPadding: 16.0,
                      suffixIcon: const Icon(FontAwesomeIcons.search,
                          color: AppColors.grey300, size: 16.0),
                      icon: FontAwesomeIcons.a,
                      keyboardType: TextInputType.text,
                      iconColor: AppColors.dark,
                      contentPadding: 0.0,
                      paddingRight: 0.0,
                      value: _transactionController.phone.value,
                      onChanged: (String value) {
                        _transactionController.searchValue(value);
                        _transactionController
                            .searchATransaction(isSeeMoreVisibles);
                        print(_transactionController.searchTransaction!.length);
                      },
                    ),
                  )
                      : const SizedBox(),
                ],
              ),
            ),
            Center(
              child: SizedBox(
                height: 37.0,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.fromLTRB(5*fem, 0*fem, 0*fem, 0*fem),
                    itemCount: tabListItem.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          // _transactionController
                          //     .searchATransaction(isSeeMoreVisibles);
                          _topNavBarController.selectedHistoryFilter(index);
                        },
                        child: Obx(() {
                          return HorizontalTabElementWidget2(
                            label: tabListItem[index],
                            hasMargin: index != 0,
                            isSelected: _topNavBarController
                                .selectedHistoryFilter.value ==
                                index,
                            fem: fem,
                            ffem: ffem,
                          );
                        }),
                      );
                    })),
              ),
            ),
            Obx(() {
              return Padding(
                padding: EdgeInsets.fromLTRB(15*fem, 10*fem, 8*fem, 7.64*fem),
                child: ListView.builder(
                    shrinkWrap: true,
                    // scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: _transactionController.isLoading.value &&
                        isSeeMoreVisibles
                        ? 3
                        : _transactionController.searchValue.isNotEmpty &&
                        !isSeeMoreVisibles
                        ? _transactionController.searchTransaction!.length
                        : _transactionController.isLoading.value &&
                        !isSeeMoreVisibles
                        ? 10
                        : _topNavBarController.selectedHistoryFilter.value ==
                        0
                        ? (isSeeMoreVisibles &&
                        _transactionController.transactions!.length >
                            3)
                        ? 3
                        : _transactionController
                        .transactions!.length
                        : _topNavBarController.selectedHistoryFilter.value ==
                        1
                        ? (isSeeMoreVisibles &&
                        _transactionController
                            .soldTransactions!
                            .length >
                            3)
                        ? 3
                        : _transactionController
                        .soldTransactions!.length
                        : _topNavBarController.selectedHistoryFilter.value ==
                        2
                        ? (isSeeMoreVisibles &&
                        _transactionController
                            .cardTransactions!
                            .length >
                            3)
                        ? 3
                        : _transactionController
                        .cardTransactions!.length
                        : (isSeeMoreVisibles &&
                        _transactionController
                            .transfertTransactions!
                            .length >
                            3)
                        ? 3
                        : _transactionController
                        .transfertTransactions!
                        .length,
                    itemBuilder: ((context, index) {
                      if(_transactionController.isLoading.value){
                        return const LoadingHistoryItemComponent();
                      } else{
                        return HistoryItemComponent2(
                            transaction: _transactionController
                                .searchValue.isNotEmpty &&
                                !isSeeMoreVisibles
                                ? _transactionController
                                .searchTransaction![index]
                                : _topNavBarController
                                .selectedHistoryFilter.value ==
                                0
                                ? _transactionController
                                .transactions![index]
                                : _topNavBarController
                                .selectedHistoryFilter
                                .value ==
                                1
                                ? _transactionController
                                .soldTransactions![index]
                                : _topNavBarController
                                .selectedHistoryFilter
                                .value ==
                                2
                                ? _transactionController
                                .cardTransactions![index]
                                : _transactionController
                                .transfertTransactions![
                            index], fem: fem, ffem: ffem);
                      }

                    })),
              );
            }),
            (!_transactionController.isLoading.value &&
                (
                    (_transactionController.searchValue.isNotEmpty && !isSeeMoreVisibles) ||
                    (_topNavBarController.selectedHistoryFilter.value == 0 && (_transactionController.transactions!.isEmpty)) ||
                    (_topNavBarController.selectedHistoryFilter.value == 1 && (_transactionController.soldTransactions!.isEmpty)) ||
                    (_topNavBarController.selectedHistoryFilter.value == 2 && (_transactionController.cardTransactions!.isEmpty)) ||
                    (_topNavBarController.selectedHistoryFilter.value == 3 && (_transactionController.transfertTransactions!.isEmpty))
                )
            )
                ? Center(
              child: Column(
                children: [
                  SizedBox(height: Constants.screenHeight(context) / 10),
                  SvgPicture.asset(
                    Assets.images.noItemsSvg,
                    width: 250*fem,
                  ),
                  // Image.asset(
                  //   Assets.images.noItems.path,
                  //   width: 250.0,
                  // ),
                  SizedBox(
                    width: Constants.screenWidth(context) / 1.5,
                    child: Text(
                      "Aucune transaction pour l'instant",
                      textAlign: TextAlign.center,
                      style: AppStyles.textPoppinsStyle(
                        color: AppColors.dark,
                        size: 12*ffem,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            )
                : const SizedBox()
          ],
        );
      }),
    );
  }
}
