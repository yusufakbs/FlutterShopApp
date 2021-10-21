import 'package:flutter/material.dart';
import 'package:royu/constants.dart';
import 'package:royu/screens/cart/cart_page.dart';
import 'package:royu/screens/favorite/favoritePage.dart';
import 'package:royu/screens/profile_page/profile_page_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/categori.dart';

class HomePageScreen extends StatefulWidget {
  static String routeName = "/home_page";
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late List contents;
  int activeContents = 0;
  int? user_id;
  void get_user_id(int? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user_id=await (prefs.getInt('user_id'));
  }

  void initState() {
    super.initState();
    contents = [Categori(), CartPage(), FavoritePage(), ProfilePage()];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "RoYuu",
            style: TextStyle(
                color: cPrimaryTextColor,
                fontSize: context.dynamicWidth(0.06),
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: contents[activeContents],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: activeContents,
          selectedItemColor: Colors.red[400],
          unselectedItemColor: Colors.grey[600],
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: "",
            ),
          ],
          onTap: (int clickedbuttonposition) {
            setState(() {
              activeContents = clickedbuttonposition;
            });
          },
        ),
      ),
    );
  }
}
