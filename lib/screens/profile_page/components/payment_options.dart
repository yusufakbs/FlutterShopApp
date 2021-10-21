import 'package:flutter/material.dart';
import 'package:royu/components/build_appBar.dart';
import 'package:royu/components/custom_surfix_icon.dart';
import 'package:royu/components/default_button.dart';

import '../../../constants.dart';

class PaymentOptionss extends StatefulWidget {
  static String routeName = "/payment_options";

  @override
  _PaymentOptionsState createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptionss> {
  TextEditingController cardHoldersNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController exprirationDateController = TextEditingController();
  TextEditingController cvcContorller = TextEditingController();
  TextEditingController cardNameController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text(
                  "Payment Options",
                  style: TextStyle(
                      color: kTextColor,
                      fontStyle: FontStyle.italic,
                      fontSize: context.dynamicWidth(0.07),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.01),
                ),
                Form(
                    key: _formKey,
                    child: Container(
                      height: context.dynamicHeight(0.75),
                      width: context.dynamicWidth(0.875),
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
                            SizedBox(
                              height: context.dynamicHeight(0.02),
                            ),
                            Text(
                              "Register Cards : ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  fontSize: context.dynamicWidth(0.06),
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: context.dynamicHeight(0.02),
                            ),
                            buildCardHoldersField(),
                            buildCardNumberField(),
                            Row(
                              children: [
                                Container(
                                    height: context.dynamicHeight(0.1),
                                    width: context.dynamicWidth(0.5),
                                    child: buildCardDayYearField()),
                                Spacer(),
                                Container(
                                    height: context.dynamicHeight(0.1),
                                    width: context.dynamicWidth(0.3),
                                    child: buildCardCvcField()),
                              ],
                            ),
                            buildSaveCardName(),
                            SizedBox(
                              height: context.dynamicHeight(0.05),
                            ),
                            Container(
                                height: context.dynamicHeight(0.07),
                                width: context.dynamicWidth(0.5),
                                child: DefaultButton(
                                    text: "Save Card",
                                    press: () {
                                      if (_formKey.currentState!.validate()) {
                                        print("it's not empty");
                                      }
                                    },
                                    width: context.dynamicWidth(0.4),
                                    height: context.dynamicHeight(0.07))),
                            SizedBox(
                              height: context.dynamicHeight(0.035),
                            ),
                            DefaultButton(
                                text: "Registered Cards",
                                press: () {
                                  if (_formKey.currentState!.validate()) {}
                                },
                                width: context.dynamicWidth(0.4),
                                height: context.dynamicHeight(0.07))
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildCardHoldersField() {
    return TextFormField(
      controller: cardHoldersNameController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter holders name";
        }
      },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelStyle: TextStyle(
              color: cPrimaryTextColor,
              fontSize: context.dynamicHeight(0.02),
              fontWeight: FontWeight.bold),
          labelText: "CARD HOLDERS NAME",
          hintText: "Enter your card holders name",
          suffixIcon: CustomSurffixIcon(icon: Icons.account_box)),
    );
  }

  TextFormField buildCardNumberField() {
    return TextFormField(
      controller: cardNumberController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter your card number";
          // BURAYA BAKMAN LAZIMM !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'!!!!!!!!!!!
        } else if (value.length != 19) {
          return "Please enter your card number completely";
        }
      },
      inputFormatters: [cardNumberFormatter],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelStyle: TextStyle(
              color: cPrimaryTextColor,
              fontSize: context.dynamicHeight(0.02),
              fontWeight: FontWeight.bold),
          labelText: "CARD NUMBER",
          hintText: "0000 0000 0000 0000",
          suffixIcon: CustomSurffixIcon(icon: Icons.payment)),
    );
  }

  TextFormField buildCardCvcField() {
    return TextFormField(
      controller: cvcContorller,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter the CVC";
        } else if (value.length != 3) {
          return "Enter completely";
        }
      },
      inputFormatters: [cvcController],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelStyle: TextStyle(
              color: cPrimaryTextColor,
              fontSize: context.dynamicHeight(0.02),
              fontWeight: FontWeight.bold),
          labelText: "CVC",
          hintText: "CVC",
          suffixIcon: CustomSurffixIcon(icon: Icons.payments_outlined)),
    );
  }

  TextFormField buildCardDayYearField() {
    return TextFormField(
      controller: exprirationDateController,
      validator: (value) {
        if (value!.isEmpty) {
          return " ";
        } else if (value.length != 5) {
          return "";
        }
      },
      inputFormatters: [exprirationDate],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelStyle: TextStyle(
              color: cPrimaryTextColor,
              fontSize: context.dynamicHeight(0.02),
              fontWeight: FontWeight.bold),
          labelText: "EXPRIRATION DATE",
          hintText: "00/00",
          suffixIcon: CustomSurffixIcon(icon: Icons.date_range)),
    );
  }

  TextFormField buildSaveCardName() {
    return TextFormField(
      controller: cardNameController,
      validator: (value) {
        if (value!.isEmpty) {
          return "";
        }
      },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelStyle: TextStyle(
              color: cPrimaryTextColor,
              fontSize: context.dynamicHeight(0.02),
              fontWeight: FontWeight.bold),
          labelText: "Card Name",
          hintText: "Enter your card name",
          suffixIcon: CustomSurffixIcon(icon: Icons.account_box)),
    );
  }
}
