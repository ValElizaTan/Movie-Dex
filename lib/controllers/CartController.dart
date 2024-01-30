import 'package:get/get.dart';

class CartController extends GetxController {
  var _cart = {}.obs;

  //Getters
  get cart => _cart;
  int get cartCount => _cart.length;
  int get count => _cart.length > 0 ? _cart.values.reduce((a, b) => a + b) : 0;

  // Business logic
  void addToCart(String ticketName, int quantity, double price) {
    String cartKey = '$ticketName';
    if (_cart.containsKey(cartKey)) {
      _cart[cartKey]['quantity'] += quantity;
    } else {
      _cart[cartKey] = {
        'quantity': quantity,
        'price': price,
      };
    }
    update();
  }

  void remove(String ticketName) {
    String cartKey = '$ticketName';
    if (_cart.containsKey(cartKey)) {
      if (_cart[cartKey]['quantity'] > 0) {
        _cart[cartKey]['quantity']--;
        if (_cart[cartKey]['quantity'] == 0) {
          _cart.remove(cartKey);
        }
        update();
      }
    }
  }

  void clear(String cartKey) {
    if (_cart.containsKey(cartKey)) {
      _cart.remove(cartKey);
      update();
    }
  }
}
