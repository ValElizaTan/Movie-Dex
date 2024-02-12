import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/screen/checkout.dart';

import '../controllers/CartController.dart';
import 'ticket.dart';

class CartPage extends StatelessWidget {
  CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController = Get.find<CartController>();
    var cart = cartController.cart;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.to(() => Tickets());
            }),
        title: Text("Your Cart"),
        actions: [
          Center(
            child: Obx(
              () => Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  'Total: ' + cartController.cartCount.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: cartController.cart.length,
          itemBuilder: (context, index) {
            String cartKey = cart.keys.toList()[index];
            String name = cart[cartKey]['name'];
            int count = cart[cartKey]['quantity'];
            String price = cart[cartKey]['price'];

            return Card(
              color: Colors.cyan[100],
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //  Name
                      Text(
                        '$name',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                      //  Quantity
                      Text(
                        'Quantity: $count',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                      //  Price
                      Text(
                        'Price: $price',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Spacer(),

                  // Clear
                  IconButton(
                    icon: Icon(
                      Icons.clear,
                    ),
                    onPressed: () {
                      cartController.clear(cartKey);
                    },
                    color: Colors.black,
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //  Calculate total price
          double totalPrice = 0.0;
          cart.forEach((key, value) {
            totalPrice += double.parse(value['price']) * value['quantity'];
          });
          //  Clear items
          cartController.clearAllItems();
          //  Show total price and initiate checkout
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Total Price'),
              content: Text('Total Price: \$${totalPrice.toStringAsFixed(2)}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Get.to(() => Checkout());
                  },
                  child: Text('Checkout'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          );
        },
        label: Text('Checkout'),
        icon: Icon(Icons.shopping_cart),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
