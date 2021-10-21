import 'package:flutter/material.dart';
import 'package:royu/models/model_user_favorite.dart';
import 'package:royu/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import 'components/body.dart';

class FavoritePage extends StatefulWidget {
  static String routeName = "/cart_page";

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<UserFavorite> userfavorites = [];
  late String userid = '';
  Future<String> get_user_id() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? a = (prefs.getInt('user_id')).toString();
    userid = a;
    print('userid: $a');
    return a;
  }

  UserFavorite userFavorite = new UserFavorite();
  Future<UserFavorite> getfavorites() async {
    UserFavorite userFavorite = new UserFavorite();
    print('istek atma fonk');
    return Services.getFavorites(user_id: userid);
  }

  @override
  void initState() {
    get_user_id();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CART",
          style: TextStyle(
            fontSize: context.dynamicWidth(0.07),
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        future: get_user_id(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder(
                future: getfavorites(),
                // ignore: non_constant_identifier_names
                builder: (BuildContext context,
                    AsyncSnapshot<UserFavorite> snapshot) {
                  if (snapshot.data != null) {
                    print('snapshot.data!.succes');
                    print(snapshot.data!.succes);
                    if (snapshot.data!.succes == false) {
                      return Center(
                        child: Text('Favoriniz bulunmamaktadır'),
                      );
                    } else {
                      return Body();
                    }
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                });
          } else {
            return Text('data yok');
          }
        },
      ),
    );
  }
}
