import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            double price = cart[cartKey]['price'];

            return Card(
              color: Colors.cyan[100],
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  //  Quantity
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: $name',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Quantity: $count',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Price: $price',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
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
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
