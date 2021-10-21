import 'package:flutter/material.dart';
import 'package:royu/components/default_button.dart';
import 'package:royu/constants.dart';

class UrunDetay extends StatelessWidget {
  final int id;
  final String isim;
  final String fiyat;
  final String resimYolu;
  final String explanation;
  final bool mevcut;

  UrunDetay({
    Key? key,
    required this.isim,
    required this.fiyat,
    required this.resimYolu,
    required this.explanation,
    required this.mevcut,
    required this.id,
  }) : super(key: key);

  final String estimatedTime = "Estimated Time of Arrival \n3-5 business days.";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: [
            Stack(
              children: [
                Center(
                  child: Hero(
                      tag: resimYolu,
                      child: Image.network(
                        resimYolu,
                        height: context.dynamicHeight(0.75),
                      )),
                ),
                IconButton(
                    enableFeedback: false,
                    icon: Icon(
                      Icons.arrow_back,
                      color: kPrimaryColor,
                      size: context.dynamicWidth(0.13),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
            SizedBox(
              height: context.dynamicHeight(0.03),
            ),
            ProductDescription(isim: isim),
          ],
        ),
        bottomNavigationBar: buildBottomAppBar(context),
      ),
    );
  }

  BottomAppBar buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.grey[300],
      child: SizedBox(
        height: context.dynamicHeight(0.1),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                fiyat,
                style: TextStyle(
                    color: cPrimaryTextColor,
                    fontSize: context.dynamicHeight(0.06)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        size: context.dynamicWidth(0.08),
                      )),
                  SizedBox(width: context.dynamicWidth(0.05)),
                  DefaultButton(
                      text: "Add to Cart",
                      press: () {},
                      width: context.dynamicWidth(0.4),
                      height: context.dynamicHeight(0.07)),
                ],
              )
            ]),
      ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.isim,
  }) : super(key: key);

  final String isim;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isim,
                style: TextStyle(
                  fontSize: context.dynamicWidth(0.05),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: context.dynamicHeight(0.01)),
              Text(
                "color : renk gelecek",
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: context.dynamicWidth(0.04)),
              ),
            ],
          ),
        ),
        Divider(
          height: context.dynamicHeight(0.04),
          thickness: 6,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "The cargo will reach you within \n5 working days at the latest.",
                style: TextStyle(
                    color: cPrimaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: context.dynamicWidth(0.04)),
              ),
              Spacer(),
              Icon(
                Icons.card_giftcard_outlined,
                size: context.dynamicWidth(0.1),
              )
            ],
          ),
        ),
        Divider(
          height: context.dynamicHeight(0.04),
          thickness: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Product Description",
              style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                  fontSize: context.dynamicWidth(0.06)),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fabric Type :--",
                style: TextStyle(
                    color: cPrimaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: context.dynamicWidth(0.04)),
              ),
              SizedBox(
                height: context.dynamicHeight(0.02),
              ),
              Text(
                "Length (Horizontal) :--",
                style: TextStyle(
                    color: cPrimaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: context.dynamicWidth(0.04)),
              ),
              SizedBox(
                height: context.dynamicHeight(0.02),
              ),
              Text(
                "Length (Vertical) :--",
                style: TextStyle(
                    color: cPrimaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: context.dynamicWidth(0.04)),
              ),
              SizedBox(
                height: context.dynamicHeight(0.02),
              ),
              Text(
                "Width :--",
                style: TextStyle(
                    color: cPrimaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: context.dynamicWidth(0.04)),
              ),
              SizedBox(
                height: context.dynamicHeight(0.02),
              ),
              Text(
                "Other :--",
                style: TextStyle(
                    color: cPrimaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: context.dynamicWidth(0.04)),
              ),
              SizedBox(
                height: context.dynamicHeight(0.02),
              ),
              Text(
                "Season :asssssssssssssssssssssssssssssssssssssssssssssssssssssssssss",
                style: TextStyle(
                    color: cPrimaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: context.dynamicWidth(0.04)),
              ),
              SizedBox(
                height: context.dynamicHeight(0.02),
              ),
              Text(
                "Warranty Period(Month) :--",
                style: TextStyle(
                    color: cPrimaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: context.dynamicWidth(0.04)),
              ),
              SizedBox(
                height: context.dynamicHeight(0.1),
              ),
            ],
          ),
        )
      ],
    );
  }
}
