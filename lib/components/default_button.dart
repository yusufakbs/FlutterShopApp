import 'package:flutter/material.dart';

import '../constants.dart';

// ignore: must_be_immutable
class DefaultButton extends StatelessWidget {
  Function press;
  final String text;
  final double width;
  final double height;

  DefaultButton({
    required this.text,
    required this.press,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: kDefaultButtonColor,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: kTextColor, fontSize: context.dynamicWidth(0.04)),
            ),
          ),
          enableFeedback: false,
          elevation: 20,
          minWidth: double.maxFinite,
          height: 40,
          onPressed: () {
            press();
          },
        ));
  }
}





// class DefaultButton extends StatelessWidget {
//   const DefaultButton({
//     Key? key,
//     required this.text,
//     required this.press,
//   }) : super(key: key);
//   final String text;
//   final Function press;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: MaterialButton(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         enableFeedback: false,
//         elevation: 0,
//         height: context.dynamicHeight(0.08),
//         onPressed: press,
//         color: kPrimaryColor,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               text,
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold),
//             ),
//             Icon(Icons.arrow_forward_ios)
//           ],
//         ),
//         textColor: Colors.white,
//       ),
//     );
//   }
// }



