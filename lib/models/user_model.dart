class UserModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? country;
  String? city;
  String? photo;
  List<String>? idImages;
  String? role;
  bool? isOtpValid;
  bool? isNumberVerified;
  bool? isEmailVerified;
  bool? isPersonVerified;
  bool? isProfileVerified;
  String? otpCode;
  String? otpCodeExpires;
  String? address;
  String? birthday;
  String? idPaper;
  String? idNumber;
  String? income;
  String? job;
  String? sex;
  String? password;
  String? currentBalance;
  String? lastTransaction;
  String? sponsorshipBalance;
  String? sponsorshipCode;
  String? passwordConfirm;
  String? oldPassword;
  String? token;
  String? notifToken;
  String? deviceType;
  bool? hasAlreadyCreatedCard;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.country,
    this.city,
    this.photo,
    this.idImages,
    this.role,
    this.isOtpValid,
    this.isNumberVerified,
    this.isEmailVerified,
    this.isPersonVerified,
    this.isProfileVerified,
    this.otpCode,
    this.otpCodeExpires,
    this.address,
    this.birthday,
    this.idPaper,
    this.idNumber,
    this.income,
    this.job,
    this.sex,
    this.currentBalance,
    this.lastTransaction,
    this.sponsorshipBalance,
    this.sponsorshipCode,
    this.oldPassword,
    this.password,
    this.passwordConfirm,
    this.token,
    this.notifToken,
    this.deviceType,
    this.hasAlreadyCreatedCard,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    country = json['pays'];
    city = json['city'];
    photo = json['photo'];
    idImages = json['idImages'].cast<String>();
    role = json['role'];
    isOtpValid = json['isOtpValid'];
    isNumberVerified = json['isNumberVerified'];
    isEmailVerified = json['isEmailVerified'];
    isPersonVerified = json['isPersonVerified'];
    isProfileVerified = json['isProfileVerified'];
    otpCode = json['otpCode'];
    otpCodeExpires = json['otpCodeExpires'];
    address = json['address'];
    birthday = json['birthday'];
    idPaper = json['idPaper'];
    idNumber = json['idNumber'];
    income = json['income'];
    job = json['job'];
    sex = json['sex'];
    currentBalance = json['soldeCourant'].toString();
    sponsorshipBalance = json['soldeParrainage'].toString();
    sponsorshipCode = json['codeParrainage'];
    oldPassword = json['passwordCurrent'];
    password = json['password'];
    passwordConfirm = json['passwordConfirm'];
    token = json['token'];
    notifToken = json['notifToken'];
    deviceType = json['deviceType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['pays'] = country;
    data['city'] = city;
    data['photo'] = photo;
    data['idImages'] = idImages;
    data['role'] = role;
    data['isOtpValid'] = isOtpValid;
    data['isNumberVerified'] = isNumberVerified;
    data['isEmailVerified'] = isEmailVerified;
    data['isPersonVerified'] = isPersonVerified;
    data['isProfileVerified'] = isProfileVerified;
    data['otpCode'] = otpCode;
    data['otpCodeExpires'] = otpCodeExpires;
    data['address'] = address;
    data['birthday'] = birthday; //yyyy-MM-dd
    data['idPaper'] = idPaper;
    data['idNumber'] = idNumber;
    data['income'] = income;
    data['job'] = job;
    data['sex'] = sex;
    data['soldeCourant'] = currentBalance;
    data['soldeParrainage'] = sponsorshipBalance;
    data['codeParrainage'] = sponsorshipCode;
    data['password'] = password;
    data['passwordConfirm'] = passwordConfirm;
    data['token'] = token;
    data['notifToken'] = notifToken;
    data['deviceType'] = deviceType;
    return data;
  }
}
