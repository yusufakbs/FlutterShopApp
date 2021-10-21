import 'package:flutter/material.dart';

import 'components/body.dart';

class ProfilePage extends StatefulWidget {
  static String routeName = "/profile_page";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
