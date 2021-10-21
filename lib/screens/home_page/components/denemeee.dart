// import 'package:flutter/material.dart';

// import 'package:royu/constants.dart';
// import 'package:royu/screens/home_page/components/product_detail.dart';

// class Kategori extends StatefulWidget {
//   final String categori;

//   const Kategori({required this.categori});

//   @override
//   _KategoriState createState() => _KategoriState();
// }

// class _KategoriState extends State<Kategori> {
//   late List<Widget> gosterilecekListe;
//   bool isFavorite = false;

//   @override
//   void initState() {
//     super.initState();
//     getproducts();
//   }

//   void getproducts() {
//     if (widget.categori == "T-Shirt") {
//       gosterilecekListe = [
//         productCard(
//             0,
//             "Women Navy Blue T-Shirt",
//             "17£",
//             "https://cdn.dsmcdn.com/ty84/product/media/images/20210330/17/76380044/158816826/1/1_org_zoom.jpeg",
//             "explanation",
//             mevcut: true),
//       ];
//     } else if (widget.categori == "Shoes") {
//       gosterilecekListe = [
//         productCard(
//             0,
//             "Women Shoes",
//             "12£",
//             "https://cdn.dsmcdn.com//ty127/product/media/images/20210609/23/98099737/160331682/1/1_org_zoom.jpg",
//             "explanation"),
//       ];
//     } else if (widget.categori == "Watch") {
//       gosterilecekListe = [
//         productCard(
//             0,
//             "Watch",
//             "25£",
//             "https://cdn.dsmcdn.com/mnresize/400/-/ty4/product/media/images/20200515/20/1346923/57592550/2/2_org_zoom.jpg",
//             "explanation",
//             mevcut: true),
//       ];
//     } else if (widget.categori == "Bag") {
//       gosterilecekListe = [
//         productCard(
//             0,
//             "Women bag",
//             "39.99£",
//             "https://productimages.hepsiburada.net/s/58/600-800/11340147556402.jpg",
//             "explanation",
//             mevcut: true),
//       ];
//     } else if (widget.categori == "Care") {
//       gosterilecekListe = [
//         productCard(
//             0,
//             "Maybelline New York",
//             "15£",
//             "https://productimages.hepsiburada.net/s/44/300-443/10819124789298.jpg",
//             "explanation",
//             mevcut: true),
//       ];
//     } else if (widget.categori == "Necklace") {
//       gosterilecekListe = [
//         productCard(
//             0,
//             "Women Necklace",
//             "10£",
//             "http://www.anatolyagumus.com/gorseller/urunler/manolya-cicegi-rose-gumus-kadin-kolye-2381/manolya-cicegi-rose-gumus-kadin-kolye.jpg",
//             "explanation",
//             mevcut: true),
//       ];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       crossAxisCount: 2,
//       mainAxisSpacing: context.dynamicHeight(0.05),
//       crossAxisSpacing: context.dynamicWidth(0.05),
//       padding: EdgeInsets.all(10),
//       childAspectRatio: context.dynamicHeight(0.001),
//       children: gosterilecekListe,
//     );
//   }

//   Widget productCard(
//       int id, String isim, String fiyat, String resimYolu, String explanation,
//       {bool mevcut = false}) {
//      return ListView.builder(itemCount: ,)   
//   }
// }