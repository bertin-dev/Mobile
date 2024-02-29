import 'package:get/get.dart';

class AddCardController extends GetxController {
  RxInt selectedColor = 1.obs;

  @override
  void onInit() {
    selectedColor(1);
    super.onInit();
  }
}
