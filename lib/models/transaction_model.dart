class TransactionModel {
  String? id;
  String? status;
  String? orderId;
  String? category;
  String? type;
  String? number;
  String? country;
  String? method;
  String? amount;
  String? xafAmount;
  String? message;
  String? expeditor;
  String? slug;
  String? user;
  String? createdAt;

  TransactionModel(
      {this.id,
      this.status,
      this.orderId,
      this.category,
      this.type,
      this.number,
      this.country,
      this.method,
      this.amount,
      this.xafAmount,
      this.message,
      this.slug,
      this.user,
      this.createdAt});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    status = json['status'];
    orderId = json['orderId'];
    category = json['category'];
    type = json['type'];
    number = json['number'].toString();
    country = json['country'];
    method = json['method'];
    amount = json['amount'].toString();
    if (json['XAFAmount'] != null) xafAmount = json['XAFAmount'].toString();
    if (json['message'] != null) message = json['message'].toString();
    if (json["expeditor"] != null) {
      print(json['expeditor']);
      expeditor = json['expeditor'].toString();
    }
    if (json["slug"] != null) {
      print(json['slug']);
      slug = json['slug'].toString();
    }
    user = json['user'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['status'] = status;
    data['orderId'] = orderId;
    data['category'] = category;
    data['type'] = type;
    data['number'] = number;
    data['country'] = country;
    data['method'] = method;
    data['amount'] = amount;
    data['amount'] = amount;
    data['message'] = message;
    data['slug'] = slug;
    data['user'] = user;
    data['createdAt'] = createdAt;
    return data;
  }
}
