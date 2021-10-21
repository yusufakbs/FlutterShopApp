import 'package:flutter/material.dart';
import 'package:royu/components/custom_surfix_icon.dart';
import 'package:royu/components/default_button.dart';
import 'package:royu/components/no_account_text.dart';
import 'package:royu/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                height: context.dynamicHeight(0.07),
              ),
              Text(
                "Forgot Password",
                style: TextStyle(
                    fontSize: context.dynamicWidth(0.07),
                    color: kTextColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Please enter your email and we will send \nyou a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: context.dynamicHeight(0.1),
              ),
              ForgotPassForm()
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  List<String> errors = [];
  late String email;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(
              height: context.dynamicHeight(0.03),
            ),
            SizedBox(
              height: context.dynamicHeight(0.09),
            ),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formkey.currentState!.validate()) {
                  // Do what you want to do
                }
              },
              width: context.dynamicWidth(0.6),
              height: context.dynamicHeight(0.075),
            ),
            SizedBox(
              height: context.dynamicHeight(0.03),
            ),
            NoAccountText(),
          ],
        ));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Email!';
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return "Please geçrli bir mail";
        }
      },
      strutStyle: StrutStyle(
        fontSize: context.dynamicHeight(0.001),
        height: context.dynamicHeight(0.001),
      ),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelStyle: TextStyle(
              color: cPrimaryTextColor,
              fontSize: context.dynamicHeight(0.02),
              fontWeight: FontWeight.bold),
          labelText: "Email",
          hintText: "Enter your Email",
          suffixIcon: CustomSurffixIcon(icon: Icons.email)),
    );
  }
}
