import 'package:intl/intl.dart';
import 'package:secure_app/models/api_response.dart';
import 'package:secure_app/models/card_model.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/services/api_service.dart';

class CardRespoirtory {
  final APIService _apiService = APIService();

  Future<List<CardModel>> getCards(String userId, String token) async {
    APIResponse response = await _apiService.getDataOnGet(
      uri: Constants.getCardUri(userId),
      token: token.isNotEmpty ? token : localUser.token ?? "",
    );

    if (!response.error && response.data != null) {
      print(response.data!["doc"]);
      // print(response.data["user"]["soldeCourant"]);
      // if (response.data["user"]["soldeCourant"] != null) {
      //   // if (response.data["user"] != null) {
      //   SharedPreferences preferences = await SharedPreferences.getInstance();
      //   preferences.setString(
      //       "currentBalance", response.data["user"]["soldeCourant"].toString());
      //   _userRepository.getUserInfosFromCache();
      //   // }
      // }
      List<CardModel> cards = [];
      cards = (response.data!["doc"] as List<dynamic>).map((i) {
        print(i);
        CardModel card = CardModel.fromJson(i as Map<String, dynamic>);
        print("Cards");
        print(card.toJson());
        card.createdAt = formatDate(card.createdAt!);
        card.balanceUpdatedAt = formatDate(card.balanceUpdatedAt!);
        return card;
      }).toList();
      return cards;
    }
    return [];
  }

  Future<CardModel> createCard(String brand) async {
    APIResponse response = await _apiService.getDataOnPost(
      data: {"brand": brand},
      method: "POST",
      uri: Constants.createCardUri,
      token: localUser.token ?? "",
    );
    if (!response.error && response.data != null) {
      print(response.data);
      CardModel card = CardModel.fromJson(response.data["newCard"]);
      return card;
    }
    return CardModel();
  }

  Future<CardModel> freezeCard(String mapId) async {
    APIResponse response = await _apiService.getDataOnPost(
      // data: {"brand": brand},
      method: "PATCH",
      uri: Constants.freezeCardUri(mapId),
      token: localUser.token ?? "",
    );
    if (!response.error && response.data != null) {
      print(response.data);
      CardModel card = CardModel.fromJson(response.data["newCard"]);
      return card;
    }
    return CardModel();
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

  Future<CardModel> unfreezeCard(String mapId) async {
    APIResponse response = await _apiService.getDataOnPost(
      // data: {"brand": brand},
      method: "PATCH",
      uri: Constants.unfreezeCardUri(mapId),
      token: localUser.token ?? "",
    );
    if (!response.error && response.data != null) {
      print(response.data);
      CardModel card = CardModel.fromJson(response.data["newCard"]);
      return card;
    }
    return CardModel();
  }
}
