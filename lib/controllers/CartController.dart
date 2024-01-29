import 'package:get/get.dart';

class CartController extends GetxController {
  var _cart = {}.obs;

  //Getters
  get cart => _cart;
  int get cartCount => _cart.length;
  int get count => _cart.length > 0 ? _cart.values.reduce((a, b) => a + b) : 0;

  // Business logic
  void addToCart(String ticketName, int name, int quantity, double price) {
    String cartKey = '$ticketName';
    if (_cart.containsKey(cartKey)) {
      if (_cart[cartKey]['name'] == name) {
        _cart[cartKey]['quantity'] += quantity;
      } else {
        _cart[cartKey]['name'] = name;
        _cart[cartKey]['quantity'] = quantity;
      }
    } else {
      _cart[cartKey] = {
        'name': name,
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
        // Remove 1 item from the cart
        _cart[cartKey]['quantity']--;
        if (_cart[cartKey]['quantity'] == 0) {
          // Remove ALL item from cart
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

  int getQuantity(String ticketName) {
    String cartKey = '$ticketName';
    if (_cart.containsKey(cartKey)) {
      return _cart[cartKey]['quantity'];
    } else {
      return 0;
    }
  }
  
}
