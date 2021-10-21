import 'package:flutter/material.dart';
import 'package:royu/components/build_appBar.dart';

import '../../../constants.dart';

class AboutUs extends StatefulWidget {
  static String routeName = "/about_us";

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "About Us",
                  style: TextStyle(
                      color: kTextColor,
                      fontStyle: FontStyle.italic,
                      fontSize: context.dynamicWidth(0.07),
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Container(
              width: context.dynamicWidth(0.9),
              height: context.dynamicHeight(0.72),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: kDefaultButtonColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.05),
                      blurRadius: 4.0,
                      spreadRadius: 6.0,
                    )
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "We Are a big and sincere family that takes its energy from the smiles of its customers.We do our job with passion and with great energy and exicitement to every product package, make them smile and make them smile. In this way, every order becomes the beginning of an exciting service for us.",
                      style: TextStyle(
                          color: kTextColor,
                          fontStyle: FontStyle.italic,
                          fontSize: context.dynamicWidth(0.07),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: context.dynamicHeight(0.1),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("RoYuu Family",
                            style: TextStyle(
                                color: kTextColor,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Raleway',
                                fontSize: context.dynamicWidth(0.06),
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
