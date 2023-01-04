import 'package:flutter/material.dart';

List<Product> productData = [
  Product(productPrice: 1500000, productName: "VGA GTX 750ti"),
  Product(
      productPrice: 1350000,
      productName: "RAM Corsair RGB",
      productImage: "images/ram-rgb.jpg"),
  Product(
      productPrice: 4000000,
      productName: "Motherboard Asus Gundam Edition",
      productImage: "images/asus-gundam.jpg")
];

class CommerceApp extends StatefulWidget {
  const CommerceApp({super.key});

  @override
  State<CommerceApp> createState() => _CommerceAppState();
}

class _CommerceAppState extends State<CommerceApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: isDark ? Brightness.dark : Brightness.light,
        ),
        home: ShopPage());
  }
}

class ShopPage extends StatefulWidget {
  ShopPage({
    super.key,
  });

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Shop"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FavoritePage()));
                },
                icon: Icon(Icons.favorite)),
            // Switch(
            //   value: widget.theme,
            //   onChanged: (value) {
            //     setState(() {
            //       widget.theme = !value;
            //     });
            //   },
            // ),
          ],
        ),
        body: ListView.builder(
          itemCount: productData.length,
          itemBuilder: (context, index) {
            return ProductCard(product: productData[index]);
          },
        ));
  }
}

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favorite Product"),
      ),
      body: ListView.builder(
        itemCount: productData.length,
        itemBuilder: (context, index) {
          if (productData[index].isFav) {
            return ProductCard(product: productData[index]);
          } else
            return Container();
        },
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  Product product;
  ProductCard({required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Container(
        margin: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  child: Image.asset(widget.product.productImage),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.productName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text("Rp.${widget.product.productPrice}")
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.product.favorite();
                  });
                },
                icon: widget.product.isFav
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : Icon(Icons.favorite_border_rounded))
          ],
        ),
      ),
    );
  }
}
// class _CommerceAppState extends State<CommerceApp> {
//   bool isDark = false;
//   bool isFav = false;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         brightness: isDark ? Brightness.dark : Brightness.light,
//       ),
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text("My Shop"),
//             actions: [
//               IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
//               Switch(
//                 value: isDark,
//                 onChanged: (value) {
//                   setState(() {
//                     isDark = value;
//                   });
//                 },
//               ),
//             ],
//           ),
//           body: ListView.builder(
//             itemCount: productData.length,
//             itemBuilder: (context, index) {
//               return ProductCard(product: productData[index]);
//             },
//           )),
//     );
//   }
// }

// class ProductCard extends StatefulWidget {
//   Product product;
//   ProductCard({required this.product});

//   @override
//   State<ProductCard> createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(8),
//       child: Container(
//         // decoration:
//         //     BoxDecoration(border: Border.all(color: Colors.white)),
//         // padding: EdgeInsets.all(10),
//         margin: EdgeInsets.all(8),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   height: 80,
//                   width: 80,
//                   child: Image.asset(widget.product.productImage),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(widget.product.productName),
//                     Text("${widget.product.productPrice}")
//                   ],
//                 ),
//               ],
//             ),
//             IconButton(
//                 onPressed: () {
//                   setState(() {
//                     widget.product.favorite();
//                   });
//                 },
//                 icon: widget.product.isFav
//                     ? Icon(
//                         Icons.favorite,
//                         color: Colors.red,
//                       )
//                     : Icon(Icons.favorite_border_rounded))
//           ],
//         ),
//       ),
//     );
//   }
// }

class Product {
  String productName;
  int productPrice;
  String productImage;
  bool isFav = false;
  Product(
      {required this.productPrice,
      required this.productName,
      this.productImage = "images/no-image.jpg"});

  void favorite() {
    isFav = !isFav;
  }
}
