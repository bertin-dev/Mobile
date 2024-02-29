import 'package:secure_app/models/api_response.dart';
import 'package:secure_app/models/notiifcation_model.dart';
import 'package:secure_app/models/transaction_model.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/services/api_service.dart';

class NotificationRepository {
  final APIService _apiService = APIService();

  Future<List<NotificationModel>> getNotifications(
      String userId, String token) async {
    APIResponse response = await _apiService.getDataOnGet(
      uri: Constants.getNotificationsUri(userId),
      token: token.isNotEmpty ? token : localUser.token ?? "",
    );

    if (!response.error && response.data != null) {
      // print(response.data!["data"]);
      List<NotificationModel> notifications = [];
      notifications = (response.data!["data"] as List<dynamic>).map((i) {
        // print(i);
        NotificationModel notification =
            NotificationModel.fromJson(i as Map<String, dynamic>);
        // print("Transaction");
        // print(notification.toJson());
        return notification;
      }).toList();
      return notifications;
    }
    return [];
  }

  Future<List<NotificationModel>> updateNotificationStatus(
      String notificationId, String token) async {
    APIResponse response = await _apiService.getDataOnGet(
      uri: Constants.updateNotificationsStatusUri(notificationId),
      token: token.isNotEmpty ? token : localUser.token ?? "",
    );

    if (!response.error && response.data != null) {
      List<NotificationModel> notifications = [];
      notifications = (response.data!["data"] as List<dynamic>).map((i) {
        NotificationModel notification =
            NotificationModel.fromJson(i as Map<String, dynamic>);
        return notification;
      }).toList();
      return notifications;
    }
    return [];
  }
}
