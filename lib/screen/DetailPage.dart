/* import 'package:shared_preferences/shared_preferences.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/CartController.dart';
import 'CartPage.dart';

class DetailPage extends StatefulWidget {
  final String ticketName;
  final double ticketPrice;
  const DetailPage({Key key, this.ticketName, this.ticketPrice})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //  Quantity selected
  bool isQuantitySelected = false;

  @override
  //  SharedPreference: store user data
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    //  Inject GetXController
    var cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            //  Orange Btn + Cart Icon
            child: Badge(
              badgeColor: Colors.orange.withOpacity(1),
              position: BadgePosition.topEnd(top: 0, end: 5),
              badgeContent: Obx(
                () => Text(
                  cartController.cartCount.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: isQuantitySelected ? Colors.white : Colors.black26,
                ),
                onPressed: isQuantitySelected
                    ? () {
                        Get.to(() => CartPage());
                      }
                    : null,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),

          //  Name
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              widget.ticketName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Price & Quantity container
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Quantity:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                //  Add Btn
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (isQuantitySelected) {
                      setState(() {
                        cartController.addToCart(
                          widget.ticketName,
                          1,
                        );
                        isQuantitySelected = true;
                      });
                    }
                  },
                ),

                //  Qty No.
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Obx(
                    () {
                      final cartKey = '${widget.ticketName}';
                      final quantity = cartController.cart[cartKey];
                      return Text(
                        (quantity != null ? quantity['quantity'] : 0)
                            .toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    },
                  ),
                ),

                //  Remove Btn
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    cartController.remove(widget.ticketName);
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 */
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/CartController.dart';
import 'CartPage.dart';

class DetailPage extends StatefulWidget {
  final String ticketName;
  final String ticketPrice;

  const DetailPage({Key key, this.ticketName, this.ticketPrice})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isQuantitySelected = false;
  var cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Badge(
              badgeColor: Colors.orange.withOpacity(1),
              position: BadgePosition.topEnd(top: 0, end: 5),
              badgeContent: Obx(
                () => Text(
                  cartController.cartCount.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: isQuantitySelected ? Colors.white : Colors.black26,
                ),
                onPressed: isQuantitySelected
                    ? () {
                        Get.to(() => CartPage());
                      }
                    : null,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Image(
            image: AssetImage("images/ticket_8.png"),
            fit: BoxFit.contain,
            height: 270,
            width: 270,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              widget.ticketName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              widget.ticketPrice,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Quantity:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (isQuantitySelected) {
                      setState(() {
                        cartController.addToCart(
                          widget.ticketName,
                          1,
                          double.parse(widget.ticketPrice.replaceAll('\$', '')),
                        );
                        isQuantitySelected = true;
                      });
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Obx(
                    () {
                      final cartKey = '${widget.ticketName}';
                      final quantity = cartController.cart[cartKey];
                      return Text(
                        (quantity != null ? quantity['quantity'] : 0)
                            .toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    cartController.remove(widget.ticketName);
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
