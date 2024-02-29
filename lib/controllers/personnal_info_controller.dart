import 'package:get/get.dart';

class PersonnalInfoController extends GetxController {
  RxInt pageIndex = 0.obs;
  RxBool isKeyboardVisible = false.obs;

  void setPageIndex(int index) {
    pageIndex(index);
    print(pageIndex);
  }

  @override
  void onInit() {
    pageIndex(0);
    isKeyboardVisible(false);
    super.onInit();
  }
}
