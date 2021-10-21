import 'package:flutter/material.dart';
import 'package:royu/constants.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          context.dynamicPaddingLeft(15),
          context.dynamicPaddingTop(15),
          context.dynamicPaddingRight(15),
          context.dynamicPaddingBottom(15)),
      child: Icon(
        icon,
        color: cPrimaryTextColor,
        size: context.dynamicHeight(0.025),
      ),
    );
  }
}
