import 'package:flutter/material.dart';
import 'package:royu/components/default_button.dart';
import 'package:royu/screens/cart/components/payPageAddress.dart';
import '../../../constants.dart';
import 'components/body.dart';

class CartPage extends StatefulWidget {
  static String routeName = "/cart_page";

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
      body: Stack(
        children: [
          Container(height: context.dynamicHeight(0.67), child: Body()),
          cartBottomBar(context),
        ],
      ),
    );
  }

  Align cartBottomBar(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(15)),
        height: context.dynamicHeight(0.08),
        width: context.dynamicWidth(1),
        child: Row(
          children: [
            Spacer(),
            Text(
              "Total: 45£",
              style: TextStyle(
                  fontSize: context.dynamicWidth(0.075),
                  fontWeight: FontWeight.bold,
                  color: kDefaultButtonColor),
            ),
            Spacer(),
            DefaultButton(
                text: "Confirm Cart",
                press: () {
                  Navigator.pushNamed(context, PayAddressPage.routeName);
                },
                width: context.dynamicWidth(0.4),
                height: context.dynamicHeight(0.07)),
            SizedBox(
              width: context.dynamicWidth(0.02),
            )
          ],
        ),
      ),
    );
  }
}
