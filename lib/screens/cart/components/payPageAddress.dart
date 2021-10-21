import 'package:flutter/material.dart';
import 'package:royu/components/build_appBar.dart';
import 'package:royu/components/custom_surfix_icon.dart';
import 'package:royu/screens/home_page/home_page_screen.dart';

import '../../../constants.dart';

class PayAddressPage extends StatefulWidget {
  static String routeName = "/payment_options";

  @override
  _PayAddressPageState createState() => _PayAddressPageState();
}

class _PayAddressPageState extends State<PayAddressPage> {
  TextEditingController cardHoldersNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController exprirationDateController = TextEditingController();
  TextEditingController cvcContorller = TextEditingController();
  TextEditingController cardNameController = TextEditingController();
  TextEditingController addressDescriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController buildingNoController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController flatController = TextEditingController();
  TextEditingController directionsController = TextEditingController();
  String dropdownValueCard = 'ING';
  String dropdownValueAddress = 'Ev Adresi';
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton.extended(
        backgroundColor: kPrimaryColor,
        icon: new Icon(Icons.shopping_cart),
        label: new Text('Confirm'),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Your order has been received"),
                          ],
                        ),
                      ),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Estimated delivery time is 5 \nbusiness days.Happy shopping",
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, HomePageScreen.routeName);
                            },
                            child: const Text(
                              'CLOSE',
                              style: TextStyle(color: kPrimaryColor),
                            ),
                          ),
                        ),
                      ],
                    ));
          } else {
            print("error");
          }
        },
        shape: new BeveledRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0)),
      ),
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text(
                  "Confirm Cart",
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
                      height: context.dynamicHeight(0.955),
                      width: context.dynamicWidth(0.955),
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
                            SizedBox(
                              height: context.dynamicHeight(0.02),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Registered Card",
                                  style: TextStyle(
                                      color: cPrimaryTextColor,
                                      fontSize: context.dynamicHeight(0.025),
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                DropdownButton<String>(
                                  value: dropdownValueCard,
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(
                                    color: cPrimaryTextColor,
                                  ),
                                  underline: Container(
                                    height: 2,
                                    color: cPrimaryTextColor,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValueCard = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'ING',
                                    'Ziraat',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ],
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
                            Row(
                              children: [
                                Text(
                                  "Registered Addresses",
                                  style: TextStyle(
                                      color: cPrimaryTextColor,
                                      fontSize: context.dynamicHeight(0.025),
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                DropdownButton<String>(
                                  value: dropdownValueAddress,
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(
                                    color: cPrimaryTextColor,
                                  ),
                                  underline: Container(
                                    height: 2,
                                    color: cPrimaryTextColor,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValueAddress = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Ev Adresi',
                                    'Is Adresi',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ],
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
                              height: context.dynamicHeight(0.01),
                            ),
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
