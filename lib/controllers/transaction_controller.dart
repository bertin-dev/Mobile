import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/models/transaction_model.dart';
import 'package:secure_app/models/user_model.dart';
import 'package:secure_app/repositories/transaction_repository.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionController extends GetxController {
  final TransactionRepository _transactionRepository = TransactionRepository();
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());
  Rx<UserModel> user = UserModel().obs;
  RxString amount = "".obs;
  RxString phone = "".obs;
  RxString message = "".obs;
  RxString password = "".obs;
  RxString amountToPay = "0".obs;
  RxString lastTransactionAmount = "00.00".obs;
  RxString lastTransactionType = "+".obs;
  RxString searchValue = "".obs;
  RxString mobileOperator = "".obs;
  RxString err = "".obs;
  RxList<TransactionModel>? transactions = (List<TransactionModel>.of([])).obs;
  RxList<TransactionModel>? searchTransaction =
      (List<TransactionModel>.of([])).obs;
  RxList<TransactionModel> listForSearch = (List<TransactionModel>.of([])).obs;
  RxList<TransactionModel>? soldTransactions =
      (List<TransactionModel>.of([])).obs;
  RxList<TransactionModel>? cardTransactions =
      (List<TransactionModel>.of([])).obs;
  RxList<TransactionModel>? transfertTransactions =
      (List<TransactionModel>.of([])).obs;
  Rx<TransactionModel> transactionForDetails = TransactionModel().obs;
  Rx<UserModel>? receiver = UserModel().obs;
  RxBool isLoading = false.obs;
  RxBool isSearchUser = false.obs;

  Future<void> createTransaction(
      UserModel userModel, bool isRecharge, String amount, String phone) async {
    err('');
    try {
      mobileOperator(detectOperator(phone));
      final bool isTransactionSuccess =
          await _transactionRepository.createTransaction(
              userModel.id!, amount, phone, mobileOperator.value, isRecharge);
      print(mobileOperator);
      // user(newUser);
      // print(user.value.name);
      if (!isTransactionSuccess) {
        err("Impossible de d'effectuer la transaction");
      } else {
        lastTransactionAmount(amount);
        isRecharge ? lastTransactionType("+") : lastTransactionType("-");
      }
    } catch (error) {
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  Future<void> checkReceiver(String receiverPhone) async {
    err('');
    receiver = UserModel().obs;
    try {
      receiver!(await _transactionRepository.checkReceiver(receiverPhone));
    } catch (error) {
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  Future<void> createTransfert(
      String receiverPhone, String amount, String message) async {
    err('');
    try {
      final bool isTransactionSuccess =
          await _transactionRepository.createTransfert(
              amount, receiverPhone, message.isNotEmpty ? message : "/");
      print(mobileOperator);
      // user(newUser);
      // print(user.value.name);
      if (!isTransactionSuccess) {
        err("Impossible de d'effectuer la transaction");
      } else {
        lastTransactionAmount(amount);
        lastTransactionType("-");
      }
    } catch (error) {
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  Future<void> getTransactions(UserModel userModel) async {
    err('');
    // RxList<TransactionModel>? transactionsCopy =
    //     (List<TransactionModel>.of([])).obs;
    try {
      // if (transactions != null && transactions!.isNotEmpty) {
      //   transactionsCopy = transactions;
      //   transactions!.clear();
      // }
      print(isLoading);
      transactions!(await _transactionRepository.getTransactions(
          userModel.id!, userModel.token!));
      if (transactions != null && transactions!.isNotEmpty) {
        isLoading(false);
        print(isLoading);
        for (TransactionModel transaction in transactions!) {
          // print(transaction.createdAt);
          transaction.createdAt = Constants.parseDate(transaction.createdAt!);
          assignTransactions(transactions);
        }
        transactions!.sort((a, b) {
          String? dateA = a.createdAt;
          String? dateB = b.createdAt;
          // print(dateB);
          return dateB!.compareTo(dateA!);
        });

        err('success');
      }
      isLoading(false);
      // print(transactions);
      // print(soldTransactions);
      // print(transfertTransactions);
      // transactions!(transactions!.reversed.toList());
      // print(transactions);
    } catch (error) {
      isLoading(false);
      // transactions = transactionsCopy;
      print("error $error");
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  void searchATransaction(bool isSeeMoreVisible) {
    if (searchValue.isNotEmpty && !isSeeMoreVisible) {
      if (_topNavBarController.selectedHistoryFilter.value == 0 &&
          transactions != null &&
          transactions!.isNotEmpty) {
        listForSearch = transactions!;
        // searchTransaction!(transactions!.where((transaction) => transaction.amount!.contains(value) || transaction.message!.contains(value) || transaction.receiver!.phone!.contains(value) || transaction.sender!.phone!.contains(value) || transaction.sender!.name!.contains(value) || transaction.receiver!.name!.contains(value) || transaction.sender!.account!.name!.contains(value) || transaction.receiver!.account!.name!.contains(value) || transaction.sender!.account!.accountNumber!.contains(value) || transaction.receiver!.account!.accountNumber!.contains(value) || transaction.sender!.account!.accountType!.contains(value) || transaction.receiver!.account!.accountType!.contains(value) || transaction.sender!.account!.bank!.contains(value) || transaction.receiver!.account!.bank!.contains(value)).toList());
      } else if (_topNavBarController.selectedHistoryFilter.value == 1 &&
          soldTransactions != null &&
          soldTransactions!.isNotEmpty) {
        listForSearch = soldTransactions!;
      } else if (_topNavBarController.selectedHistoryFilter.value == 2 &&
          cardTransactions != null &&
          cardTransactions!.isNotEmpty) {
        listForSearch = cardTransactions!;
      } else if (_topNavBarController.selectedHistoryFilter.value == 3 &&
          transfertTransactions != null &&
          transfertTransactions!.isNotEmpty) {
        listForSearch = transfertTransactions!;
      }
      searchTransaction!(listForSearch
          .where((transaction) => transaction.amount!.contains(searchValue)
              // ||
              // transaction.number!.contains(value),
              )
          .toList());
    }
  }

  void assignTransactions(List<TransactionModel>? transactionsList) {
    if (transactionsList != null && transactionsList.isNotEmpty) {
      soldTransactions!(transactionsList
          .where(
              (transaction) => transaction.category!.toLowerCase() == "solde")
          .toList());
      transfertTransactions!(transactionsList
          .where((transaction) =>
              transaction.category!.toLowerCase() == "transfert")
          .toList());
    } else {
      soldTransactions = (List<TransactionModel>.of([])).obs;
      cardTransactions = (List<TransactionModel>.of([])).obs;
      transfertTransactions = (List<TransactionModel>.of([])).obs;
    }
  }

  void clearData() {
    amount = "".obs;
    phone = "".obs;
    password = "".obs;
    amountToPay = "0".obs;
    mobileOperator = "".obs;
  }

  @override
  void onInit() {
    // soldTransactions = (List<TransactionModel>.of([])).obs;
    // cardTransactions = (List<TransactionModel>.of([])).obs;
    // transfertTransactions = (List<TransactionModel>.of([])).obs;
    if (localUser.token != null && localUser.token!.isNotEmpty) {
      isLoading = true.obs;
      getTransactions(localUser);
    }
    // getTransactions(localUser);
    super.onInit();
  }

  String detectOperator(String phoneNumber) {
    // Supprimer les espaces et les caractères non numériques du numéro
    phoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

    // Vérifier la longueur minimale du numéro (pour éviter les erreurs)
    // if (phoneNumber.length < 9) {
    //   return "Numéro invalide";
    // }

    // Extraire les premiers chiffres (indicatif régional)
    String indicatif = phoneNumber.substring(0, 3);
    String indicatifDebut = phoneNumber.substring(0, 2);

    // Vérifier l'indicatif pour déterminer l'opérateur
    if (indicatifDebut == "67" ||
        indicatif == '650' ||
        indicatif == '651' ||
        indicatif == '652' ||
        indicatif == '653' ||
        indicatif == '654' ||
        indicatif == '680' ||
        indicatif == '682' ||
        indicatif == '67') {
      return "MTN_MOMO";
    } else if (indicatifDebut == "69" ||
        indicatif == '655' ||
        indicatif == '656' ||
        indicatif == '657' ||
        indicatif == '658' ||
        indicatif == '659' ||
        indicatif == '69') {
      return "ORANGE_MONEY";
    } else {
      return "unknow";
    }
  }

  String formatAmount(double amount) {
    amount = double.parse(amount.toStringAsFixed(2));

    String formattedAmount = amount.toString();
    // String formattedAmount = amount.toStringAsFixed(0);

    final separator = ' ';
    final List<String> parts = formattedAmount.split('.');
    parts[0] = parts[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match match) => '${match[1]}$separator',
    );
    formattedAmount = parts.join('.');

    formattedAmount = formattedAmount;

    return formattedAmount;
  }

  String displayDifferenceBetweenTwoDates(String dateStr) {
    // Convertir la date de la chaîne en objet DateTime
    DateTime date = DateTime.parse(dateStr);

    // Obtenez la date du jour
    DateTime aujourdHui = DateTime.now();

    // Comparez les deux dates
    Duration difference = aujourdHui.difference(date);
    int differenceEnJours = difference.inDays;

    if (differenceEnJours == 0) {
      return "Aujourd'hui";
    } else if (differenceEnJours == 1) {
      return "Hier";
    } else {
      return "Il y a $differenceEnJours jours";
    }
  }
}
