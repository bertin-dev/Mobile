class NotificationModel {
  String? id;
  String? status;
  String? message;
  String? user;
  String? createdAt;

  NotificationModel(
      {this.id, this.status, this.message, this.user, this.createdAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    status = json['status'];
    message = json['message'];
    user = json['user'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['_id'] = id;
    data['status'] = status;
    data['message'] = message;
    data['user'] = user;
    data['createdAt'] = createdAt;
    return data;
  }
}
