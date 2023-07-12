import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/grocery_item_tile.dart';
import '../models/cart_model.dart';
import 'cart_page.dart';

int itemCount = 6;

int start = 15;

class cold_drinks extends StatelessWidget {
  const cold_drinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Cold Drinks"),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => cart())));
                },
              )
            ],
            // backgroundColor: Colors.transparent,
            backgroundColor: Color.fromARGB(255, 241, 113, 103),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ))),
        body: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(24)),
          ),
          Container(
              height: 15,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ))),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: itemCount,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                        itemName: value.shopItems[index + start][0],
                        itemPrice: value.shopItems[index + start][1],
                        imagePath: value.shopItems[index + start][2],
                        color: value.shopItems[index + start][3],
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index + start);
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Added to cart')));
                        });
                  },
                );
              },
            ),
          ),
          SizedBox(height: 10),
        ]));
  }
}
