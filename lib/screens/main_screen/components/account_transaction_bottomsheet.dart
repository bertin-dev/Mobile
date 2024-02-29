import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/main_screen/screens/loader_screen/loader_screen.dart';
import 'package:secure_app/widgets/app_button_widget.dart';
import 'package:secure_app/widgets/input_field_widget.dart';
import 'package:secure_app/widgets/input_label.dart';

class AccountTransactionBottomSheet extends StatelessWidget {
  AccountTransactionBottomSheet({super.key});
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());

  final FormController _formController = Get.put(FormController());

  final TransactionController _transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    print(_topNavBarController.isKeyboardVisible);
    return Obx(() {
      return _formController.isAccountTransactionBottomSheetShow.value
          ? Align(
              alignment: Alignment.bottomCenter,
              child: IntrinsicHeight(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 32*fem, left: 20*fem, right: 20*fem),
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
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    _formController
                                        .isAccountTransactionBottomSheetShow(
                                            false);
                                    _transactionController.clearData();
                                    _formController.resetFormErrors();
                                  },
                                  child: const Icon(FontAwesomeIcons.close)),
                            ],
                          ),
                          _formController.isRechargeBottomSheet.value
                              ? SizedBox(
                                  child: Text.rich(
                                    TextSpan(
                                      style: AppStyles.textStyle (
                                        size: 25*ffem,
                                        weight: FontWeight.w500,
                                        height: 1*ffem/fem,
                                        letterSpacing: -0.125*fem,
                                        color: AppColors.txtSoldeColor,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Recharger',
                                          style: AppStyles.textStyle (
                                            size: 25*ffem,
                                            weight: FontWeight.w500,
                                            height: 1*ffem/fem,
                                            letterSpacing: -0.125*fem,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' ',
                                          style: AppStyles.textStyle (
                                            size: 25*ffem,
                                            weight: FontWeight.w500,
                                            height: 1*ffem/fem,
                                            letterSpacing: -0.125*fem,
                                            color: AppColors.txtSoldeColor,
                                          ),
                                        ),
                                         TextSpan(
                                          text: 'mon compte sekure',
                                          style: AppStyles.textStyle (
                                            size: 25*ffem,
                                            weight: FontWeight.w500,
                                            height: 1*ffem/fem,
                                            letterSpacing: -0.125*fem,
                                            color: AppColors.txtSoldeColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'Retirer directement vers votre',
                                          style: AppStyles.textStyle(
                                            color: const Color(0xFF0F0F0F),
                                            size: 25,
                                            weight: FontWeight.w500,
                                            height: 0.9,
                                            // letterSpacing: -0.12,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' mobile money',
                                          style: AppStyles.textStyle(
                                            color: AppColors.primary,
                                            size: 25,
                                            weight: FontWeight.w500,
                                            height: 0.9,
                                            // letterSpacing: -0.12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                           SizedBox(height: 8*fem),
                           InputLabel(
                              label: _formController.isRechargeBottomSheet.value ? "Montant de la recharge" : "Montant à retirer",
                             paddingTop: 2*fem,
                             color: AppColors.black900,),
                          Padding(
                            padding: EdgeInsets.only(top: 5*fem),
                            child: InputField(
                              labelText: "1000",
                              hasIcon: false,
                              isElevated: false,
                              hasShadow: false,
                              hasSuffix: true,
                              isNotRegularCaracter: true,
                              inputBg: AppColors.imputBg,
                              contentPadding: 16*fem,
                              suffixIcon: IntrinsicHeight(
                                child: IntrinsicWidth(
                                  child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8*fem),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10*fem),
                                      decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius: BorderRadius.circular(5*fem),),
                                      child: Center(
                                        child: Text("FCFA",
                                            style: AppStyles.textStyle(
                                                color: AppColors.white,
                                                fontFamily: 'Poppins',
                                                size: 16*ffem,
                                                weight: FontWeight.w700,
                                                height: 1.5*ffem/fem,
                                                letterSpacing: -0.64*fem,
                                            )
                                        ),
                                      )),
                                ),
                              ),
                              icon: FontAwesomeIcons.a,
                              keyboardType: TextInputType.phone,
                              iconColor: AppColors.dark,
                              value: _transactionController.amount.value,
                              onChanged: (String value) {
                                _transactionController.amount(value);
                                double amountinXAF = double.parse(value);
                                double transactionFees = 0;
                                if (_transactionController.amount.isNotEmpty) {
                                  // amountinXAF = (double.parse(
                                  //         _transactionController.amount.value) *
                                  //     (_formController.isRechargeBottomSheet.value
                                  //         ? 667
                                  //         : 600));
                                  transactionFees = (amountinXAF *
                                          (_formController
                                                  .isRechargeBottomSheet.value
                                              ? 0 //2
                                              : 2.5)) / //3
                                      100;
                                }
                                if (_formController
                                    .isRechargeBottomSheet.value) {
                                  _transactionController.amountToPay(
                                      (_transactionController.formatAmount(
                                              amountinXAF + transactionFees))
                                          .toString());
                                } else {
                                  _transactionController.amountToPay(
                                      (_transactionController.formatAmount(
                                              amountinXAF - transactionFees))
                                          .toString());
                                }
                                if (_formController
                                    .isRechargeBottomSheet.value) {
                                  _formController.fieldVerification(
                                    field: value,
                                    isName: true,
                                    errorCallback: (String error) =>
                                        _formController
                                            .hasErrorOnRechargeAmount(error),
                                  );
                                  if (double.parse(value).toInt() > 500000) {
                                    _formController.hasErrorOnRechargeAmount(
                                        "Le montant maximum de recharge est de 500.000 XAF , si vous souhaitez recharger plus de 500.000 XAF procéder en deux fois. Merci ");
                                  } else if (double.parse(value).toInt() <
                                      1000) {
                                    _formController.hasErrorOnRechargeAmount(
                                        "Le montant minimum est de 1000 XAF. Merci ");
                                  }

                                  // if (double.parse(value).toInt() > 730) {
                                  //   _formController.hasErrorOnRechargeAmount(
                                  //       "Le montant maximum de recharge est de \$730 , si vous souhaitez recharger plus de \$730 procéder en deux fois. Merci ");
                                  // }
                                } else {
                                  _formController.fieldVerification(
                                    field: value,
                                    isAmount: true,
                                    errorCallback: (String error) =>
                                        _formController
                                            .hasErrorOnRechargeAmount(error),
                                  );
                                }
                              },
                            ),
                          ),
                          _formController
                                  .hasErrorOnRechargeAmount.value.isNotEmpty
                              ? InputLabel(
                                  label: _formController
                                      .hasErrorOnRechargeAmount.value,
                                  paddingTop: 8*fem,
                                  hasSpecialCaraters: true,
                                  color: AppColors.red,
                                )
                              : const SizedBox(),
                          Padding(
                            padding: EdgeInsets.only(top: 5*fem),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    style: AppStyles.textStyle (
                                      size: 12*ffem,
                                      weight: FontWeight.w400,
                                      height: 2*ffem/fem,
                                      color: AppColors.black900,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: _formController
                                                .isRechargeBottomSheet.value
                                            ? 'Frais sekure :'
                                            : 'Frais de retrait :',
                                        style: AppStyles.textStyle (
                                            color: AppColors.black900,
                                            fontFamily: 'Lufga',
                                            size: 12*ffem,
                                            height: 2*ffem/fem,
                                            weight: FontWeight.w700),
                                      ),
                                      TextSpan(
                                        text: _formController
                                                .isRechargeBottomSheet.value
                                            ? ' 0'
                                            : ' 2.5',
                                        style: AppStyles.textStyle(
                                          color: AppColors.primary,
                                          fontFamily: 'Lufga',
                                          size: 12*ffem,
                                          height: 2*ffem/fem,
                                          weight: FontWeight.w700,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '%',
                                        style: AppStyles.textPoppinsStyle(
                                            color: AppColors.primary,
                                            size: 12*ffem,
                                            height: 2*ffem/fem,
                                            weight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 12*fem),
                                Text.rich(
                                  TextSpan(
                                    style: AppStyles.textStyle (
                                      size: 12*ffem,
                                      weight: FontWeight.w400,
                                      height: 2*ffem/fem,
                                      color: AppColors.black900,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: _formController
                                                .isRechargeBottomSheet.value
                                            ? 'Vous allez payer :'
                                            : "Vous allez recevoir : ",
                                        style: AppStyles.textStyle(
                                          color: AppColors.black900,
                                          fontFamily: 'Lufga',
                                          size: 12*ffem,
                                          height: 2*ffem/fem,
                                          weight: FontWeight.w700,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            ' ${_transactionController.amountToPay} Fcfa',
                                        style: AppStyles.textStyle(
                                          color: AppColors.primary,
                                          fontFamily: 'Lufga',
                                          size: 12*ffem,
                                          weight: FontWeight.w700,
                                          height: 2*ffem/fem,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InputLabel(
                            label: "Compte créditeur",
                            paddingTop: 20*fem,
                            color: AppColors.black900,
                            hasSpecialCaraters: true,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5*fem),
                            child: InputField(
                              labelText: "655443322",
                              hasIcon: false,
                              isElevated: false,
                              hasShadow: false,
                              hasSuffix: true,
                              isPhoneNumber: true,
                              maxLine: 1,
                              hasMaxLine: true,
                              isNotRegularCaracter: true,
                              inputBg: AppColors.imputBg,
                              contentPadding: 16*fem,
                              suffixIcon:
                                  Image.asset(Assets.icons.smallCmrFlag.path),
                              icon: FontAwesomeIcons.a,
                              keyboardType: TextInputType.number,
                              iconColor: AppColors.dark,
                              value: _transactionController.phone.value,
                              onChanged: (String value) {
                                _transactionController.phone(value);
                                _formController.fieldVerification(
                                  field: value,
                                  isPhoneNumber: true,
                                  errorCallback: (String error) =>
                                      _formController
                                          .hasErrorOnRechargePhone(error),
                                );
                              },
                            ),
                          ),
                          _formController
                                  .hasErrorOnRechargePhone.value.isNotEmpty
                              ? InputLabel(
                                  label: _formController
                                      .hasErrorOnRechargePhone.value,
                                  paddingTop: 8*fem,
                                  color: AppColors.red,
                                )
                              :  SizedBox(
                                  height: 15*fem,
                                ),
                          !_formController.isRechargeBottomSheet.value
                              ?  InputLabel(
                                  label: "Mot de passe",
                                  paddingTop: 10*fem,
                                )
                              : const SizedBox(),
                          !_formController.isRechargeBottomSheet.value
                              ? Obx(() {
                                  return Padding(
                                    padding: EdgeInsets.only(top: 5*fem),
                                    child: InputField(
                                      labelText: "••••••••••••",
                                      hasIcon: false,
                                      isElevated: false,
                                      hasShadow: false,
                                      hasSuffix: true,
                                      isNotRegularCaracter: true,
                                      obscureText:
                                          _formController.isObscurePass.value,
                                      hasMaxLine: true,
                                      maxLine: 1,
                                      contentPadding: 14*fem,
                                      suffixIcon: GestureDetector(
                                          onTap: () {
                                            _formController
                                                    .isObscurePass.value =
                                                !_formController
                                                    .isObscurePass.value;
                                          },
                                          child: _formController
                                                  .isObscurePass.value
                                              ? Icon(
                                                  FontAwesomeIcons.eye,
                                                  size: 18*fem,
                                                )
                                              : Icon(
                                                  FontAwesomeIcons.eyeSlash,
                                                  size: 18*fem,
                                                )),
                                      icon: FontAwesomeIcons.a,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      iconColor: AppColors.dark,
                                      value:
                                          _transactionController.password.value,
                                      onChanged: (String value) {
                                        _transactionController.password(value);
                                        _formController.fieldVerification(
                                          field: _transactionController
                                              .password.value,
                                          isSamePass: true,
                                          pass: localUser.password != null
                                              ? localUser.password!
                                              : "",
                                          errorCallback: (String error) =>
                                              _formController
                                                  .hasErrorOnSamePassword(
                                                      error),
                                        );
                                      },
                                    ),
                                  );
                                })
                              : const SizedBox(),
                          !_formController.isRechargeBottomSheet.value &&
                                  _formController
                                      .hasErrorOnSamePassword.value.isNotEmpty
                              ? InputLabel(
                                  label: _formController
                                      .hasErrorOnSamePassword.value,
                                  paddingTop: 8*fem,
                                  color: AppColors.red,
                                )
                              : const SizedBox(),

                          SizedBox(height: 20*fem),
                          // _formController.isRechargeBottomSheet.value
                          //     ?
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding:  EdgeInsets.all(3*fem),
                                    decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius:
                                            BorderRadius.circular(8*fem)),
                                    child: Icon(
                                      FontAwesomeIcons.check,
                                      color: AppColors.white,
                                      size: 13*fem,
                                    ),
                                  ),
                                  // const z,
                                  SizedBox(width: 5*fem),
                                  Expanded(
                                    child: Text(
                                      'Votre Argent est en sécurité chez Sekure et vous pouvez le retirer à tout moment de façon instantanée\n\n',
                                      style: AppStyles.textStyle(
                                        color: AppColors.black900,
                                        size: 10*ffem,
                                        weight: FontWeight.w400,
                                        height: 1.3*ffem/fem,
                                        // weight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              _formController.isRechargeBottomSheet.value
                                  ? SizedBox(height: 0*fem)
                                  : const SizedBox(),
                              _formController.isRechargeBottomSheet.value
                                  ? Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(3*fem),
                                          decoration: BoxDecoration(
                                              color: AppColors.cardColor3,
                                              borderRadius:
                                                  BorderRadius.circular(8*fem)),
                                          child: Icon(
                                            FontAwesomeIcons.info,
                                            color: AppColors.white,
                                            size: 13*fem,
                                          ),
                                        ),
                                        SizedBox(width: 8*fem),
                                        Expanded(
                                          child: Text(
                                            'Il peut arriver que votre opérateur vous facture des frais pour cette transaction.',
                                            style: AppStyles.textStyle(
                                              color: AppColors.black900,
                                              size: 10*ffem,
                                              weight: FontWeight.w400,
                                              height: 1.3*ffem/fem,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          // : const SizedBox(),
                          !_formController.isKeyboardVisible.value
                              ? SizedBox(height: 8*fem)
                              : const SizedBox(),
                          !_formController.isKeyboardVisible.value
                              ? GestureDetector(
                                  onTap: () {
                                    if (_formController
                                        .isRechargeBottomSheet.value) {
                                      _formController.fieldVerification(
                                        field:
                                            _transactionController.amount.value,
                                        isName: true,
                                        errorCallback: (String error) =>
                                            _formController
                                                .hasErrorOnRechargeAmount(
                                                    error),
                                      );
                                    } else {
                                      _formController.fieldVerification(
                                        field:
                                            _transactionController.amount.value,
                                        isAmount: true,
                                        errorCallback: (String error) =>
                                            _formController
                                                .hasErrorOnRechargeAmount(
                                                    error),
                                      );
                                    }
                                    _formController.fieldVerification(
                                      field: _transactionController.phone.value,
                                      isPhoneNumber: true,
                                      errorCallback: (String error) =>
                                          _formController
                                              .hasErrorOnRechargePhone(error),
                                    );
                                    if (!_formController
                                        .isRechargeBottomSheet.value) {
                                      _formController.fieldVerification(
                                        field: _transactionController
                                            .password.value,
                                        isSamePass: true,
                                        pass: localUser.password != null
                                            ? localUser.password!
                                            : "",
                                        errorCallback: (String error) =>
                                            _formController
                                                .hasErrorOnSamePassword(error),
                                      );
                                    }
                                    if ((_formController
                                                .hasErrorOnRechargeAmount
                                                .value
                                                .isEmpty &&
                                            _formController
                                                .hasErrorOnRechargePhone
                                                .isEmpty &&
                                            _formController
                                                .hasErrorOnSamePassword
                                                .isEmpty) ||
                                        _formController.hasErrorOnRechargeAmount
                                                .value.isEmpty &&
                                            _formController
                                                .hasErrorOnRechargePhone
                                                .isEmpty &&
                                            _formController
                                                .isRechargeBottomSheet.value) {
                                      _topNavBarController
                                          .loaderProvider("card transaction");
                                      Get.off(() => const LoaderScreen());
                                      _formController.isBottomSheetShow(false);
                                      _formController
                                          .isAccountTransactionBottomSheetShow(
                                              false);
                                      // Get.off(LoaderScreen());
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom:
                                            Constants.screenHeight(context) /
                                                35*fem),
                                    // left: 22.0,
                                    // right: 22.0),
                                    child: AppButtonWidget(
                                      label: _formController
                                              .isRechargeBottomSheet.value
                                          ? "Recharger"
                                          : "Retirer",
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox();
    });
  }
}
