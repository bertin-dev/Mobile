import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleap_sdk/gleap_sdk.dart';
import 'package:gleap_sdk/models/gleap_user_property_model/gleap_user_property_model.dart';
import 'package:intl/intl.dart';
import 'package:secure_app/models/api_response.dart';
import 'package:secure_app/models/user_model.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/login_screen/login_screen.dart';
import 'package:secure_app/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final APIService _apiService = APIService();

  Future<Map<String, dynamic>> registerUser(UserModel model) async {
    APIResponse response = await _apiService.getDataOnPost(
      data: model.toJson(),
      method: "POST",
      uri: Constants.registerUri,
      token: localUser.token ?? "",
    );
    print(response.data);
    if (!response.error && response.data != null) {
      UserModel currentUser = UserModel.fromJson(response.data["user"]);
      if (currentUser.name != null) {
        currentUser.token = response.token;
        currentUser.password = model.password;
        if (currentUser.birthday != null && currentUser.birthday!.isNotEmpty) {
          currentUser.birthday = formatDate(currentUser.birthday!);
        }
        await saveUserData(currentUser);
        print(currentUser.toJson());
        Gleap.identify(
          userId: currentUser.id!,
          userProperties: GleapUserProperty(
            name: currentUser.name!,
            email: currentUser.email!,
            phone: currentUser.phone!,
          ),
        );
        return {"user": currentUser};
      }
      return {"message": response.errorMessage};
    }
    return {"message": response.errorMessage};
  }

  Future<Map<String, dynamic>> loginUser(UserModel model) async {
    APIResponse response = await _apiService.getDataOnPost(
      data: model.toJson(),
      method: "POST",
      uri: Constants.loginUri,
      token: localUser.token ?? "",
    );
    if (!response.error && response.data != null) {
      UserModel currentUser = UserModel.fromJson(response.data["user"]);
      if (currentUser.name != null) {
        currentUser.token = response.token;
        currentUser.password = model.password;
        if (currentUser.birthday != null && currentUser.birthday!.isNotEmpty) {
          currentUser.birthday = formatDate(currentUser.birthday!);
        }
        await saveUserData(currentUser);
        print(currentUser.toJson());

        Gleap.identify(
          userId: currentUser.id!,
          userProperties: GleapUserProperty(
            name: currentUser.name!,
            email: currentUser.email!,
            phone: currentUser.phone!,
          ),
        );
        return {"user": currentUser};
      }
      return {"message": response.errorMessage};
    }
    return {"message": response.errorMessage};
  }

  Future<bool> forgetPassword(UserModel model) async {
    APIResponse response = await _apiService.getDataOnPost(
      data: model.toJson(),
      method: "POST",
      uri: Constants.forgotPasswordUri,
      token: localUser.token ?? "",
    );
    if (!response.error && response.data != null) {
      return true;
    }
    return false;
  }

  Future<bool> createAndSendOtp(UserModel model) async {
    APIResponse response = await _apiService.getDataOnPost(
      data: model.toJson(),
      method: "POST",
      uri: Constants.createAndSendOtpUri,
      token: localUser.token ?? "",
    );
    if (!response.error && response.data != null) {
      return true;
    }
    return false;
  }

  Future<bool> verifyOtp(Map<String, String> model, String otpCode,
      String fieldToUpdate, fieldValue) async {
    APIResponse response = await _apiService.getDataOnPost(
      data: model,
      method: "POST",
      uri: "${Constants.verifyOtpUri}/$otpCode",
      token: localUser.token ?? "",
    );
    if (!response.error && response.data != null) {
      if (fieldToUpdate.isNotEmpty) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setBool(fieldToUpdate, fieldValue);
      }
      getUserInfosFromCache();
      return true;
    }
    return false;
  }

  Future<bool> verifyProfile() async {
    APIResponse response = await _apiService.getDataOnGet(
      uri: Constants.verifyProfileUri,
      token: localUser.token ?? "",
    );
    print(response.errorMessage);
    print(response.data);
    if (!response.error && response.data != null) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool("isProfileVerified", true);
      localUser.isProfileVerified = true;
      return true;
    }
    return false;
  }

  Future<UserModel> resetPassword(UserModel model, String uri) async {
    APIResponse response = await _apiService.getDataOnPost(
      data: model.toJson(),
      method: "PATCH",
      uri: uri,
      token: localUser.token ?? "",
    );
    print(response.data);
    if (!response.error && response.data != null) {
      UserModel currentUser = UserModel.fromJson(response.data["user"]);
      if (currentUser.name != null) {
        currentUser.token = response.token;
        if (currentUser.birthday != null && currentUser.birthday!.isNotEmpty) {
          currentUser.birthday = formatDate(currentUser.birthday!);
        }
        await saveUserData(currentUser);
        return currentUser;
      }
      return UserModel();
    }
    return UserModel();
  }

  Future<UserModel> updateCurrentUser(UserModel model) async {
    APIResponse response = await _apiService.getDataOnPost(
      data: model.toJson(),
      method: "PATCH",
      uri: Constants.updateCurrentUserUri,
      token: localUser.token ?? "",
    );
    if (!response.error && response.data != null) {
      UserModel currentUser = UserModel.fromJson(response.data["user"]);
      if (currentUser.name != null) {
        currentUser.token = response.token;
        if (currentUser.birthday != null && currentUser.birthday!.isNotEmpty) {
          currentUser.birthday = formatDate(currentUser.birthday!);
        }
        await saveUserData(currentUser);
        return currentUser;
      }
      return UserModel();
    }
    return UserModel();
  }

  Future<Map<String, dynamic>> updateCurrentUserPassword(
      Map<String, String> model) async {
    APIResponse response = await _apiService.getDataOnPost(
      data: model,
      method: "PATCH",
      uri: Constants.updateCurrentUserPasswordUri,
      token: localUser.token ?? "",
    );
    if (!response.error && response.data != null) {
      print(response.data);
      UserModel currentUser = UserModel.fromJson(response.data["user"]);
      if (currentUser.name != null) {
        currentUser.token = response.token;
        currentUser.password = model["password"];
        if (currentUser.birthday != null && currentUser.birthday!.isNotEmpty) {
          currentUser.birthday = formatDate(currentUser.birthday!);
        }
        await saveUserData(currentUser);
        print(currentUser.toJson());
        return {"user": currentUser};
      }
      return {"message": response.errorMessage};
    }
    return {"message": response.errorMessage};
  }

  Future<UserModel> updateProfilePicture(String imagePath) async {
    APIResponse response = await _apiService.postDataWithImage(
      imagePath: imagePath,
      method: "PATCH",
      uri: Constants.updateProfilePictureUri,
      token: localUser.token ?? "",
    );
    if (!response.error && response.data != null) {
      print(response.data);
      UserModel currentUser = UserModel.fromJson(response.data["user"]);
      if (currentUser.name != null) {
        currentUser.token = response.token;
        // currentUser.photo = model["password"];
        if (currentUser.birthday != null && currentUser.birthday!.isNotEmpty) {
          currentUser.birthday = formatDate(currentUser.birthday!);
        }
        await saveUserData(currentUser);
        print(currentUser.toJson());
        return currentUser;
      }
      return UserModel();
    }
    return UserModel();
  }

  Future<UserModel> uploadPapersPicture(List<String> imagesPath) async {
    APIResponse response = await _apiService.postDataWithImage(
      imagePath: "",
      imagesPath: imagesPath,
      method: "PATCH",
      uri: Constants.uploadPapersUri,
      token: localUser.token ?? "",
    );
    if (!response.error && response.data != null) {
      print(response.data);
      UserModel currentUser = UserModel.fromJson(response.data["user"]);
      if (currentUser.name != null) {
        currentUser.token = response.token;
        // currentUser.photo = model["password"];
        if (currentUser.birthday != null && currentUser.birthday!.isNotEmpty) {
          currentUser.birthday = formatDate(currentUser.birthday!);
        }
        await saveUserData(currentUser);
        print(currentUser.toJson());
        return currentUser;
      }
      return UserModel();
    }
    return UserModel();
  }

  Future<bool> isProfileImageExist(String imageUrl) async {
    return await _apiService.checkIfImageExists(imageUrl);
  }

  // Future<UserModel> updateUserDataAfterRegister(UserModel model) async {
  //   APIResponse response = await _apiService.getDataOnPost(
  //     data: model.toJson(),
  //     method: "POST",
  //     uri: Constants.updateUserAfterRegisterUri,
  //     token: localUser.token ?? "",
  //   );
  //   if (!response.error && response.data != null) {
  //     UserModel currentUser = UserModel.fromJson(response.data["user"]);
  //     if (currentUser.name != null) {
  //       currentUser.token = response.token;
  //       await saveUserData(currentUser);
  //       return currentUser;
  //     }
  //     return UserModel();
  //   }
  //   return UserModel();
  // }

  // Future<UserModel> getUserData(String token) async {
  //   APIResponse response = await _apiService.getDataOnGet(
  //     uri: Constants.profileUri,
  //     token: token,
  //   );
  //   if (!response.error && response.data != null) {
  //     // print(response.data["finalUser"]);
  //     return UserModel.fromJson(response.data["finalUser"]);
  //   }
  //   return UserModel();
  // }

  ///Save and get userdata using shared preferemnces
  Future<void> saveUserData(UserModel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (userModel.id != null) {
      preferences.setString("id", userModel.id!);
    }
    if (userModel.name != null && userModel.name!.isNotEmpty) {
      preferences.setString("name", userModel.name.toString());
    }
    if (userModel.email != null && userModel.email!.isNotEmpty) {
      preferences.setString("email", userModel.email.toString());
    }
    if (userModel.phone != null) {
      preferences.setString("phone", userModel.phone!.toString());
    }
    if (userModel.country != null) {
      preferences.setString("country", userModel.country!.toString());
    }
    if (userModel.photo != null) {
      preferences.setString("photo", userModel.photo!.toString());
    }
    if (userModel.photo != null) {
      preferences.setString("idImages", jsonEncode(userModel.idImages));
    }
    if (userModel.city != null) {
      preferences.setString("city", userModel.city!.toString());
    }
    if (userModel.role != null && userModel.role!.isNotEmpty) {
      preferences.setString("role", userModel.role.toString());
    }
    if (userModel.token != null && userModel.token!.isNotEmpty) {
      preferences.setString("token", userModel.token.toString());
    }
    if (userModel.isOtpValid != null) {
      preferences.setBool("isOtpValid", userModel.isOtpValid!);
    }
    if (userModel.isNumberVerified != null) {
      preferences.setBool("isNumberVerified", userModel.isNumberVerified!);
    }
    if (userModel.isEmailVerified != null) {
      preferences.setBool("isEmailVerified", userModel.isEmailVerified!);
    }
    if (userModel.isPersonVerified != null) {
      preferences.setBool("isPersonVerified", userModel.isPersonVerified!);
    }
    if (userModel.isProfileVerified != null) {
      preferences.setBool("isProfileVerified", userModel.isProfileVerified!);
    }
    if (userModel.address != null && userModel.address!.isNotEmpty) {
      preferences.setString("address", userModel.address.toString());
    }
    if (userModel.birthday != null && userModel.birthday!.isNotEmpty) {
      preferences.setString("birthday", userModel.birthday.toString());
    }
    if (userModel.idPaper != null && userModel.idPaper!.isNotEmpty) {
      preferences.setString("idPaper", userModel.idPaper.toString());
    }
    if (userModel.idNumber != null && userModel.idNumber!.isNotEmpty) {
      preferences.setString("idNumber", userModel.idNumber.toString());
    }
    if (userModel.income != null && userModel.income!.isNotEmpty) {
      preferences.setString("income", userModel.income.toString());
    }
    if (userModel.job != null && userModel.job!.isNotEmpty) {
      preferences.setString("job", userModel.job.toString());
    }
    if (userModel.sex != null && userModel.sex!.isNotEmpty) {
      preferences.setString("sex", userModel.sex.toString());
    }
    if (userModel.currentBalance != null &&
        userModel.currentBalance!.isNotEmpty) {
      preferences.setString(
          "currentBalance", userModel.currentBalance.toString());
    }
    if (userModel.sponsorshipBalance != null &&
        userModel.sponsorshipBalance!.isNotEmpty) {
      preferences.setString(
          "sponsorshipBalance", userModel.sponsorshipBalance.toString());
    }
    if (userModel.sponsorshipCode != null &&
        userModel.sponsorshipCode!.isNotEmpty) {
      preferences.setString(
          "sponsorshipCode", userModel.sponsorshipCode.toString());
    }
    if (userModel.token != null && userModel.token!.isNotEmpty) {
      preferences.setString("token", userModel.token.toString());
    }
    if (userModel.isOtpValid != null) {
      preferences.setBool("isOtpValid", userModel.isOtpValid!);
    }
    if (userModel.password != null && userModel.password!.isNotEmpty) {
      preferences.setString("password", userModel.password!);
    }

    preferences.setBool("isLogin", true);
    getUserInfosFromCache();
  }

  Future<void> getUserInfosFromCache() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    localUser.hasAlreadyCreatedCard =
        preferences.getBool("hasAlreadyCreatedCard") ?? false;
    localUser.id = preferences.getString("id") ?? "";
    localUser.name = preferences.getString("name") ?? "";
    localUser.email = preferences.getString("email") ?? "";
    localUser.phone = preferences.getString("phone") ?? "";
    localUser.country = preferences.getString("country") ?? "";
    localUser.city = preferences.getString("city") ?? "";
    localUser.photo = preferences.getString("photo") ?? "";
    localUser.idImages =
        jsonDecode(preferences.getString("idImages") ?? '[]').cast<String>();
    localUser.role = preferences.getString("role") ?? "";
    localUser.isOtpValid = preferences.getBool("isOtpValid");
    localUser.isNumberVerified = preferences.getBool("isNumberVerified");
    localUser.isEmailVerified = preferences.getBool("isEmailVerified");
    localUser.isPersonVerified = preferences.getBool("isPersonVerified");
    localUser.isProfileVerified = preferences.getBool("isProfileVerified");
    localUser.address = preferences.getString("address") ?? "";
    localUser.birthday = preferences.getString("birthday") ?? "";
    localUser.idPaper = preferences.getString("idPaper") ?? "";
    localUser.idNumber = preferences.getString("idNumber") ?? "";
    localUser.income = preferences.getString("income") ?? "";
    localUser.job = preferences.getString("job") ?? "";
    localUser.sex = preferences.getString("sex") ?? "";
    localUser.currentBalance = preferences.getString("currentBalance") ?? "";
    localUser.lastTransaction = preferences.getString("lastTransaction") ?? "";
    localUser.sponsorshipBalance =
        preferences.getString("sponsorshipBalance") ?? "";
    localUser.sponsorshipCode = preferences.getString("sponsorshipCode") ?? "";
    localUser.password = preferences.getString("password") ?? "";
    localUser.token = preferences.getString("token") ?? "";
  }

  Future logout() async {
    Get.offAll(() => LoginScreen());
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: ((context) {
    //       return LoginScreen();
    //     }),
    //   ),
    // );
    Gleap.clearIdentity();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    preferences.setBool("isLogin", false);
    localUser = UserModel(
      id: "",
      name: "",
      email: "",
      phone: "",
      country: "",
      city: "",
      idImages: [],
      photo: "",
      role: "",
      isOtpValid: false,
      isNumberVerified: false,
      isEmailVerified: false,
      isPersonVerified: false,
      address: "",
      birthday: "",
      idPaper: "",
      idNumber: "",
      income: "",
      job: "",
      sex: "",
      currentBalance: "",
      lastTransaction: "",
      sponsorshipBalance: "",
      sponsorshipCode: "",
      token: "",
      // password: "",
    );
  }

  Future<bool> deleteUser() async {
    APIResponse response = await _apiService.getDataOnPost(
      method: "DELETE",
      uri: Constants.deleteUserUri,
      token: localUser.token ?? "",
    );
    if (!response.error) {
      return true;
    }
    return false;
  }

  Future<bool> isUserLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool("isLogin") ?? false;
  }

  String formatDate(String dateTimeString) {
    try {
      final inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
      final outputFormat = DateFormat("yyyy-MM-dd");
      final dateTime = inputFormat.parse(dateTimeString);
      final formattedDate = outputFormat.format(dateTime);
      return formattedDate;
    } catch (e) {
      print("Erreur lors de la conversion de la date : $e");
      return dateTimeString; // En cas d'erreur, renvoyer la chaîne d'origine
    }
  }
}

UserModel localUser = UserModel(
  id: "",
  name: "",
  email: "",
  phone: "",
  country: "",
  city: "",
  photo: "",
  idImages: [],
  role: "",
  isOtpValid: false,
  isNumberVerified: false,
  isEmailVerified: false,
  isPersonVerified: false,
  address: "",
  birthday: "",
  idPaper: "",
  idNumber: "",
  income: "",
  job: "",
  sex: "",
  token: "",
  currentBalance: "",
  lastTransaction: "",
  sponsorshipCode: "",
  password: "",
);
