import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Register Account",
                style: TextStyle(
                    color: cPrimaryTextColor,
                    fontSize: context.dynamicHeight(0.04),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Complate your details.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: context.dynamicHeight(0.02),
                ),
              ),
              SignUpForm(),
              
            ],
          ),
        ),
      ),
    );
  }
}
