import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/main_screen/screens/loader_screen/loader_screen.dart';
import 'package:secure_app/widgets/app_button_widget.dart';

class CreateTransfertButton extends StatelessWidget {
  CreateTransfertButton({super.key});
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());

  final FormController _formController = Get.put(FormController());

  final TransactionController _transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return _topNavBarController.pageIndex.value == 2 &&
              !_topNavBarController.isKeyboardVisible.value
          ? Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: Constants.screenHeight(context) / 10,
                    // bottom: Constants.screenHeight(context) / 25,
                    left: 22.0,
                    right: 22.0),
                child: GestureDetector(
                  onTap: () async {
                    _formController.fieldVerification(
                      field: _transactionController.amount.value,
                      isAmountBalance: true,
                      errorCallback: (String error) =>
                          _formController.hasErrorOnRechargeAmount(error),
                    );
                    _formController.fieldVerification(
                      field: _transactionController.phone.value,
                      isSameUser: true,
                      errorCallback: (String error) =>
                          _formController.hasErrorOnRechargePhone(error),
                    );
                    _formController.fieldVerification(
                      field: _transactionController.message.value,
                      isMessage: true,
                      errorCallback: (String error) =>
                          _formController.hasErrorOnMessage(error),
                    );
                    if (_formController
                            .hasErrorOnRechargeAmount.value.isEmpty &&
                        _formController.hasErrorOnRechargePhone.isEmpty) {
                      if (_transactionController.receiver != null &&
                          _transactionController.receiver!.value.name != null &&
                          _transactionController
                              .receiver!.value.name!.isNotEmpty) {
                        _topNavBarController.loaderProvider("transfert");
                        Get.off(() => const LoaderScreen());
                        _formController.isBottomSheetShow(false);
                        _formController
                            .isAccountTransactionBottomSheetShow(false);
                        // Get.off(LoaderScreen());
                      } else {
                        Constants.snackBar(
                            bgColor: AppColors.red,
                            textColor: AppColors.white,
                            description: "Aucun utilisateur trouvé");
                      }
                    }
                  },
                  child: const AppButtonWidget(
                    label: "Envoyer maintenant",
                  ),
                ),
              ),
            )
          : const SizedBox();
    });
  }
}
