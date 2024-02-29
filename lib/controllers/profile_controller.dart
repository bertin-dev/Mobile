import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool isDarkModeActivated = false.obs;
  RxBool isFingerPrintVerificationActivated = true.obs;
  RxString selectedLanguage = "Français".obs;

  RxBool isLogOutBottomSheetShow = false.obs;
  RxBool isLanguageBottomSheetShow = false.obs;
  RxBool isDeleteAccountBottomSheetShow = false.obs;

  RxInt selectedQuestion = (-1).obs;


  RxString updateUserInfoProvider = "".obs;
  @override
  void onInit() {
    isDarkModeActivated(false);
    isFingerPrintVerificationActivated(true);
    isLogOutBottomSheetShow(false);
    super.onInit();
  }
}
