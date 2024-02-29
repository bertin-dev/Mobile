import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/widgets/app_button_widget.dart';
import 'package:secure_app/widgets/input_field_widget.dart';
import 'package:secure_app/widgets/input_label.dart';

class CardDetailsRequestPasswordBottomSheet extends StatelessWidget {
  CardDetailsRequestPasswordBottomSheet({super.key});
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());

  final FormController _formController = Get.put(FormController());

  final TransactionController _transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return _formController.isCardDetailsRequestPasswordBottomSheetShow.value
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
                                _formController
                                    .isCardDetailsRequestPasswordBottomSheetShow(
                                        false);
                              },
                              child: const Icon(FontAwesomeIcons.close)),
                        ],
                      ),
                      SizedBox(
                        width: 332,
                        child: Text(
                          'Afficher les details',
                          style: AppStyles.textStyle(
                            color: const Color(0xFF0F0F0F),
                            size: 25,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const InputLabel(
                        label: "Mot de passe",
                        paddingTop: 17.0,
                      ),
                      InputField(
                        labelText: "••••••••••••",
                        hasIcon: false,
                        isElevated: false,
                        hasShadow: false,
                        hasSuffix: true,
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
                        onChanged: (String value) {
                          _transactionController.password(value);
                          _formController.fieldVerification(
                            field: _transactionController.password.value,
                            isSamePass: true,
                            pass: localUser.password != null
                                ? localUser.password!
                                : "",
                            errorCallback: (String error) =>
                                _formController.hasErrorOnSamePassword(
                              error,
                            ),
                          );
                        },
                      ),
                      _formController.hasErrorOnSamePassword.value.isNotEmpty
                          ? InputLabel(
                              label:
                                  _formController.hasErrorOnSamePassword.value,
                              paddingTop: 8.0,
                              color: AppColors.red,
                            )
                          : const SizedBox(),
                      const SizedBox(height: 38.0),
                      !_formController.isKeyboardVisible.value
                          ? GestureDetector(
                              onTap: () {
                                // _topNavBarController
                                //     .loaderProvider("open details");
                                // Get.off(() => LoaderScreen());
                                // Get.off(LoaderScreen());

                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                _formController.fieldVerification(
                                  field: _transactionController.password.value,
                                  isSamePass: true,
                                  pass: localUser.password != null
                                      ? localUser.password!
                                      : "",
                                  errorCallback: (String error) =>
                                      _formController
                                          .hasErrorOnSamePassword(error),
                                );

                                if (_formController
                                    .hasErrorOnSamePassword.value.isEmpty) {
                                  _formController
                                      .isCardDetailsRequestPasswordBottomSheetShow(
                                          false);
                                  // _topNavBarController.pageIndex.value = 7;
                                  _formController
                                      .isCardDetailsBottomSheetShow(true);
                                  _topNavBarController
                                      .isCardDetailsActivated(true);
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom:
                                        Constants.screenHeight(context) / 25),
                                // left: 22.0,
                                // right: 22.0),
                                child: const AppButtonWidget(
                                  label: "Continuer",
                                ),
                              ),
                            )
                          : const SizedBox(),
                      // SizedBox(height: Constants.screenHeight(context) / 14)
                    ],
                  ),
                ),
              ),
            )
          : const SizedBox();
    });
  }
}
