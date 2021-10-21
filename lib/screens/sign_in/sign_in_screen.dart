import 'package:flutter/material.dart';
import 'package:royu/screens/sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Body()),
    );
  }
}
