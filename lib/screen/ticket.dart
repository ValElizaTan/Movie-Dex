import 'package:flutter/material.dart';
import 'package:get/get.dart';

/* class Tickets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Tickets'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle cart icon tap
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Handle buy ticket button tap
          },
          child: Text('Buy Ticket'),
        ),
      ),
    );
  }
} */
class Tickets extends StatelessWidget {
  final TicketController ticketController = Get.put(TicketController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Tickets'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(CartScreen());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                ticketController.addToCart('Ticket 1');
              },
              child: Text('Buy Ticket 1'),
            ),
            ElevatedButton(
              onPressed: () {
                ticketController.addToCart('Ticket 2');
              },
              child: Text('Buy Ticket 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  final TicketController ticketController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ticketController.cartCount,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(ticketController.cartItems[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Get.back(); // Close the cart screen
              },
              child: Text('Checkout (${ticketController.cartCount} items)'),
            ),
          ),
        ],
      ),
    );
  }
}

class TicketController extends GetxController {
  var cartItems = <String>[].obs;

  void addToCart(String ticket) {
    cartItems.add(ticket);
  }

  int get cartCount => cartItems.length;
}