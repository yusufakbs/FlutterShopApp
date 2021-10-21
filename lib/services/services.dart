import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:royu/models/Product.dart';
import 'package:royu/models/model_user_favorite.dart';
import 'package:royu/models/model_user_login.dart';

class Services {
  //login service
  static Future<UserLogin> loginService(
      {required String user_name, required String user_password}) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.108:443/login'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {'username': user_name, 'password': user_password},
    );
    if (response.statusCode == 200) {
      debugPrint('userlogin services status  200');
      UserLogin userLogin = new UserLogin();
      try {
        userLogin = userLoginFromJson(response.body);
      } catch (e) {
        print(response.body);
        print('login func Hata: $e');
      }
      return userLogin;
    } else {
      debugPrint('userlogin services status not 200');
      return UserLogin();
    }
  }

  ///get userfavorites
  static Future<UserFavorite> getFavorites({required String user_id}) async {
    debugPrint('getfavorites service');

    final response = await http.post(
      Uri.parse('http://192.168.1.108:443/getFavorite'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        'userId': user_id,
      },
    );
    if (response.statusCode == 200) {
      UserFavorite userFavorite = new UserFavorite();

      debugPrint('getfavorites services status  200');
      try {
        userFavorite = userFavoriteFromJson(response.body);
        print(response.body);
      } catch (e) {
        print(response.body);
        print('getfavorites func Hata: $e');
      }
      return userFavorite;
    } else {
      debugPrint('getfavorites services status not 200');
      return UserFavorite();
    }
  }

  //getproducts
  static Future<Prodacts> getProdacts({required int productid}) async {
    Prodacts prodacts = new Prodacts();

    final response = await http.post(
      Uri.parse('http://192.168.1.108:443/getProduct'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        'productId': productid,
      },
    );
    if (response.statusCode == 200) {
      debugPrint('product services status  200');
      try {
        prodacts = prodactsFromJson(response.body);
      } catch (e) {
        print(response.body);
        print('product func Hata: $e');
      }
      return prodacts;
    } else {
      debugPrint('product services status not 200');
      return prodacts;
    }
  }
}
