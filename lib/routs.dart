import 'package:flutter/material.dart';
import 'package:royu/screens/cart/cart_page.dart';
import 'package:royu/screens/cart/components/payPageAddress.dart';
import 'package:royu/screens/complete_profile/complate_profile_screen.dart';
import 'package:royu/screens/forgot_password/forgot_password_screen.dart';
import 'package:royu/screens/home_page/home_page_screen.dart';
import 'package:royu/screens/profile_page/components/about_us.dart';
import 'package:royu/screens/profile_page/components/change_password.dart';
import 'package:royu/screens/profile_page/components/my_address.dart';
import 'package:royu/screens/profile_page/components/payment_options.dart';
import 'package:royu/screens/profile_page/profile_page_screen.dart';

import 'package:royu/screens/sign_in/sign_in_screen.dart';
import 'package:royu/screens/sign_up/sign_up_screen.dart';
import 'package:royu/screens/splash/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ComplateProfileScreen.routeName: (context) => ComplateProfileScreen(),
  HomePageScreen.routeName: (context) => HomePageScreen(),
  ProfilePage.routeName: (context) => ProfilePage(),
  CartPage.routeName: (context) => CartPage(),
  AboutUs.routeName: (context) => AboutUs(),
  ChangePassword.routeName: (context) => ChangePassword(),
  PaymentOptionss.routeName: (context) => PaymentOptionss(),
  MyAddress.routeName: (context) => MyAddress(),
  PayAddressPage.routeName: (context) => PayAddressPage(),
};
