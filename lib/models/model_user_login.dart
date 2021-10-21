// To parse this JSON data, do
//
//     final userLogin = userLoginFromJson(jsonString);

import 'dart:convert';

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str));

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {
  UserLogin({
    this.succes,
    this.data,
    this.msg,
  });

  bool? succes;
  Data? data;
  String? msg;

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        succes: json["succes"],
        data: Data.fromJson(json["data"]),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "succes": succes,
        "data": data!.toJson(),
        "msg": msg,
      };
}

class Data {
  Data({
     this.userId,
  });

  int ? userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
      };
}
