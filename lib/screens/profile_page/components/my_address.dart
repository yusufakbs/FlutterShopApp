import 'package:flutter/material.dart';
import 'package:royu/components/build_appBar.dart';
import 'package:royu/components/custom_surfix_icon.dart';
import 'package:royu/components/default_button.dart';

import '../../../constants.dart';

class MyAddress extends StatefulWidget {
  static String routeName = "/my_address";

  @override
  _MyAddressState createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  TextEditingController addressDescriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController buildingNoController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController flatController = TextEditingController();
  TextEditingController directionsController = TextEditingController();
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
                  "Register Adress",
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
                      height: context.dynamicHeight(0.8),
                      width: context.dynamicWidth(0.95),
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
                              "Register Address : ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  fontSize: context.dynamicWidth(0.06),
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: context.dynamicHeight(0.02),
                            ),
                            buildAddressDescription(),
                            buildAddressField(),
                            Row(
                              children: [
                                Container(
                                    height: context.dynamicHeight(0.1),
                                    width: context.dynamicWidth(0.35),
                                    child: buildBuildingNoField()),
                                SizedBox(
                                  width: context.dynamicWidth(0.02),
                                ),
                                Container(
                                    height: context.dynamicHeight(0.1),
                                    width: context.dynamicWidth(0.24),
                                    child: buildFloorField()),
                                SizedBox(
                                  width: context.dynamicWidth(0.042),
                                ),
                                Container(
                                    height: context.dynamicHeight(0.1),
                                    width: context.dynamicWidth(0.24),
                                    child: buildFlatField()),
                              ],
                            ),
                            buildDirectionsField(),
                            SizedBox(
                              height: context.dynamicHeight(0.05),
                            ),
                            Container(
                                child: DefaultButton(
                                    text: "Save Address",
                                    press: () {
                                      if (_formKey.currentState!.validate()) {
                                        print("it's not empty");
                                      }
                                    },
                                    width: context.dynamicWidth(0.67),
                                    height: context.dynamicHeight(0.07))),
                            SizedBox(
                              height: context.dynamicHeight(0.035),
                            ),
                            DefaultButton(
                                text: "Registered Address",
                                press: () {
                                  if (_formKey.currentState!.validate()) {}
                                },
                                width: context.dynamicWidth(0.5),
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

  TextFormField buildAddressDescription() {
    return TextFormField(
      controller: addressDescriptionController,
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
          labelText: "Address Description",
          hintText: "Enter your address description",
          suffixIcon: CustomSurffixIcon(icon: Icons.account_box)),
    );
  }

  TextFormField buildAddressField() {
    return TextFormField(
      controller: addressController,
      validator: (value) {
        if (value!.isEmpty) {
          return "";
          // BURAYA BAKMAN LAZIMM !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'!!!!!!!!!!!
        }
      },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelStyle: TextStyle(
              color: cPrimaryTextColor,
              fontSize: context.dynamicHeight(0.02),
              fontWeight: FontWeight.bold),
          labelText: "Address",
          hintText: "Enter your address description",
          suffixIcon: CustomSurffixIcon(icon: Icons.payment)),
    );
  }

  TextFormField buildFlatField() {
    return TextFormField(
      controller: flatController,
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
          labelText: "Flat",
          hintText: "Flat",
          suffixIcon: CustomSurffixIcon(icon: Icons.payments_outlined)),
    );
  }

  TextFormField buildFloorField() {
    return TextFormField(
      controller: floorController,
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
          labelText: "Floor",
          hintText: "Floor",
          suffixIcon: CustomSurffixIcon(icon: Icons.payments_outlined)),
    );
  }

  TextFormField buildBuildingNoField() {
    return TextFormField(
      controller: buildingNoController,
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
          labelText: "Building No",
          hintText: "Building no",
          suffixIcon: CustomSurffixIcon(icon: Icons.date_range)),
    );
  }

  TextFormField buildDirectionsField() {
    return TextFormField(
      controller: directionsController,
      validator: (value) {
        if (value!.isEmpty) {
          return "";
        }
      },
      decoration: InputDecoration(
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelStyle: TextStyle(
              color: cPrimaryTextColor,
              fontSize: context.dynamicHeight(0.02),
              fontWeight: FontWeight.bold),
          labelText: "Directions",
          hintText: "Enter your directions",
          suffixIcon: CustomSurffixIcon(icon: Icons.account_box)),
    );
  }
}
