import 'package:flutter/material.dart';
import 'package:royu/components/default_button.dart';
import 'package:royu/constants.dart';
import 'package:royu/screens/sign_in/sign_in_screen.dart';

// This best practice avoids complexity
import 'package:royu/screens/splash/components/splash_content.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to RoYuu, Let's shop!",
      "loginImage": "assets/images/women.png",
    },
    {
      "text": "We help people conect with store \naround Turkey,",
      "loginImage": "assets/images/login.png",
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us.",
      "loginImage": "assets/images/shoes.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kPrimaryColor,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    brandName: "RoYuu",
                    loginImageHeight: 0.4,
                    loginImageWidth: 0.8,
                    loginImage: splashData[index]["loginImage"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
              SizedBox(
                height: context.dynamicHeight(0.03),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      context.dynamicPaddingLeft(0.05),
                      context.dynamicPaddingTop(0.05),
                      context.dynamicPaddingRight(0.05),
                      context.dynamicPaddingBottom(0.05)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(splashData.length,
                            (index) => buildDot(index: index)),
                      ),
                      SizedBox(
                        height: context.dynamicHeight(0.04),
                      ),
                      DefaultButton(
                        
                        width: context.dynamicWidth(0.9),
                        height: context.dynamicHeight(0.085),
                        text: "Continue",
                        press: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot({int? index}) {
    return Container(
      margin: EdgeInsets.only(right: context.dynamicHeight(0.008)),
      height: context.dynamicHeight(0.01),
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.white : Color(0XFFD8D8D8),
        borderRadius: BorderRadius.circular(context.dynamicHeight(0.01)),
      ),
    );
  }
}
