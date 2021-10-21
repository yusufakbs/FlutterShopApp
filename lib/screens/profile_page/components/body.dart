import 'package:flutter/material.dart';
import 'package:royu/screens/favorite/favoritePage.dart';
import 'package:royu/screens/profile_page/components/about_us.dart';
import 'package:royu/screens/profile_page/components/change_password.dart';
import 'package:royu/screens/profile_page/components/my_address.dart';
import 'package:royu/screens/profile_page/components/payment_options.dart';
import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: context.dynamicWidth(0.07),
                )),
          ],
        ),
        SizedBox(
          height: context.dynamicHeight(0.005),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: context.dynamicHeight(0.18),
              decoration: BoxDecoration(
                color: kDefaultButtonColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                children: [
                  buildListTile("username", Icon(Icons.account_box)),
                  Divider(
                    height: context.dynamicHeight(0.003),
                    thickness: 3,
                  ),
                  buildListTile("test@test.com", Icon(Icons.email)),
                ],
              )),
        ),
        SizedBox(
          height: context.dynamicHeight(0.0175),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: context.dynamicHeight(0.575),
              decoration: BoxDecoration(
                color: kDefaultButtonColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                children: [
                  buildListIconButton(Icon(Icons.favorite), "My Favorite", () {
                    Navigator.pushNamed(context, FavoritePage.routeName);
                  }),
                  Divider(
                    height: context.dynamicHeight(0.003),
                    thickness: 3,
                  ),
                  buildListIconButton(
                      Icon(Icons.shopping_cart), "Previous Orders", () {}),
                  Divider(
                    height: context.dynamicHeight(0.003),
                    thickness: 3,
                  ),
                  buildListIconButton(Icon(Icons.payment), "Payment Options",
                      () {
                    Navigator.pushNamed(context, PaymentOptionss.routeName);
                  }),
                  Divider(
                    height: context.dynamicHeight(0.003),
                    thickness: 3,
                  ),
                  buildListIconButton(Icon(Icons.business_sharp), "My Address",
                      () {
                    Navigator.pushNamed(context, MyAddress.routeName);
                  }),
                  Divider(
                    height: context.dynamicHeight(0.003),
                    thickness: 3,
                  ),
                  buildListIconButton(Icon(Icons.lock), "Change Password", () {
                    Navigator.pushNamed(context, ChangePassword.routeName);
                  }),
                  Divider(
                    height: context.dynamicHeight(0.003),
                    thickness: 3,
                  ),
                  buildListIconButton(Icon(Icons.account_balance), "About Us",
                      () {
                    Navigator.pushNamed(context, AboutUs.routeName);
                  }),
                  Divider(
                    height: context.dynamicHeight(0.003),
                    thickness: 3,
                  ),
                  buildListIconButton(Icon(Icons.logout), "Logout", () {}),
                ],
              )),
        ),
      ],
    );
  }

  Padding buildListIconButton(Icon icon, String text, var press) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: context.dynamicHeight(0.05),
        child: Row(
          children: [
            icon,
            SizedBox(
              width: context.dynamicWidth(0.1),
            ),
            Text(
              text,
              style: TextStyle(fontSize: context.dynamicHeight(0.021)),
            ),
            Spacer(),
            IconButton(
                iconSize: context.dynamicWidth(0.004),
                hoverColor: Colors.white,
                highlightColor: Colors.white,
                disabledColor: Colors.white,
                focusColor: Colors.white,
                splashColor: Colors.white,
                onPressed: press,
                icon: Icon(
                  Icons.navigate_next,
                  size: context.dynamicHeight(0.03),
                ))
          ],
        ),
      ),
    );
  }

  Padding buildListTile(String text, Icon icon) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: context.dynamicHeight(0.05),
        child: Row(
          children: [
            icon,
            SizedBox(
              width: context.dynamicWidth(0.1),
            ),
            Text(
              text,
              style: TextStyle(fontSize: context.dynamicHeight(0.025)),
            )
          ],
        ),
      ),
    );
  }
}
