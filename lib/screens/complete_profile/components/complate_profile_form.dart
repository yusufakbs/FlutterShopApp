import 'package:flutter/material.dart';
import 'package:royu/components/custom_surfix_icon.dart';
import 'package:royu/components/default_button.dart';

import '../../../constants.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  late String firstName;
  late String lastName;
  late String phoneNumber;
  late String address;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: context.dynamicHeight(0.02),
          ),
          buildFirstNameFormField(),
          SizedBox(
            height: context.dynamicHeight(0.02),
          ),
          buildLastNameFormField(),
          SizedBox(
            height: context.dynamicHeight(0.02),
          ),
          buildPhoneNumberFormField(),
          SizedBox(
            height: context.dynamicHeight(0.02),
          ),
          buildAddressFormField(),
          SizedBox(
            height: context.dynamicHeight(0.04),
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                ////
              }
            },
            width: context.dynamicWidth(0.6),
            height: context.dynamicHeight(0.075),
          )
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Address!';
        }
      },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          labelStyle: TextStyle(
              color: cPrimaryTextColor,
              fontSize: context.dynamicHeight(0.02),
              fontWeight: FontWeight.bold),
          labelText: "Adrress",
          hintText: "Enter your adrress",
          suffixIcon: CustomSurffixIcon(icon: Icons.location_on)),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter your phone number!';
        }
      },
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          labelStyle: TextStyle(
              color: cPrimaryTextColor,
              fontSize: context.dynamicHeight(0.02),
              fontWeight: FontWeight.bold),
          labelText: "Phone Number",
          hintText: "Enter your phone number",
          suffixIcon: CustomSurffixIcon(icon: Icons.phone_android)),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Last Name!';
        }
      },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          labelStyle: TextStyle(
              color: cPrimaryTextColor,
              fontSize: context.dynamicHeight(0.02),
              fontWeight: FontWeight.bold),
          labelText: "Last Name",
          hintText: "Enter your Last Name",
          suffixIcon: CustomSurffixIcon(icon: Icons.account_box)),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter First Name!';
        }
      },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          labelStyle: TextStyle(
              color: cPrimaryTextColor,
              fontSize: context.dynamicHeight(0.02),
              fontWeight: FontWeight.bold),
          labelText: "First Name",
          hintText: "Enter your first name",
          suffixIcon: CustomSurffixIcon(icon: Icons.account_box)),
    );
  }
}

