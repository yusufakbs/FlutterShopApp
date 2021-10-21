import 'package:flutter/material.dart';
import 'package:royu/constants.dart';

import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(
              color: cPrimaryTextColor, fontSize: context.dynamicHeight(0.03)),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Body()),
    );
  }
}
