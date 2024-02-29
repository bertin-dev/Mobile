import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:secure_app/ressources/app_styles.dart';

class Constants {
  static screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static const localBaseUri = "";
  static const loginUri = "$localBaseUri/users/login";
  static const registerUri = "$localBaseUri/users/signup";
  static const forgotPasswordUri = "$localBaseUri/users/forgotPassword";
  static const createAndSendOtpUri = "$localBaseUri/users/createAndSendOTP";
  static const verifyOtpUri = "$localBaseUri/users/sendVerifyOTP";
  // static const verifyEmailUri = "$localBaseUri/users/verifyEmail";
  // static const verifyPhoneUri = "$localBaseUri/users/verifyPhoneNumber";
  static const verifyProfileUri = "$localBaseUri/users/verifyProfile";
  static const resetPasswordUri = "$localBaseUri/users/resetPassword";
  static const updateCurrentUserUri = "$localBaseUri/users/updateMe";
  static const deleteUserUri = "$localBaseUri/users/deleteMe";
  static const updateCurrentUserPasswordUri =
      "$localBaseUri/users/updateMyPassword";
  static String createTransactionUri(String amount, String phone, String method,
          String category, String type) =>
      "$localBaseUri/transactions/sold?amount=$amount&number=$phone&method=$method&category=$category&type=$type";
  static String getTransactionUri(String userId) =>
      "$localBaseUri/transactions/$userId";
  static String getCardUri(String userId) => "$localBaseUri/cards/$userId";
  static const createTransfertUri = "$localBaseUri/transactions/transfer";
  static const checkReceiverUri =
      "$localBaseUri/transactions/checkReceivedNumber";
  static String getNotificationsUri(String userId) =>
      "$localBaseUri/notifications/$userId";
  static String updateNotificationsStatusUri(String notificationId) =>
      "$localBaseUri/notifications/$notificationId";
  static const updateProfilePictureUri = "$localBaseUri/users/uploadPicture";
  static const uploadPapersUri = "$localBaseUri/users/uploadPaperImages";
  static const createCardUri = "$localBaseUri/cards/create";
  static String freezeCardUri(String mapId) =>
      "$localBaseUri/cards/freeze/$mapId";
  static String unfreezeCardUri(String mapId) =>
      "$localBaseUri/cards/unfreeze/$mapId";
  static String getInfosUri = "$localBaseUri/infos";
  // "$localBaseUri/users/updateMe";

  static void snackBar(
      {required Color bgColor,
      required Color textColor,
      bool hasSpecialCharacters = false,
      required String description}) {
    Get.rawSnackbar(
        backgroundColor: bgColor,
        borderRadius: 10.0,
        // colorText: AppColors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 40.0, left: 22.0, right: 22.0),
        messageText: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Center(
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: hasSpecialCharacters
                  ? AppStyles.textPoppinsStyle(
                      color: textColor,
                      size: 11,
                      weight: FontWeight.w400,
                    )
                  : AppStyles.textStyle(
                      color: textColor,
                      size: 12,
                      weight: FontWeight.w400,
                    ),
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10.0));
  }

  static String parseDate(String inputDate) {
    // print(inputDate);
    // Convertir la chaîne d'entrée en objet DateTime
    DateTime dateTime = DateTime.parse(inputDate);

    // Formater la date et l'heure selon le format souhaité
    DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    DateFormat timeFormat = DateFormat('HH:mm');

    String formattedDate = dateFormat.format(dateTime);
    String formattedTime = timeFormat.format(dateTime);

    // Combiner la date et l'heure
    String result = '$formattedDate $formattedTime';

    return result;
  }

  static String formatCardDate(String dateStr) {
    // Convertir la chaîne de date en objet DateTime
    DateTime date = DateTime.parse(dateStr);

    // Formater la date en utilisant la bibliothèque intl pour obtenir le nom du mois en français
    String formattedDate = DateFormat.yMMMMd('fr_FR').format(date);

    return formattedDate;
  }

  static String formatCardNumber(String cardNumber) {
    if (cardNumber.length != 16) {
      // Vérifie si la longueur du numéro de carte est correcte
      return cardNumber;
    }

    // Ajoute des espaces après chaque groupe de 4 chiffres
    return "${cardNumber.substring(0, 4)} ${cardNumber.substring(4, 8)} ${cardNumber.substring(8, 12)} ${cardNumber.substring(12)}";
  }
}
