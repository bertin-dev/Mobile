class CardModel {
  String? sId;
  String? status;
  String? event;
  String? reference;
  String? createdAt;
  String? amount;
  String? brand;
  String? user;
  String? sV;
  String? mapId;
  String? maskedNumber;
  String? name;
  String? balanceUpdatedAt;
  String? city;
  String? countryCode;
  String? cvv;
  String? expiredAt;
  String? number;
  String? postalCode;
  String? stateCode;
  String? street;

  CardModel(
      {this.sId,
      this.status,
      this.event,
      this.reference,
      this.createdAt,
      this.amount,
      this.brand,
      this.user,
      this.sV,
      this.mapId,
      this.maskedNumber,
      this.name,
      this.balanceUpdatedAt,
      this.city,
      this.countryCode,
      this.cvv,
      this.expiredAt,
      this.number,
      this.postalCode,
      this.stateCode,
      this.street});

  CardModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    status = json['status'];
    event = json['event'];
    reference = json['reference'];
    createdAt = json['createdAt'];
    amount = json['amount'].toString();
    brand = json['brand'];
    user = json['user'];
    sV = json['__v'].toString();
    mapId = json['mapId'];
    maskedNumber = json['maskedNumber'];
    name = json['name'];
    balanceUpdatedAt = json['balanceUpdatedAt'];
    city = json['city'];
    countryCode = json['countryCode'];
    cvv = json['cvv'];
    expiredAt = json['expiredAt'];
    number = json['number'];
    postalCode = json['postalCode'];
    stateCode = json['stateCode'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['status'] = status;
    data['event'] = event;
    data['reference'] = reference;
    data['createdAt'] = createdAt;
    data['amount'] = amount;
    data['brand'] = brand;
    data['user'] = user;
    data['__v'] = sV;
    data['mapId'] = mapId;
    data['maskedNumber'] = maskedNumber;
    data['name'] = name;
    data['balanceUpdatedAt'] = balanceUpdatedAt;
    data['city'] = city;
    data['countryCode'] = countryCode;
    data['cvv'] = cvv;
    data['expiredAt'] = expiredAt;
    data['number'] = number;
    data['postalCode'] = postalCode;
    data['stateCode'] = stateCode;
    data['street'] = street;
    return data;
  }
}
