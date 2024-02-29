import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/main_screen/screens/loader_screen/loader_screen.dart';
import 'package:secure_app/widgets/app_button_widget.dart';
import 'package:secure_app/widgets/input_field_widget.dart';
import 'package:secure_app/widgets/input_label.dart';

class CardTransactionsBottomSheet extends StatelessWidget {
  CardTransactionsBottomSheet({super.key});
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());

  final FormController _formController = Get.put(FormController());

  final TransactionController _transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return _formController.isBottomSheetShow.value
          ? Align(
              alignment: Alignment.bottomCenter,
              child: IntrinsicHeight(
                child: Container(
                  padding:
                      const EdgeInsets.only(top: 32.0, left: 20.0, right: 20.0),
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _formController.isBottomSheetShow(false);
                            },
                            child: const Icon(
                              FontAwesomeIcons.close,
                            ),
                          ),
                        ],
                      ),
                      _formController.isRechargeBottomSheet.value
                          ? SizedBox(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Recharger en ',
                                      style: AppStyles.textStyle(
                                        color: AppColors.dark,
                                        size: 25,
                                        weight: FontWeight.w500,
                                        height: 0.9,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '02 minutes',
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
                            )
                          : SizedBox(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Retirer en ',
                                      style: AppStyles.textStyle(
                                        color: AppColors.primary,
                                        size: 25,
                                        weight: FontWeight.w500,
                                        height: 0.9,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'vers mon compte',
                                      style: AppStyles.textStyle(
                                        color: AppColors.dark,
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
                      const SizedBox(height: 8.0),
                      const InputLabel(
                          label: "Montant à envoyer", paddingTop: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: InputField(
                          labelText: "1000",
                          hasIcon: false,
                          isElevated: false,
                          hasShadow: false,
                          hasSuffix: true,
                          isNotRegularCaracter: true,
                          inputBg: AppColors.imputBg,
                          contentPadding: 16.0,
                          suffixIcon: IntrinsicHeight(
                            child: IntrinsicWidth(
                              child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Center(
                                    child: Text("FCFA",
                                        style: AppStyles.textStyle(
                                            color: AppColors.white,
                                            size: 16.0,
                                            weight: FontWeight.w700)),
                                    // child: RichText(
                                    //   text: TextSpan(
                                    //     text: "\$",
                                    //     style: const TextStyle(
                                    //       color: Colors.white,
                                    //       fontSize: 16,
                                    //       fontFamily: 'Poppins',
                                    //       fontWeight: FontWeight.w700,
                                    //       height: 0.09,
                                    //       letterSpacing: -0.64,
                                    //     ),
                                    //     children: [
                                    //       TextSpan(
                                    //           text: " USD",
                                    //           style: AppStyles.textStyle(
                                    //               color: AppColors.white,
                                    //               size: 16.0,
                                    //               weight: FontWeight.w700))
                                    //     ],
                                    //   ),
                                    // ),
                                  )),
                            ),
                          ),
                          icon: FontAwesomeIcons.a,
                          keyboardType: TextInputType.number,
                          iconColor: AppColors.dark,
                          value: "",
                          onChanged: (String value) {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          // mainAxisAlignment:
                          //     MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: _formController
                                            .isRechargeBottomSheet.value
                                        ? 'Frais de recharge: '
                                        : 'Frais de retrait: ',
                                    style: AppStyles.textStyle(
                                        color: AppColors.dark,
                                        size: 12.0,
                                        weight: FontWeight.w700),
                                  ),
                                  TextSpan(
                                      text: '0',
                                      style: AppStyles.textStyle(
                                        color: AppColors.primary,
                                        size: 12,
                                        weight: FontWeight.w700,
                                        // height: 0.17,
                                      )),
                                  TextSpan(
                                    text: '%',
                                    style: AppStyles.textPoppinsStyle(
                                        color: AppColors.primary,
                                        size: 12.0,
                                        weight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 22.0),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Montant à débiter :',
                                      style: AppStyles.textStyle(
                                          color: AppColors.dark,
                                          size: 12.0,
                                          weight: FontWeight.w700),
                                    ),
                                    TextSpan(
                                      text: ' 1',
                                      style: AppStyles.textPoppinsStyle(
                                        color: AppColors.primary,
                                        size: 12,
                                        weight: FontWeight.w700,
                                        height: 0.17,
                                      ),
                                    ),
                                    // TextSpan(
                                    //   text: '%',
                                    //   style: AppStyles.textPoppinsStyle(
                                    //     color: AppColors.primary,
                                    //     size: 12.0,
                                    //     weight: FontWeight.w700,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 28.0),
                      const InputLabel(
                        label: "Mot de passe",
                        paddingTop: 15.0,
                      ),
                      Obx(() {
                        return InputField(
                          labelText: "",
                          hasIcon: false,
                          isElevated: false,
                          hasShadow: false,
                          hasSuffix: true,
                          isNotRegularCaracter: true,
                          obscureText: _formController.isObscurePass.value,
                          hasMaxLine: true,
                          maxLine: 1,
                          contentPadding: 14.0,
                          suffixIcon: GestureDetector(
                              onTap: () {
                                _formController.isObscurePass.value =
                                    !_formController.isObscurePass.value;
                              },
                              child: _formController.isObscurePass.value
                                  ? const Icon(
                                      FontAwesomeIcons.eye,
                                      size: 18.0,
                                    )
                                  : const Icon(
                                      FontAwesomeIcons.eyeSlash,
                                      size: 18.0,
                                    )),
                          icon: FontAwesomeIcons.a,
                          keyboardType: TextInputType.visiblePassword,
                          iconColor: AppColors.dark,
                          value: "",
                          onChanged: (String value) {},
                        );
                      }),
                      const SizedBox(height: 38.0),
                      !_formController.isKeyboardVisible.value
                          ? GestureDetector(
                              onTap: () {
                                _topNavBarController
                                    .loaderProvider("card transaction");
                                Get.off(() => const LoaderScreen());
                                // Get.off(LoaderScreen());
                                _formController.isBottomSheetShow(false);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom:
                                        Constants.screenHeight(context) / 25),
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
            )
          : const SizedBox();
    });
  }
}
