import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'complate_profile_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: context.dynamicHeight(0.02),
            ),
            Text(
              'Complate Profile',
              style: TextStyle(
                  color: cPrimaryTextColor,
                  fontSize: context.dynamicHeight(0.04),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Complete your details or continue",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: cPrimaryTextColor,
                fontSize: context.dynamicHeight(0.02),
              ),
            ),
            SizedBox(
              height: context.dynamicHeight(0.03),
            ),
            CompleteProfileForm(),
            SizedBox(
              height: context.dynamicHeight(0.05),
            ),
            Text(
              "By continuing your confirm that you agree \nwith our Term and Condition",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: cPrimaryTextColor,
                  fontSize: context.dynamicHeight(0.021)),
            )
          ],
        ),
      ),
    );
  }
}
