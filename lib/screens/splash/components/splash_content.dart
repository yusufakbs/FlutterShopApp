import 'package:flutter/material.dart';

import '../../../constants.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.loginImage,
    required this.loginImageHeight,
    required this.loginImageWidth,
    required this.text,
    required this.brandName,
  }) : super(key: key);

  final String? loginImage, text;
  final double loginImageHeight;
  final double loginImageWidth;
  final String brandName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          brandName,
          style: TextStyle(
              fontSize: context.dynamicHeight(0.07),
              color: Colors.black54,
              fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kDefaultButtonColor,
              fontSize: context.dynamicHeight(0.03),
              fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              loginImage!,
              height: context.dynamicHeight(loginImageHeight),
              width: context.dynamicWidth(loginImageWidth),
            ),
          ],
        ),
      ],
    );
  }
}
