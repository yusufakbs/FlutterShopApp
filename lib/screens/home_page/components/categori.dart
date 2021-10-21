import 'package:flutter/material.dart';
import 'package:royu/constants.dart';
import 'package:royu/screens/home_page/components/product_card.dart';

class Categori extends StatefulWidget {
  const Categori({Key? key}) : super(key: key);

  @override
  _CategoriState createState() => _CategoriState();
}

class _CategoriState extends State<Categori>
    with SingleTickerProviderStateMixin {
  late TabController bodyController;

  @override
  void initState() {
    super.initState();
    bodyController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: context.dynamicWidth(1),
          child: TabBar(
              indicatorWeight: 2,
              indicatorColor: kPrimaryColor,
              enableFeedback: false,
              controller: bodyController,
              isScrollable: true,
              labelStyle: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500), // yatayda kaymayı sağlar
              tabs: [
                tabBuild('assets/images/login.png'),
                tabBuild('assets/images/shoes.png'),
                tabBuild('assets/images/watch.png'),
                tabBuild('assets/images/bag.png'),
                tabBuild('assets/images/care.png'),
                tabBuild('assets/images/necklace.png'),
              ]),
        ),
        Expanded(
          child: TabBarView(controller: bodyController, children: [
            Kategori(
              categori: "0",
            ),
            Kategori(
              categori: "1",
            ),
            Kategori(
              categori: "2",
            ),
            Kategori(
              categori: "3",
            ),
            Kategori(
              categori: "4",
            ),
            Kategori(
              categori: "5",
            ),
          ]),
        )
      ],
    );
  }

  Container tabBuild(String image) {
    return Container(
      width: context.dynamicWidth(0.1),
      child: Tab(
        icon: Image.asset(image, height: context.dynamicWidth(0.1)),
      ),
    );
  }
}
