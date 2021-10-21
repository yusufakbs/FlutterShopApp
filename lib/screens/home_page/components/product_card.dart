import 'package:flutter/material.dart';

import 'package:royu/constants.dart';
import 'package:royu/screens/home_page/components/product_detail.dart';

class Kategori extends StatefulWidget {
  final String categori;

  const Kategori({required this.categori});

  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  late List<Widget> gosterilecekListe;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    getproducts();
  }

  void getproducts() {
    if (widget.categori == "0") {
      gosterilecekListe = [
        productCard(
            0,
            "Women Navy Blue T-Shirt",
            "17£",
            "https://cdn.dsmcdn.com/ty84/product/media/images/20210330/17/76380044/158816826/1/1_org_zoom.jpeg",
            "explanation",
            mevcut: true),
      ];
    } else if (widget.categori == "1") {
      gosterilecekListe = [];
    } else if (widget.categori == "2") {
      gosterilecekListe = [
        productCard(
            0,
            "Watch",
            "25£",
            "https://cdn.dsmcdn.com/mnresize/400/-/ty4/product/media/images/20200515/20/1346923/57592550/2/2_org_zoom.jpg",
            "explanation",
            mevcut: true),
      ];
    } else if (widget.categori == "3") {
      gosterilecekListe = [
        productCard(
            0,
            "Women bag",
            "39.99£",
            "https://productimages.hepsiburada.net/s/58/600-800/11340147556402.jpg",
            "explanation",
            mevcut: true),
      ];
    } else if (widget.categori == "4") {
      gosterilecekListe = [
        productCard(
            0,
            "Maybelline New York",
            "15£",
            "https://productimages.hepsiburada.net/s/44/300-443/10819124789298.jpg",
            "explanation",
            mevcut: true),
      ];
    } else if (widget.categori == "5") {
      gosterilecekListe = [
        productCard(
            0,
            "Women Necklace",
            "10£",
            "http://www.anatolyagumus.com/gorseller/urunler/manolya-cicegi-rose-gumus-kadin-kolye-2381/manolya-cicegi-rose-gumus-kadin-kolye.jpg",
            "explanation",
            mevcut: true),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: context.dynamicHeight(0.05),
      crossAxisSpacing: context.dynamicWidth(0.05),
      padding: EdgeInsets.all(10),
      childAspectRatio: context.dynamicHeight(0.001),
      children: gosterilecekListe,
    );
  }

  Widget productCard(
      int id, String isim, String fiyat, String resimYolu, String explanation,
      {bool mevcut = false}) {
    return StatefulBuilder(builder: (context, _) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UrunDetay(
                        id: id,
                        isim: isim,
                        fiyat: fiyat,
                        resimYolu: resimYolu,
                        explanation: explanation,
                        mevcut: mevcut,
                      )));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4.0,
                  spreadRadius: 6.0,
                )
              ]),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      splashColor: null,
                      highlightColor: null,
                      child: new Icon(
                        Icons.favorite_border,
                        size: context.dynamicWidth(0.06),
                        color: isFavorite ? Colors.red : Colors.yellow,
                      ),
                    ),
                  )
                ],
              ),
              Hero(
                tag: resimYolu,
                child: Container(
                  width: context.dynamicWidth(0.39),
                  height: context.dynamicHeight(0.2),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading.gif',
                    image: resimYolu,
                    width: context.dynamicWidth(0.39),
                    height: context.dynamicHeight(0.2),
                  ),
                ),
              ),
              SizedBox(
                height: context.dynamicHeight(0.005),
              ),
              Column(
                children: [
                  Text(
                    isim,
                    style: TextStyle(
                      fontSize: context.dynamicWidth(0.03),
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    fiyat,
                    style: TextStyle(
                      fontSize: context.dynamicHeight(0.023),
                      fontWeight: FontWeight.bold,
                      color: cPrimaryTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
