import 'package:flutter/material.dart';

import 'components/body.dart';

class ComplateProfileScreen extends StatelessWidget {
  static String routeName = "/complate_profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign Up"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(child: Body()),
      ),
    );
  }
}
