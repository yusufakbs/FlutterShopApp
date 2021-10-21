// To parse this JSON data, do
//
//     final userFavorite = userFavoriteFromJson(jsonString);

import 'dart:convert';

UserFavorite userFavoriteFromJson(String str) =>
    UserFavorite.fromJson(json.decode(str));

String userFavoriteToJson(UserFavorite data) => json.encode(data.toJson());

class UserFavorite {
  UserFavorite({
    this.succes,
    this.data,
    this.msg,
  });

  bool? succes;
  List<Datum>? data;
  String? msg;

  factory UserFavorite.fromJson(Map<String, dynamic> json) => UserFavorite(
        succes: json["succes"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "succes": succes,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "msg": msg,
      };
}

class Datum {
  Datum({
    this.id,
    this.productId,
    this.userId,
  });

  int? id;
  int? productId;
  int? userId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        productId: json["product_id"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "user_id": userId,
      };
}
