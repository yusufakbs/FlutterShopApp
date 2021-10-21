import 'package:flutter/material.dart';
import 'package:royu/components/build_appBar.dart';
import 'package:royu/components/custom_surfix_icon.dart';
import 'package:royu/components/default_button.dart';

import '../../../constants.dart';

class ChangePassword extends StatefulWidget {
  static String routeName = "/change_password";

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

final _formkey = GlobalKey<FormState>();

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController confirmPasswordControllerTwo = TextEditingController();
  late String password;
  // late String conform_password;
  late String confirmpass;
  late String confirmpassTwo;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: context.dynamicHeight(0.07),
                ),
                Text(
                  "Change Password",
                  style: TextStyle(
                      color: kTextColor,
                      fontStyle: FontStyle.italic,
                      fontSize: context.dynamicWidth(0.07),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.04),
                ),
                Form(
                  key: _formkey,
                  child: Container(
                    height: context.dynamicHeight(0.55),
                    width: context.dynamicWidth(0.9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: kDefaultButtonColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.06),
                            blurRadius: 4.0,
                            spreadRadius: 6.0,
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          buildPasswordFormField(),
                          SizedBox(height: context.dynamicHeight(0.02)),
                          buildConfPasswordFormField(),
                          SizedBox(height: context.dynamicHeight(0.02)),
                          buildConfPasswordFormFieldTwo(),
                          SizedBox(
                            height: context.dynamicHeight(0.06),
                          ),
                          DefaultButton(
                            text: ("Continue"),
                            press: () {
                              if (_formkey.currentState!.validate()) {
                                if (passwordController.text != "" &&
                                    passwordController.text !=
                                        confirmPasswordController.text &&
                                    passwordController.text !=
                                        confirmPasswordControllerTwo.text &&
                                    confirmPasswordController.text ==
                                        confirmPasswordControllerTwo.text) {
                                  return showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Successful"),
                                              ],
                                            ),
                                            content: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  "Your password has been\nsuccessfully updated",
                                                ),
                                              ],
                                            ),
                                            actions: <Widget>[
                                              Center(
                                                child: TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'OK'),
                                                  child: const Text('OK'),
                                                ),
                                              ),
                                            ],
                                          ));
                                }
                              }
                            },
                            width: context.dynamicWidth(0.6),
                            height: context.dynamicHeight(0.075),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildConfPasswordFormField() {
    return TextFormField(
      controller: confirmPasswordController,
      validator: (value) {
        confirmpass = value!;
        if (value.isEmpty) {
          return "Please enter confirm password";
        } else if (value.length < 8) {
          return 'password is short';
        }
      },
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          labelStyle: TextStyle(
              color: cPrimaryTextColor,
              fontSize: context.dynamicHeight(0.02),
              fontWeight: FontWeight.bold),
          labelText: "New Password",
          hintText: "Enter new password",
          suffixIcon: CustomSurffixIcon(
            icon: Icons.lock,
          )),
    );
  }

  TextFormField buildConfPasswordFormFieldTwo() {
    return TextFormField(
      controller: confirmPasswordControllerTwo,
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
          labelText: "New Password Again",
          hintText: "Re-enter your new password",
          suffixIcon: CustomSurffixIcon(
            icon: Icons.lock,
          )),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Password!';
        } else if (value.length < 8) {
          return "Password is short";
        } else if (value == confirmpass) {
          return "Eski sifreyle yeni sifre aynı olamaz";
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
}
