import 'package:flutter/material.dart';
import 'package:royu/components/custom_surfix_icon.dart';
import 'package:royu/components/default_button.dart';
import 'package:royu/screens/complete_profile/complate_profile_screen.dart';

import '../../../constants.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  late String name;
  late String username;
  late String email;
  late String password;
  // late String conform_password;
  late String confirmpass;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: context.dynamicHeight(0.02),
            ),
            buildUsernameFormField(),
            SizedBox(
              height: context.dynamicHeight(0.02),
            ),
            buildEmailFormField(),
            SizedBox(
              height: context.dynamicHeight(0.02),
            ),
            buildPasswordFormField(),
            SizedBox(
              height: context.dynamicHeight(0.02),
            ),
            buildConfPasswordFormField(),
            SizedBox(
              height: context.dynamicHeight(0.02),
            ),
            SizedBox(
              height: context.dynamicHeight(0.02),
            ),
            DefaultButton(
              text: ("Continue"),
              press: () {
                if (_formkey.currentState!.validate()) {
                  Navigator.pushNamed(context, ComplateProfileScreen.routeName);
                }
                // Profile created successfully page will open and redirect to login
              },
              width: context.dynamicWidth(0.6),
              height: context.dynamicHeight(0.075),
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Email!';
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return "Please geçrli bir mail";
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelStyle: TextStyle(
              color: cPrimaryTextColor,
              fontSize: context.dynamicHeight(0.02),
              fontWeight: FontWeight.bold),
          labelText: "Email",
          hintText: "Enter your email",
          suffixIcon: CustomSurffixIcon(
            icon: Icons.mail,
          )),
    );
  }

  TextFormField buildConfPasswordFormField() {
    return TextFormField(
      controller: confirmPasswordController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter confirm password";
        } else if (value.length < 8) {
          return 'password is short';
        } else if (value != confirmpass) {
          return "Password must be same as above";
        }
      },
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          labelStyle: TextStyle(
              color: cPrimaryTextColor,
              fontSize: context.dynamicHeight(0.02),
              fontWeight: FontWeight.bold),
          labelText: "Confirm Password",
          hintText: "Re-enter your password",
          suffixIcon: CustomSurffixIcon(
            icon: Icons.lock,
          )),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      validator: (value) {
        confirmpass = value!;
        if (value.isEmpty) {
          return 'Please Enter Password!';
        } else if (value.length < 8) {
          return "Password is short";
        }
      },
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          labelStyle: TextStyle(
              color: cPrimaryTextColor,
              fontSize: context.dynamicHeight(0.02),
              fontWeight: FontWeight.bold),
          labelText: "Password",
          hintText: "Enter your password",
          suffixIcon: CustomSurffixIcon(
            icon: Icons.lock,
          )),
    );
  }

  //
  TextFormField buildUsernameFormField() {
    return TextFormField(
      controller: usernameController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Username!';
        }
      },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          labelStyle: TextStyle(
              color: cPrimaryTextColor,
              fontSize: context.dynamicHeight(0.02),
              fontWeight: FontWeight.bold),
          labelText: "Username",
          hintText: "Enter your username",
          suffixIcon: CustomSurffixIcon(icon: Icons.account_box)),
    );
  }
}
