import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:secure_app/repositories/user_repository.dart';

class FormController extends GetxController {
  RxBool isKeyboardVisible = false.obs;
  RxBool isObscureOldPass = true.obs;
  RxBool isObscurePass = true.obs;
  RxBool isObscureCPass = true.obs;

  RxBool isPairainCodeVisible = false.obs;

  RxBool isConditionsChecked = false.obs;
  RxBool isMessageReceptionCheck = false.obs;

  RxString phoneNumber = "".obs;

  RxBool isBottomSheetShow = false.obs;
  RxBool isRechargeBottomSheet = false.obs;

  RxBool isPageDark = false.obs;
  RxInt otpScreenPageIndex = 0.obs;
  // RxBool isObscurePass = true.obs;
  // RxBool isObscureCPass = true.obs;

  RxBool isPhoneVerification = true.obs;
  RxBool isPhoneOtpVerification = false.obs;
  RxBool isOtpVerification = false.obs;
  RxBool isPhoneVerified = false.obs;
  RxBool isMailverified = false.obs;
  RxBool isPersonalInfosverified = false.obs;
  RxBool isIdentified = false.obs;
  RxBool isAccountVerified = false.obs;
  RxBool isAccountRecharge = false.obs;

  RxString birthDayDate = "".obs;

  RxBool isAccountTransactionBottomSheetShow = false.obs;

  RxBool isCardDetailsRequestPasswordBottomSheetShow = false.obs;
  RxBool isCardDetailsBottomSheetShow = false.obs;
  RxBool showTitleOnVerificationScreens = false.obs;

  RxBool showTransactionDetailsBottomSheet = false.obs;

  RxString hasErrorOnName = "".obs;
  RxString hasErrorOnPhone = "".obs;
  RxString hasErrorOnMail = "".obs;
  RxString hasErrorOnOldPassword = "".obs;
  RxString hasErrorOnPassword = "".obs;
  RxString hasErrorOnCPassword = "".obs;
  RxString hasErrorOnCountry = "".obs;
  RxString hasErrorOnCity = "".obs;
  RxString hasErrorOnAdress = "".obs;
  RxString hasErrorOnBirthday = "".obs;
  RxString hasErrorOnSexe = "".obs;
  RxString hasErrorOnProfession = "".obs;
  RxString hasErrorOnMeanIncomes = "".obs;
  RxString hasErrorOnIDType = "".obs;
  RxString hasErrorOnIDNumber = "".obs;
  RxString hasErrorOnRechargeAmount = "".obs;
  RxString hasErrorOnRechargePhone = "".obs;
  RxString hasErrorOnSamePassword = "".obs;
  RxString hasErrorOnMessage = "".obs;

  RxBool isAskNewCodeVisible = false.obs;

  RxInt resetPasswordTimerDuration = 300.obs;

  RxInt identitificationPageIndex = 0.obs;

  RxBool isToSekureAccountTransfer = true.obs;
  RxBool isToMomoAccountTransfer = false.obs;
  void updateToSekureTransfer(bool value) {
    isToSekureAccountTransfer.value = value;
    isToMomoAccountTransfer.value = !value;
  }

  void updateToMomoTransfer(bool value) {
    isToMomoAccountTransfer.value = value;
    isToSekureAccountTransfer.value = !value;
  }

  RxBool isCardRechargeMessageVisible = true.obs;


  void resetBottomSheets() {
    isAccountTransactionBottomSheetShow = false.obs;
    isCardDetailsRequestPasswordBottomSheetShow = false.obs;
    isCardDetailsBottomSheetShow = false.obs;
    showTitleOnVerificationScreens = false.obs;

    showTransactionDetailsBottomSheet = false.obs;
  }

  @override
  void onInit() {
    isKeyboardVisible(false);
    isObscurePass(true);
    isObscureCPass(true);
    isRechargeBottomSheet(false);
    isBottomSheetShow(false);
    isPageDark(false);
    isPhoneVerification(true);
    isPhoneOtpVerification(false);
    isOtpVerification(false);
    otpScreenPageIndex(0);
    isAccountVerified(false);
    showTitleOnVerificationScreens(false);
    birthDayDate("");
    isAskNewCodeVisible = false.obs;
    resetFormErrors();
    super.onInit();
  }

  @override
  void onClose() {
    birthDayDate("");
    super.onClose();
  }

  void restartTimer() {
    resetPasswordTimerDuration(300);
  }

  void fieldVerification({
    required String field,
    bool isName = false,
    bool isEmail = false,
    bool isPhoneNumber = false,
    bool isCpass = false,
    bool isPass = false,
    bool isSamePass = false,
    bool isAmount = false,
    bool isAmountBalance = false,
    bool isMessage = false,
    bool isSameUser = false,
    String pass = "",
    String amountInXaf = "",
    String banlaceInXaf = "",
    required Function(String) errorCallback,
  }) {
    if (!isMessage && field.isEmpty) {
      errorCallback("Le champ ne peut etre vide");
    } else {
      if (isName) {
        if (field.isNotEmpty) {
          errorCallback("");
        }
      }

      if (isEmail) {
        if (validateEmail(field)) {
          errorCallback("");
        } else {
          errorCallback("Format de l'email invalide");
        }
      }

      if (isPhoneNumber) {
        if (field.length < 9) {
          errorCallback("Le numero de telephone doit contenir 9 caracteres");
        } else {
          errorCallback("");
        }
      }
      if (isPass) {
        if (!validatePassword(field)) {
          errorCallback(
              "Le mot de passe doit contenir au moins 8 caracteres, 1 chiffres et au moins 1 caractere special");
        } else {
          errorCallback("");
        }
      }
      if (isCpass) {
        if (field.toLowerCase() != pass.toLowerCase()) {
          errorCallback(
              "Les champs mot de passe et confirmer mot de passe ne correspondent pas");
        } else {
          errorCallback("");
        }
      }
      if (isSamePass) {
        if (field != pass) {
          errorCallback(
              "Le mot de passe du compte et celui que vous avez entre ne sont pas les memes");
        } else {
          errorCallback("");
        }
      }
      if (isMessage) {
        if (field.length == 20) {
          errorCallback("Vous avez atteint le nombre maximum de caracteres");
        } else {
          errorCallback("");
        }
      }
      if (isAmount) {
        if (int.tryParse(field) == null) {
          errorCallback("Format du montant invalide");
        } else if (localUser.currentBalance != null &&
            calculateAmountToPay(double.parse(localUser.currentBalance!)) <
                calculateAmountToPay(double.parse(field))) {
          errorCallback("Votre solde insuffisant");
        } else if (int.tryParse(field)! > 500000) {
          errorCallback(
              "Le montant maximum de recharge est de 500.000 XAF , si vous souhaitez recharger plus de 500.000 XAF procéder en deux fois. Merci ");
        } else if (int.tryParse(field)! < 1000) {
          errorCallback("Le montant minimum est de 1000 XAF. Merci ");
        } else {
          errorCallback("");
        }
      }
      if (isAmountBalance) {
        if (localUser.currentBalance != null &&
            double.parse(localUser.currentBalance!) < double.parse(field)) {
          errorCallback("Votre solde insuffisant");
        } else {
          errorCallback("");
        }
      }
      if (isSameUser) {
        if (field.length < 9) {
          errorCallback("Le numero de telephone doit contenir 9 caracteres");
        } else if (localUser.phone != null && localUser.phone! == field) {
          errorCallback("Vous ne pouvez pas vous envoyer de l'argent");
        } else {
          errorCallback("");
        }
      }
    }
  }

  double calculateAmountToPay(double amount) {
    double exchangeRate = 600;
    double transactionFeeRate = 3;

    double amountInXAF = amount.toInt() * exchangeRate;
    double transactionFees = (amountInXAF * transactionFeeRate) / 100;

    double totalAmountToPay = amountInXAF + transactionFees;

    return totalAmountToPay;
  }

  bool validateEmail(String email) {
    final regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  bool validatePassword(String password) {
    final regex = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,}$');
    return regex.hasMatch(password);
  }

  Future<Rx<XFile>?> getOneImage({required bool isCamera}) async {
    Rx<XFile> image = XFile("").obs;
    final Rx<ImagePicker> picker = ImagePicker().obs;
    try {
      PermissionStatus status = await Permission.camera.request();
      if (status.isGranted) {
        if (isCamera) {
          image(await picker.value.pickImage(source: ImageSource.camera));
        } else {
          XFile? img =
              await picker.value.pickImage(source: ImageSource.gallery);
          image(img);
        }
      }
      return image;
    } catch (e, s) {
      if (kDebugMode) {
        print('Error : + $e + $s');
      }

      print("error");
      return image;
    }
  }

  void resetFormErrors() {
    hasErrorOnName = "".obs;
    hasErrorOnPhone = "".obs;
    hasErrorOnMail = "".obs;
    hasErrorOnPassword = "".obs;
    hasErrorOnCPassword = "".obs;
    hasErrorOnCountry = "".obs;
    hasErrorOnCity = "".obs;
    hasErrorOnAdress = "".obs;
    hasErrorOnBirthday = "".obs;
    hasErrorOnSexe = "".obs;
    hasErrorOnProfession = "".obs;
    hasErrorOnMeanIncomes = "".obs;
    hasErrorOnIDType = "".obs;
    hasErrorOnIDNumber = "".obs;
    hasErrorOnRechargeAmount = "".obs;
    hasErrorOnRechargePhone = "".obs;
    hasErrorOnSamePassword = "".obs;
  }
}
