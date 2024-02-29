class InfoModel {
  String? id;
  String? title;
  String? message;
  String? createdAt;

  InfoModel({this.id, this.title, this.message, this.createdAt});

  InfoModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    message = json['message'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['_id'] = id;
    data['title'] = title;
    data['message'] = message;
    data['createdAt'] = createdAt;
    return data;
  }
}
