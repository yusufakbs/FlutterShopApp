import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Forgot Password",
          style: TextStyle(
              color: cPrimaryTextColor, fontSize: context.dynamicHeight(0.03)),
        ),
      ),
      body: Body(),
    );
  }
}
