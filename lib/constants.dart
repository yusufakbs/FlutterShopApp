import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

const kPrimaryColor = Color(0xFFCB997E);
const kPrimaryLightColor = Color(0xFF00000000);
const kDefaultButtonColor = Color(0xFFE5E5E5);
const cPrimaryTextColor = Color(0xFF696969);

const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);

const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

extension ContextExtension on BuildContext {
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;

  double dynamicPaddingLeft(double val) =>
      MediaQuery.of(this).padding.left * val;
  double dynamicPaddingRight(double val) =>
      MediaQuery.of(this).padding.right * val;
  double dynamicPaddingTop(double val) => MediaQuery.of(this).padding.top * val;
  double dynamicPaddingBottom(double val) =>
      MediaQuery.of(this).padding.bottom * val;
}

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp userNameValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]");
const String kEmailNullError = "Please Enter your Email";
const String kUsernameNullError = "Please Enter your username";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kInvalidUsernameError = "Please Enter Valid Username";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

// Payment From

var cardNumberFormatter = new MaskTextInputFormatter(
    mask: '#### #### #### ####', filter: {"#": RegExp(r'[0-9]')});
var exprirationDate =
    new MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});
var cvcController =
    new MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')});










// emailValidatorRegExp 
// else if (!emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError)) return null;