import 'package:get/get.dart';
import 'package:secure_app/models/notiifcation_model.dart';
import 'package:secure_app/models/user_model.dart';
import 'package:secure_app/repositories/notification_repository.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/constants.dart';

class NotificationController extends GetxController {
  final NotificationRepository _notificationRepository =
      NotificationRepository();
  RxList<NotificationModel>? notifications =
      (List<NotificationModel>.of([])).obs;
  RxBool isLoading = false.obs;
  RxString err = "".obs;
  RxInt countUnreadMessages = 0.obs;

  Future<void> getNotifications(UserModel userModel) async {
    err('');
    // RxList<NotificationModel>? transactionsCopy =
    //     (List<TransactionModel>.of([])).obs;
    try {
      // if (transactions != null && transactions!.isNotEmpty) {
      //   transactionsCopy = transactions;
      //   transactions!.clear();
      // }
      print(isLoading);
      notifications!(await _notificationRepository.getNotifications(
          userModel.id!, userModel.token!));
      if (notifications != null && notifications!.isNotEmpty) {
        isLoading(false);
        print(isLoading);
        for (NotificationModel notification in notifications!) {
          // print(transaction.createdAt);
          notification.createdAt = Constants.parseDate(notification.createdAt!);
        }
        notifications!.sort((a, b) {
          String? dateA = a.createdAt!;
          String? dateB = b.createdAt!;
          // print(dateB);
          return dateB.compareTo(dateA);
        });
        countUnreadMessages(notifications!
            .where((notification) => notification.status == "unread")
            .toList()
            .length);
        err('success');
      }
      isLoading(false);
    } catch (error) {
      isLoading(false);
      print(error);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  Future<void> updateNotifications(
      {required String token,
      required List<NotificationModel> notifics}) async {
    List<NotificationModel> notifs = [];
    for (var notification in notifics) {
      await _notificationRepository.updateNotificationStatus(
          notification.id!, token);
      notification.status = "read";
      print("notification.toJson()");
      print(notification.toJson());
      notifs.add(notification);
    }
    notifications!(notifs);
    countUnreadMessages(notifications!
        .where((notification) => notification.status == "unread")
        .toList()
        .length);
  }

  @override
  void onInit() {
    if (localUser.token != null && localUser.token!.isNotEmpty) {
      isLoading = true.obs;
      getNotifications(localUser);

      countUnreadMessages(notifications!
          .where((notification) => notification.status == "unread")
          .toList()
          .length);
    }
    // getTransactions(localUser);
    super.onInit();
  }
}
