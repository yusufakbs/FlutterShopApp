 import 'package:flutter/material.dart';

import '../constants.dart';

AppBar buildAppBar(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: Text(
          "RoYuu",
          style: TextStyle(
              color: cPrimaryTextColor,
              fontSize: context.dynamicWidth(0.06),
              fontWeight: FontWeight.bold),
        ),
      );
  }
