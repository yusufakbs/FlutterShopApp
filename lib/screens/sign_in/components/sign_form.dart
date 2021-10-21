import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:royu/components/custom_surfix_icon.dart';

import 'package:royu/components/default_button.dart';
import 'package:royu/constants.dart';
import 'package:royu/screens/forgot_password/forgot_password_screen.dart';
import 'package:royu/screens/home_page/home_page_screen.dart';
import 'package:royu/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();

  late String username;
  late String password;
  bool remember = false;
  Future set_user_id(int? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await (prefs.setInt('user_id', value!));
  }

  login({required String user_name, user_password}) {
    Services.loginService(user_name: user_name, user_password: user_password)
        .then((value) {
      if (value.succes == true) {
        //remove kullandığın zman önceki bütün sayfaları bellekten siler pushladığın sayfa
        //ilk sayfanmış gibi olur
        //dolayısı ile geri tuşuna bnastıpın zmaan uygulamadan çıkar
        set_user_id(value.data!.userId).then((value) {
          Navigator.pushNamedAndRemoveUntil(
              context, HomePageScreen.routeName, (route) => false);
        });
      } else if (value.succes == false) {
        Fluttertoast.showToast(
            msg: value.msg.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red[100],
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: 'Giriş başarısız.\nBağlantınızı kontrol ediniz',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red[100],
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }

  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
              width: context.dynamicWidth(0.9),
              child: buildUsernameFormField()),
          SizedBox(
            height: context.dynamicHeight(0.03),
          ),
          SizedBox(
              width: context.dynamicWidth(0.9),
              child: buildPasswordFormField()),
          SizedBox(
            height: context.dynamicHeight(0.01),
          ),
          Row(
            children: [
              Checkbox(
                  checkColor: cPrimaryTextColor,
                  value: remember,
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  }),
              Text("Remember me",
                  style: TextStyle(
                      color: cPrimaryTextColor,
                      fontSize: context.dynamicHeight(0.020),
                      fontWeight: FontWeight.bold)),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: cPrimaryTextColor,
                        fontSize: context.dynamicHeight(0.020),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: context.dynamicHeight(0.01),
          ),
          DefaultButton(
            text: "Login",
            press: () {
              if (_formKey.currentState!.validate()) {
                // iff all are valid then go to succes screen

                login(user_name: username, user_password: password);
              }
            },
            width: context.dynamicWidth(0.6),
            height: context.dynamicHeight(0.075),
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Password!';
        } else if (value.length < 3) {
          return "Password is short";
        } else if (value.isNotEmpty && value.length >= 8) {
          return null;
        }
      },
      onChanged: (value) {
        password = value;
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

  TextFormField buildUsernameFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Username!';
        }
      },
      onChanged: (value) {
        username = value;
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

// class FormError extends StatelessWidget {
//   const FormError({
//     Key? key,
//     required this.errors,
//   }) : super(key: key);

//   final List<String> errors;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         children: List.generate(
//             errors.length, (index) => formErrorText(error: errors[index])));
//   }

//   Row formErrorText({required String error}) {
//     return Row(
//       children: [
//         Icon(
//           Icons.error_outline_outlined,
//           color: cPrimaryTextColor,
//         ),
//         Text(
//           error,
//           style:
//               TextStyle(color: cPrimaryTextColor, fontWeight: FontWeight.bold),
//         )
//       ],
//     );
//   }
// }
