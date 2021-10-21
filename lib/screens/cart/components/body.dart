import 'package:flutter/material.dart';
import 'package:royu/screens/home_page/components/product_detail.dart';
import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Widget sepetUrun(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: context.dynamicWidth(1),
        height: context.dynamicHeight(0.27),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.grey[400],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 2.0,
                spreadRadius: 3.0,
              )
            ]),
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {
                        // DELETE PRODUCT İN CART
                      },
                      splashColor: null,
                      highlightColor: null,
                      child: new Icon(
                        Icons.delete_outline,
                        size: context.dynamicWidth(0.09),
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UrunDetay(
                                      id: 0,
                                      isim: "Woman Navy Blue Shoulder Bag",
                                      fiyat: "15",
                                      resimYolu:
                                          "http://www.anatolyagumus.com/gorseller/urunler/manolya-cicegi-rose-gumus-kadin-kolye-2381/manolya-cicegi-rose-gumus-kadin-kolye.jpg",
                                      explanation: "asdasdasdasd",
                                      mevcut: true,
                                    )));
                      },
                      child: Hero(
                        tag: "fab1",
                        child: Container(
                          width: context.dynamicWidth(0.45),
                          height: context.dynamicHeight(0.18),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(55.0)),
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/loading.gif',
                            image:
                                "http://www.anatolyagumus.com/gorseller/urunler/manolya-cicegi-rose-gumus-kadin-kolye-2381/manolya-cicegi-rose-gumus-kadin-kolye.jpg",
                            width: context.dynamicWidth(0.39),
                            height: context.dynamicHeight(0.2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: context.dynamicHeight(0.2),
                      width: context.dynamicWidth(0.3),
                      child: Column(
                        children: [
                          Text(
                            "Women Navy Blue Shoulder Bag",
                            style: TextStyle(
                              fontSize: context.dynamicWidth(0.04),
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(
                            height: context.dynamicHeight(0.08),
                          ),
                          Text(
                            "15£",
                            style: TextStyle(
                              fontSize: context.dynamicHeight(0.04),
                              fontWeight: FontWeight.bold,
                              color: cPrimaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> yusuf = [];
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return sepetUrun(context);
      },
      itemCount: 1,
    );
  }
}
