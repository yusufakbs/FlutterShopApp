import 'package:flutter/material.dart';
import 'package:royu/components/no_account_text.dart';

import 'package:royu/screens/sign_in/components/sign_form.dart';
import 'package:royu/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: context.dynamicHeight(0.05),
                ),
                Image.asset(
                  'assets/images/login.png',
                  height: context.dynamicHeight(0.2),
                  width: context.dynamicWidth(0.7),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.02),
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: cPrimaryTextColor,
                      fontSize: context.dynamicHeight(0.04),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sign in with your email and password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: cPrimaryTextColor,
                      fontSize: context.dynamicHeight(0.019),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.02),
                ),
                //-------------------------------------------------------------
                SignForm(),
                //-------------------------------------------------------------
                Column(children: <Widget>[
                  Row(children: <Widget>[
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Divider(
                            color: cPrimaryTextColor,
                            height: context.dynamicHeight(0.1),
                          )),
                    ),
                    SizedBox(
                      height: context.dynamicHeight(0.1),
                    ),
                    Text(
                      "OR",
                      style: TextStyle(
                          color: cPrimaryTextColor,
                          fontSize: context.dynamicHeight(0.02)),
                    ),
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Divider(
                            color: cPrimaryTextColor,
                            height: context.dynamicHeight(0.1),
                          )),
                    ),
                  ]),
                  NoAccountText()
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
