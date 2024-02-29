import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/form_controller.dart';

class TopNavBarController extends GetxController {
  RxInt pageIndex = 0.obs;
  RxBool isKeyboardVisible = false.obs;
  RxBool isVisaCardChoosed = false.obs;
  RxBool isCardDetailsActivated = false.obs;
  RxBool isBalanceVisible = true.obs;
  RxBool isXAFBalanceVisible = true.obs;
  RxBool isUSDBalanceVisible = true.obs;

  RxString loaderProvider = "".obs;

  RxInt selectedHistoryFilter = 0.obs;

  ScrollController scrollController = ScrollController();
  final FormController _formController = Get.put(FormController());

  void setPageIndex(int index) {
    isCardDetailsActivated(false);
    _formController.resetBottomSheets();
    pageIndex(index);
    // scrollController.jumpTo(0);
    print(pageIndex);
  }

  @override
  void onInit() {
    pageIndex(0);
    isVisaCardChoosed(false);
    isCardDetailsActivated(false);
    loaderProvider("");
    super.onInit();
  }
}
