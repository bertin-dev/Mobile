import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:secure_app/controllers/add_card_controller.dart';
import 'package:secure_app/controllers/card_controller.dart';
import 'package:secure_app/controllers/info_controller.dart';
import 'package:secure_app/controllers/notification_controller.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/models/user_model.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/constants.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  final TransactionController _transactionController =
      Get.put(TransactionController());
  final CardController _cardController = Get.put(CardController());
  final NotificationController _notificationController =
      Get.put(NotificationController());
  final AddCardController _addCardController = Get.put(AddCardController());
  final InfoController _infoController = Get.put(InfoController());
  Rx<UserModel> user = UserModel().obs;
  RxString name = "".obs;
  RxString email = "".obs;
  RxString phone = "".obs;
  RxString photo = "".obs;
  RxString role = "".obs;
  RxString country = "".obs;
  RxString city = "".obs;
  RxString adress = "".obs;
  RxString birthday = "".obs;
  RxString sexe = "".obs;
  RxString profession = "".obs;
  RxString meanIncomes = "".obs;
  RxString idType = "".obs;
  RxString idNumber = "".obs;
  RxString oldPassword = "".obs;
  RxString password = "".obs;
  RxString cPassword = "".obs;
  RxBool active = false.obs;
  RxString id = "".obs;
  RxString err = "".obs;
  Rx<XFile>? cniRecto;
  Rx<XFile>? cniVerso;
  Rx<XFile>? personImage;
  Rx<XFile>? profilePicture;
  RxString cniRectoPath = "".obs;
  RxString cniVersoPath = "".obs;
  RxString personImagePath = "".obs;
  RxBool isProfileImageExist = false.obs;

  RxString otpCode = "".obs;

  final RxBool isUSerLogedIn = false.obs;

  void isUserLog() async {
    isUSerLogedIn(await _userRepository.isUserLogin());
    print(isUSerLogedIn.value);
    if (isUSerLogedIn.value) {
      _userRepository.getUserInfosFromCache().then((value) async {
        await _cardController.getCards(localUser);
        await _infoController.getInfos();
        return true;
      });
    }
  }

  @override
  void onInit() {
    isUserLog();
    resetLoginData();
    resetIdentityData();
    super.onInit();
  }

  Future<void> loginUser(UserModel userModel) async {
    err('');
    try {
      final Map<String, dynamic> response =
          await _userRepository.loginUser(userModel);
      // final UserModel newUser = await _userRepository.registerUser(userModel);
      if (response["user"] != null) {
        user(response["user"]);
        print(user.value.name);
        // if (user.value.name == null) {
        //   err("Une erreur est survenue, veuillez reessayer!");
        // }
      } else {
        err(response["message"]);
      }
    } catch (error) {
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  Future<void> registerUser(UserModel userModel) async {
    err('');
    try {
      final Map<String, dynamic> response =
          await _userRepository.registerUser(userModel);
      // final UserModel newUser = await _userRepository.registerUser(userModel);
      if (response["user"] != null) {
        user(response["user"]);
        print(user.value.name);
        // if (user.value.name == null) {
        //   err("Une erreur est survenue, veuillez reessayer!");
        // }
      } else {
        err(response["message"]);
      }
    } catch (error) {
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  Future<void> forgetPassword(UserModel userModel) async {
    err('');
    try {
      final bool response = await _userRepository.forgetPassword(userModel);
      // user(newUser);
      print(response);
      if (!response) {
        err("Numero de telephone incorrect");
      }
    } catch (error) {
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  Future<void> createAndSendOtp(UserModel userModel, bool isPhone) async {
    err('');
    try {
      final bool response = await _userRepository.createAndSendOtp(userModel);
      // user(newUser);
      print(response);
      if (!response) {
        isPhone ? err("Numero de telephone incorrect") : err("Email incorrect");
      }
    } catch (error) {
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  Future<void> verifyOtp(Map<String, String> model) async {
    err('');
    try {
      final bool response =
          await _userRepository.verifyOtp(model, otpCode.value, "", false);
      // user(newUser);
      print(response);
      if (!response) {
        err("Code OTP incorrect");
      }
    } catch (error) {
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  Future<void> verifyEmail(Map<String, String> model) async {
    err('');
    try {
      final bool response = await _userRepository.verifyOtp(
          model, otpCode.value, "isEmailVerified", true);
      // user(newUser);
      print(response);
      if (!response) {
        err("Code OTP incorrect");
      }
    } catch (error) {
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  Future<void> verifyPhone(Map<String, String> model) async {
    err('');
    try {
      final bool response = await _userRepository.verifyOtp(
          model, otpCode.value, "isNumberVerified", true);
      // user(newUser);
      print(response);
      if (!response) {
        err("Code OTP incorrect");
      }
    } catch (error) {
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  Future<void> verifyProfile() async {
    err('');
    try {
      final bool response = await _userRepository.verifyProfile();
      // user(newUser);
      print(response);
      if (!response) {
        err("Echec de la verification reesayer");
      }
    } catch (error) {
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  Future<void> resetPassword(UserModel userModel) async {
    err('');
    try {
      final UserModel newUser = await _userRepository.resetPassword(
          userModel, "${Constants.resetPasswordUri}/${otpCode.value}");
      user(newUser);
      print(user.value.name);
      if (user.value.name == null) {
        err("Telephone ou mot de passe incorrect");
      }
    } catch (error) {
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  Future<void> updatePassword(Map<String, String> userModel) async {
    err('');
    try {
      final Map<String, dynamic> response =
          await _userRepository.updateCurrentUserPassword(userModel);
      if (response["user"] != null) {
        user(response["user"]);
        print(user.value.name);
        // if (user.value.name == null) {
        //   err("Une erreur est survenue, veuillez reessayer!");
        // }
      } else {
        err(response["message"]);
      }
    } catch (error) {
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  Future<void> updateCurrentUser(UserModel userModel) async {
    err('');
    try {
      final UserModel currentUser =
          await _userRepository.updateCurrentUser(userModel);
      user(currentUser);
      print(user.value.name);
      if (user.value.country == null) {
        err("Une erreur est survenue, veuillez reessayer!");
      }
    } catch (error) {
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  Future<void> updateProfilePicture(String imagePath) async {
    err('');
    try {
      final UserModel currentUser =
          await _userRepository.updateProfilePicture(imagePath);
      user(currentUser);
      print(user.value.name);
      if (user.value.country == null) {
        err("Une erreur est survenue, veuillez reessayer!");
      }
      if (user.value.photo != null && user.value.photo!.isNotEmpty) {
        isProfileExist(user.value.photo!);
      }
    } catch (error) {
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  Future<void> uploadPapersPicture(List<String> imagesPath) async {
    err('');
    try {
      final UserModel currentUser =
          await _userRepository.uploadPapersPicture(imagesPath);
      user(currentUser);
      print(user.value.name);
      if (user.value.country == null) {
        err("Une erreur est survenue, veuillez reessayer!");
      }
      if (user.value.photo != null && user.value.photo!.isNotEmpty) {
        isProfileExist(user.value.photo!);
      }
    } catch (error) {
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  Future<void> isProfileExist(String imageUrl) async {
    err('');
    try {
      if (imageUrl.isNotEmpty) {
        isProfileImageExist(
            await _userRepository.isProfileImageExist(imageUrl));
      } else {
        isProfileImageExist(false);
      }
    } catch (error) {
      isProfileImageExist(false);
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  void logoutUser() async {
    await _userRepository.logout();
    _transactionController.clearData();
    _transactionController.transactions!([]);
    _cardController.cards!([]);
    _transactionController.assignTransactions([]);
    _notificationController.notifications!([]);
    _addCardController.onInit();
  }

  Future<void> deleteUser() async {
    err('');
    try {
      final bool isUserDeleted = await _userRepository.deleteUser();
      if (!isUserDeleted) {
        err("Une erreur est survenue, veuillez reessayer!");
      }
    } catch (error) {
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  void resetLoginData() {
    name = "".obs;
    email = "".obs;
    phone = "".obs;
    photo = "".obs;
    role = "".obs;
    country = "".obs;
    city = "".obs;
    adress = "".obs;
    birthday = "".obs;
    sexe = "".obs;
    profession = "".obs;
    meanIncomes = "".obs;
    idType = "".obs;
    idNumber = "".obs;
    password = "".obs;
    cPassword = "".obs;
    active = false.obs;
    id = "".obs;
    otpCode = "".obs;
  }

  void resetIdentityData() {
    cniRecto = null;
    cniVerso = null;
    cniRectoPath = "".obs;
    cniVersoPath = "".obs;
    personImagePath = "".obs;
  }
}
