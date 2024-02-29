import 'package:intl/intl.dart';
import 'package:secure_app/models/api_response.dart';
import 'package:secure_app/models/transaction_model.dart';
import 'package:secure_app/models/user_model.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionRepository {
  final APIService _apiService = APIService();
  final UserRepository _userRepository = UserRepository();

  Future<bool> createTransaction(String userId, String amount, String phone,
      String method, bool isRecharge) async {
    APIResponse response = await _apiService.getDataOnPost(
      data: {"user": userId},
      method: "POST",
      uri: Constants.createTransactionUri(
          amount, phone, method, "solde", isRecharge ? "recharge" : "retrait"),
      token: localUser.token ?? "",
    );
    if (!response.error && response.data != null) {
      if (response.data["user"]["soldeCourant"] != null) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        if (response.data["user"]["soldeCourant"] != null) {
          preferences.setString("currentBalance",
              response.data["user"]["soldeCourant"].toString());
        } else {
          preferences.setString("currentBalance", amount.toString());
        }
      }
      _userRepository.getUserInfosFromCache();
      return true;
    }
    return false;
  }

  Future<List<TransactionModel>> getTransactions(
      String userId, String token) async {
    APIResponse response = await _apiService.getDataOnGet(
      uri: Constants.getTransactionUri(userId),
      token: token.isNotEmpty ? token : localUser.token ?? "",
    );

    if (!response.error && response.data != null) {
      print(response.data);
      // print(response.data["user"]["soldeCourant"]);
      if (response.data["user"]["soldeCourant"] != null) {
        // if (response.data["user"] != null) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString(
            "currentBalance", response.data["user"]["soldeCourant"].toString());
        _userRepository.getUserInfosFromCache();
        // }
      }
      List<TransactionModel> transactions = [];
      transactions = (response.data!["doc"] as List<dynamic>).map((i) {
        print(i);
        TransactionModel transaction =
            TransactionModel.fromJson(i as Map<String, dynamic>);
        print("Transaction");
        print(transaction.toJson());
        // transaction.createdAt = formatDate(transaction.createdAt!);
        return transaction;
      }).toList();
      return transactions;
    }
    return [];
  }

  Future<UserModel> checkReceiver(String receiverPhone) async {
    APIResponse response = await _apiService.getDataOnPost(
      data: {"phone": receiverPhone},
      method: "POST",
      uri: Constants.checkReceiverUri,
      token: localUser.token ?? "",
    );
    if (!response.error && response.data != null) {
      print(response.data);
      UserModel receiver = UserModel.fromJson(response.data['user']);
      return receiver;
    }
    return UserModel();
  }

  Future<bool> createTransfert(
      String amount, String receiverPhone, String message) async {
    APIResponse response = await _apiService.getDataOnPost(
      data: {
        "users": [localUser.phone ?? "", receiverPhone],
        "amount": amount,
        "message": message
      },
      method: "POST",
      uri: Constants.createTransfertUri,
      token: localUser.token ?? "",
    );
    if (!response.error && response.data != null) {
      print(response.data);

      SharedPreferences preferences = await SharedPreferences.getInstance();
      if (response.data["users"]["senderAccount"]["soldeCourant"] != null) {
        // if (response.data["user"]["senderAccount"] != null) {
        preferences.setString("currentBalance",
            response.data["users"]["senderAccount"]["soldeCourant"].toString());
        // }
      } else {
        preferences.setString("currentBalance", amount.toString());
      }
      _userRepository.getUserInfosFromCache();
      // if (response.data["user"]["soldeCourant"] != null) {
      //   SharedPreferences preferences = await SharedPreferences.getInstance();
      //   if (response.data["user"]["soldeCourant"] != null) {
      //     preferences.setString("currentBalance",
      //         response.data["user"]["soldeCourant"].toString());
      //   } else {
      //     preferences.setString("currentBalance", amount.toString());
      //   }
      // }
      // _userRepository.getUserInfosFromCache();
      return true;
    }
    return false;
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
