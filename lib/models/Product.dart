// To parse this JSON data, do
//
//     final prodacts = prodactsFromJson(jsonString);

import 'dart:convert';

Prodacts prodactsFromJson(String str) => Prodacts.fromJson(json.decode(str));

String prodactsToJson(Prodacts data) => json.encode(data.toJson());

class Prodacts {
    Prodacts({
        this.succes,
        this.data,
        this.msg,
    });

    bool ?succes;
    List<Datum>? data;
    String ?msg;

    factory Prodacts.fromJson(Map<String, dynamic> json) => Prodacts(
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
        this.categoryId,
        this.productName,
        this.image,
        this.price,
        this.color,
        this.fabricType,
        this.lenght,
        this.width,
        this.other,
        this.season,
        this.warrantyPeriod,
    });

    int ?id;
    int ?productId;
    int ?categoryId;
    String? productName;
    String ?image;
    int? price;
    String ?color;
    String? fabricType;
    double? lenght;
    double ?width;
    String? other;
    String ?season;
    String ?warrantyPeriod;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        productId: json["productId"],
        categoryId: json["categoryId"],
        productName: json["productName"],
        image: json["image"],
        price: json["price"],
        color: json["color"],
        fabricType: json["fabricType"],
        lenght: json["lenght"].toDouble(),
        width: json["width"].toDouble(),
        other: json["other"],
        season: json["season"],
        warrantyPeriod: json["warrantyPeriod"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "categoryId": categoryId,
        "productName": productName,
        "image": image,
        "price": price,
        "color": color,
        "fabricType": fabricType,
        "lenght": lenght,
        "width": width,
        "other": other,
        "season": season,
        "warrantyPeriod": warrantyPeriod,
    };
}
