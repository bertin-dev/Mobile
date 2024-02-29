import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/main_screen/main_screen.dart';
import 'package:secure_app/screens/main_screen/screens/loader_screen/loader_screen.dart';
import 'package:secure_app/widgets/input_field_widget.dart';
import 'package:secure_app/widgets/input_label.dart';
import 'package:secure_app/widgets/primary_button.dart';

class RechargeAccountScreen extends StatelessWidget {
  RechargeAccountScreen({super.key});
  final FormController _formController = Get.put(FormController());
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());
  final TransactionController _transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        controller: _topNavBarController.scrollController,
        child: Obx(() {
          return SizedBox(
            height: Constants.screenHeight(context),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 22.0, right: 22.0, top: 38.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: GestureDetector(
                      onTap: () {
                        _formController.isObscurePass(true);
                        _formController.isObscureCPass(true);
                        Get.back();
                      },
                      child: const Icon(
                        FontAwesomeIcons.arrowLeft,
                        // color: AppColors.white,
                        // size: 25.0,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Recharge ton compte et cr',
                                style: AppStyles.textStyle(
                                  color: const Color(0xFF0F0F0F),
                                  size: 35,
                                  weight: FontWeight.w500,
                                  height: 0.9,
                                  // letterSpacing: -0.20,
                                ),
                              ),
                              TextSpan(
                                text: 'é',
                                style: AppStyles.textStyle(
                                  color: const Color(0xFF0F0F0F),
                                  size: 35,
                                  weight: FontWeight.w500,
                                  height: 0.9,
                                  // letterSpacing: -0.20,
                                ),
                              ),
                              TextSpan(
                                text: 'e',
                                style: AppStyles.textStyle(
                                  color: const Color(0xFF0F0F0F),
                                  size: 35,
                                  weight: FontWeight.w500,
                                  height: 0.9,
                                  // letterSpacing: -0.20,
                                ),
                              ),
                              TextSpan(
                                text: ' ta premiere carte',
                                style: AppStyles.textStyle(
                                  color: AppColors.primary,
                                  size: 35,
                                  weight: FontWeight.w500,
                                  height: 0.9,
                                  // letterSpacing: -0.20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const InputLabel(
                          label: "Montant à envoyer", paddingTop: 53.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: InputField(
                          labelText: "5",
                          hasIcon: false,
                          isElevated: false,
                          hasShadow: false,
                          hasSuffix: true,
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
                          // suffixIcon: IntrinsicHeight(
                          //   child: IntrinsicWidth(
                          //     child: Container(
                          //         margin:
                          //             const EdgeInsets.symmetric(vertical: 8.0),
                          //         padding: const EdgeInsets.only(
                          //             left: 5.0, right: 5.0),
                          //         decoration: BoxDecoration(
                          //             color: AppColors.primary,
                          //             borderRadius: BorderRadius.circular(5.0)),
                          //         child: Center(
                          //           child: RichText(
                          //             text: TextSpan(
                          //               text: "\$",
                          //               style: const TextStyle(
                          //                 color: Colors.white,
                          //                 fontSize: 16,
                          //                 fontFamily: 'Poppins',
                          //                 fontWeight: FontWeight.w700,
                          //                 height: 0.09,
                          //                 letterSpacing: -0.64,
                          //               ),
                          //               children: [
                          //                 TextSpan(
                          //                     text: " USD",
                          //                     style: AppStyles.textStyle(
                          //                         color: AppColors.white,
                          //                         size: 16.0,
                          //                         weight: FontWeight.w700))
                          //               ],
                          //             ),
                          //           ),
                          //         )),
                          //   ),
                          // ),
                          icon: FontAwesomeIcons.a,
                          keyboardType: TextInputType.phone,
                          iconColor: AppColors.dark,
                          value: _transactionController.amount.value,
                          onChanged: (String value) {
                            _transactionController.amount(value);
                            int amountinXAF = 0;
                            double transactionFees = 0;
                            if (_transactionController.amount.isNotEmpty) {
                              amountinXAF = (double.parse(
                                          _transactionController.amount.value)
                                      .toInt() *
                                  667);
                              transactionFees = (amountinXAF *
                                      (_formController
                                              .isRechargeBottomSheet.value
                                          ? 2
                                          : 3)) /
                                  100;
                            }
                            _transactionController.amountToPay(
                                (_transactionController.formatAmount(
                                        amountinXAF + transactionFees))
                                    .toString());

                            _formController.fieldVerification(
                              field: value,
                              isName: true,
                              errorCallback: (String error) => _formController
                                  .hasErrorOnRechargeAmount(error),
                            );
                          },
                        ),
                      ),
                      _formController.hasErrorOnRechargeAmount.value.isNotEmpty
                          ? InputLabel(
                              label: _formController
                                  .hasErrorOnRechargeAmount.value,
                              paddingTop: 8.0,
                              color: AppColors.red,
                            )
                          : const SizedBox(),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Taux du dollars:  ',
                                    style: AppStyles.textStyle(
                                        color: AppColors.dark,
                                        size: 12.0,
                                        weight: FontWeight.w700),
                                  ),
                                  TextSpan(
                                    text: '1',
                                    style: AppStyles.textStyle(
                                        color: AppColors.primary,
                                        size: 12.0,
                                        weight: FontWeight.w700),
                                  ),
                                  TextSpan(
                                    text: '\$ = 667 Fcfa',
                                    style: AppStyles.textPoppinsStyle(
                                      color: const Color(0xFF18BC7A),
                                      size: 12,
                                      weight: FontWeight.w700,
                                      // height: 0.17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 7.0),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Frais de recharge :',
                                    style: AppStyles.textStyle(
                                        color: AppColors.dark,
                                        size: 12.0,
                                        weight: FontWeight.w700),
                                  ),
                                  TextSpan(
                                    text: ' 2',
                                    style: AppStyles.textStyle(
                                        color: AppColors.primary,
                                        size: 12.0,
                                        weight: FontWeight.w700),
                                  ),
                                  TextSpan(
                                    text: '%',
                                    style: AppStyles.textPoppinsStyle(
                                      color: const Color(0xFF18BC7A),
                                      size: 12,
                                      weight: FontWeight.w700,
                                      // height: 0.17,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Vous allez payer :',
                              style: AppStyles.textStyle(
                                color: Colors.black,
                                size: 12,
                                weight: FontWeight.w700,
                                // height: 0.17,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' ${_transactionController.amountToPay} Fcfa',
                              style: AppStyles.textPoppinsStyle(
                                color: AppColors.primary,
                                size: 11,
                                weight: FontWeight.w700,
                                // height: 0.17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const InputLabel(
                        label: "Numéro mobile money ( Orange/Mtn )",
                        paddingTop: 39.0,
                        hasSpecialCaraters: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: InputField(
                          labelText: "65******2",
                          hasIcon: false,
                          isElevated: false,
                          hasShadow: false,
                          hasSuffix: true,
                          isPhoneNumber: true,
                          maxLine: 1,
                          hasMaxLine: true,
                          inputBg: AppColors.imputBg,
                          // contentPadding: 16.0,
                          suffixIcon: IntrinsicWidth(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(Assets.icons.cmrFlag.path),
                                // const SizedBox(width: 6.0),
                                // Image.asset(Assets.icons.orange.path),
                              ],
                            ),
                          ),
                          icon: FontAwesomeIcons.a,
                          keyboardType: TextInputType.number,
                          iconColor: AppColors.dark,
                          value: _transactionController.phone.value,
                          onChanged: (String value) {
                            _transactionController.phone(value);
                            _formController.fieldVerification(
                              field: value,
                              isPhoneNumber: true,
                              errorCallback: (String error) => _formController
                                  .hasErrorOnRechargePhone(error),
                            );
                          },
                        ),
                      ),
                      _formController.hasErrorOnRechargePhone.value.isNotEmpty
                          ? InputLabel(
                              label:
                                  _formController.hasErrorOnRechargePhone.value,
                              paddingTop: 8.0,
                              color: AppColors.red,
                            )
                          : const SizedBox(),
                      Obx(() {
                        return _formController.phoneNumber.value.length > 8
                            ? Container(
                                margin: const EdgeInsets.only(top: 15.0),
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 5.0,
                                      color: AppColors.primary,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            child: SizedBox(
                                              height: 45.0,
                                              width: 45.0,
                                              child: Image.asset(
                                                Assets.images.personsPng.path,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Compte correspondant:",
                                                  style: AppStyles.textStyle(
                                                      color: AppColors.dark,
                                                      size: 11.0),
                                                ),
                                                Text(
                                                  "Minkeng Salomon Jovial",
                                                  style: AppStyles.textStyle(
                                                    color: AppColors.dark,
                                                    size: 12.0,
                                                    weight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox();
                      }),
                      Padding(
                        padding: const EdgeInsets.only(top: 44.0, bottom: 18.0),
                        child: GestureDetector(
                          onTap: () {
                            _formController.fieldVerification(
                              field: _transactionController.amount.value,
                              isName: true,
                              errorCallback: (String error) => _formController
                                  .hasErrorOnRechargeAmount(error),
                            );
                            _formController.fieldVerification(
                              field: _transactionController.phone.value,
                              isPhoneNumber: true,
                              errorCallback: (String error) => _formController
                                  .hasErrorOnRechargePhone(error),
                            );

                            if (_formController
                                    .hasErrorOnRechargeAmount.value.isEmpty &&
                                _formController
                                    .hasErrorOnRechargePhone.isEmpty) {
                              _topNavBarController
                                  .loaderProvider("card transaction");
                              Get.off(() => const LoaderScreen());
                              _formController.isBottomSheetShow(false);
                              _formController
                                  .isAccountTransactionBottomSheetShow(false);
                              // Get.off(LoaderScreen());
                            }
                            _topNavBarController
                                .loaderProvider("card transaction");
                            _formController.isRechargeBottomSheet(true);
                            // _formController.isAccountRecharge(true);
                            Get.off(() => const LoaderScreen());
                          },
                          child: const PrimaryButton(
                            textButton: "Recharger",
                            buttonColor: AppColors.dark,
                            hasIcon: false,
                            // circleIconColor: AppColors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 45.0),
                        child: GestureDetector(
                          onTap: () {
                            _formController.isAccountRecharge(true);
                            Get.off(const MainScreen());
                          },
                          child: const PrimaryButton(
                            textButton: "Passer",
                            buttonColor: AppColors.primary,
                            hasIcon: false,
                            // circleIconColor: AppColors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
