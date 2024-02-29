import 'package:get/get.dart';
import 'package:secure_app/models/card_model.dart';
import 'package:secure_app/models/transaction_model.dart';
import 'package:secure_app/models/user_model.dart';
import 'package:secure_app/repositories/card_repository.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardController extends GetxController {
  RxList<CardModel>? cards = (List<CardModel>.of([])).obs;
  final CardRespoirtory _cardRespoirtory = CardRespoirtory();
  RxString selectedBrand = "MASTERCARD".obs;
  RxString err = "".obs;
  RxBool isLoading = false.obs;
  RxInt? selectedCardIndex = 0.obs;

  Future<void> getCards(UserModel userModel) async {
    err('');
    // RxList<TransactionModel>? transactionsCopy =
    //     (List<TransactionModel>.of([])).obs;
    try {
      // if (transactions != null && transactions!.isNotEmpty) {
      //   transactionsCopy = transactions;
      //   transactions!.clear();
      // }
      print(isLoading);
      cards!(await _cardRespoirtory.getCards(userModel.id!, userModel.token!));
      if (cards != null && cards!.isNotEmpty) {
        isLoading(false);
        print(isLoading);
        for (CardModel card in cards!) {
          // print(transaction.createdAt);
          card.createdAt = Constants.formatCardDate(card.createdAt!);
          card.number = Constants.formatCardNumber(card.number!);
          // assignTransactions(transactions);
        }
        cards!.sort((a, b) {
          String? dateA = a.createdAt;
          String? dateB = b.createdAt;
          // print(dateB);
          return dateB!.compareTo(dateA!);
        });
        if (cards!.isNotEmpty && !localUser.hasAlreadyCreatedCard!) {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setBool("hasAlreadyCreatedCard", true);
          localUser.hasAlreadyCreatedCard =
              preferences.getBool("hasAlreadyCreatedCard") ?? false;
        }
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
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  Future<void> createCard(String selectedBrand) async {
    err('');
    try {
      final CardModel card = await _cardRespoirtory.createCard(selectedBrand);
      // print(mobileOperator);
      // user(newUser);
      // print(user.value.name);
      if (card.sId == null || card.sId!.isEmpty) {
        if (!localUser.hasAlreadyCreatedCard!) {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setBool("hasAlreadyCreatedCard", true);

          localUser.hasAlreadyCreatedCard =
              preferences.getBool("hasAlreadyCreatedCard") ?? false;
        }
        err("Impossible de creer la carte");
        print(err);
      } else {
        print("Success");

        card.createdAt = Constants.formatCardDate(card.createdAt!);
        card.number = Constants.formatCardNumber(card.number!);
        cards!.add(card);
        selectedCardIndex!(cards!.indexOf(card));
        // lastTransactionAmount(amount);
        // lastTransactionType("-");
      }
    } catch (error) {
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  Future<void> freezeCard(String mapId) async {
    err('');
    try {
      final CardModel card = await _cardRespoirtory.freezeCard(mapId);
      // print(mobileOperator);
      // user(newUser);
      // print(user.value.name);
      if (card.sId == null || card.sId!.isEmpty) {
        err("Impossible de bloquer la carte, reessayer!");
        print(err);
      } else {
        print("Success");

        print("Success");
        card.createdAt = Constants.formatCardDate(card.createdAt!);
        card.number = Constants.formatCardNumber(card.number!);
        cards![selectedCardIndex!.value] = card;
        selectedCardIndex!(cards!.indexOf(card));
        // lastTransactionAmount(amount);
        // lastTransactionType("-");
      }
    } catch (error) {
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  Future<void> unfreezeCard(String mapId) async {
    err('');
    try {
      final CardModel card = await _cardRespoirtory.unfreezeCard(mapId);
      // print(mobileOperator);
      // user(newUser);
      // print(user.value.name);
      if (card.sId == null || card.sId!.isEmpty) {
        err("Impossible de bloquer la carte, reessayer!");
        print(err);
      } else {
        print("Success");

        print("Success");
        card.createdAt = Constants.formatCardDate(card.createdAt!);
        card.number = Constants.formatCardNumber(card.number!);
        cards![selectedCardIndex!.value] = card;
        selectedCardIndex!(cards!.indexOf(card));
        // lastTransactionAmount(amount);
        // lastTransactionType("-");
      }
    } catch (error) {
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  @override
  void onInit() {
    // soldTransactions = (List<TransactionModel>.of([])).obs;
    // cardTransactions = (List<TransactionModel>.of([])).obs;
    // transfertTransactions = (List<TransactionModel>.of([])).obs;
    if (localUser.token != null && localUser.token!.isNotEmpty) {
      isLoading = true.obs;
      print("init");
      getCards(localUser);
    }
    // getTransactions(localUser);
    super.onInit();
  }
}
