import 'package:flutter/material.dart';

// class _Product {
//   _Product({required this.name, required this.qty});
//   String name;
//   int qty;
//   bool inCart = false;

//   int firstqty = 0;

//   void decrement() {
//     firstqty += 1;
//     if (this.qty != 0) {
//       this.qty -= 1;
//     } else {
//       this.qty = firstqty - 1;
//       this.firstqty = 0;
//     }
//     this.inCart = (qty == 0) ? true : false;
//   }
// }

// List<_Product> productData = [
//   _Product(name: "Telur", qty: 3),
//   _Product(name: "Gula", qty: 2),
//   _Product(name: "Tepung", qty: 2)
// ];

class ShopListApp extends StatelessWidget {
  const ShopListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop List App',
      home: Scaffold(
        appBar: AppBar(title: Text("Shopping List")),
        body: _ProductList(),
      ),
    );
  }
}

// class _ProductList extends StatefulWidget {
//   _ProductList({super.key});

//   @override
//   State<_ProductList> createState() => __ProductListState();
// }

// class __ProductListState extends State<_ProductList> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: productData.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//           onTap: () {
//             setState(() {
//               productData[index].decrement();
//             });
//           },
//           leading: CircleAvatar(
//             backgroundColor:
//                 productData[index].inCart ? Colors.grey : Colors.amber,
//             radius: 30,
//             child: Text(
//               productData[index].name[0],
//               style: TextStyle(fontSize: 24, color: Colors.white),
//             ),
//           ),
//           title: Text(
//             "${productData[index].name} x${productData[index].qty}",
//             style: productData[index].inCart
//                 ? TextStyle(
//                     color: Colors.black38,
//                     fontSize: 24,
//                     decoration: TextDecoration.lineThrough)
//                 : TextStyle(
//                     fontSize: 24,
//                   ),
//           ),
//         );
//       },
//     );
//   }
// }
class Item {
  String itemName;
  int itemQty;
  Item({required this.itemName, required this.itemQty});
}

class _ProductList extends StatefulWidget {
  const _ProductList({super.key});

  @override
  State<_ProductList> createState() => __ProductListState();
}

// class __ProductListState extends State<_ProductList> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         ListTile(
//           leading: CircleAvatar(backgroundColor: Colors.amber),
//           title: Text("item1"),
//         ),
//         ListTile(
//           leading: CircleAvatar(backgroundColor: Colors.amber),
//           title: Text("item2"),
//         )
//       ],
//     );
//   }
// }

class __ProductListState extends State<_ProductList> {
  final addController = TextEditingController();
  final QtyController = TextEditingController();
  // List<String> dataItem = ["Telur", "Tepung", "Teriyaki"];
  // List<int> dataQty = [2, 4, 3];
  List<Item> itemData = [
    Item(itemName: "Saus Tomat", itemQty: 2),
    Item(itemName: "Kecap", itemQty: 4),
    Item(itemName: "Acar", itemQty: 2),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: itemData.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                    "${itemData[index].itemName} x ${itemData[index].itemQty}"),
                leading: CircleAvatar(
                    backgroundColor: (itemData[index].itemQty != 0)
                        ? Colors.green
                        : Colors.grey),
                onTap: (itemData[index].itemQty != 0)
                    ? () {
                        setState(() {
                          if (itemData[index].itemQty != 0) {
                            itemData[index].itemQty =
                                itemData[index].itemQty - 1;
                          } else {}
                        });
                      }
                    : null,
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      itemData.removeAt(index);
                    });
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Nama",
                                icon: Icon(Icons.add_shopping_cart),
                              ),
                              controller: addController,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Jumlah",
                                icon: Icon(Icons.add),
                              ),
                              controller: QtyController,
                            )
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          child: Text("Add"),
                          onPressed: () {
                            setState(() {
                              itemData.add(Item(
                                  itemName: addController.text,
                                  itemQty: int.parse(QtyController.text)));
                              addController.clear();
                              QtyController.clear();
                            });
                          })
                    ],
                  );
                });
          },
          child: Icon(Icons.add),
        ));
  }
}
