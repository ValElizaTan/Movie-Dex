import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'DetailPage.dart';

class Tickets extends StatelessWidget {
  final _ticketName = [
    'Shaw Theatres - Adults',
    'Shaw Theatres - Students',
    'Shaw Theatres - Senior Citizens',
    'Golden Village - Adults',
    'Golden Village - Students',
    'Golden Village - Senior Citizens',
    'Cathay Cineplexes  - Adults',
    'Cathay Cineplexes  - Students',
    'Cathay Cineplexes  - Senior Citizens'
  ];

  final _ticketPrice = [
    '\$8.50',
    '\$6.50',
    '\$4.00',
    '\$9.00',
    '\$7.00',
    '\$5.00',
    '\$9.00',
    '\$7.00',
    '\$5.00'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tickets'),
      ),
      body: ListView.builder(
        itemCount: _ticketName.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            splashColor: Colors.blueAccent,
            highlightColor: Colors.blueAccent.withOpacity(1.0),
            child:
                _buildGridCards(index, _ticketName[index], _ticketPrice[index]),
          );
        },
      ),
    );
  }

  Widget _buildGridCards(int index, String ticketName, String ticketPrice) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ticket Name
              Text(
                ticketName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              // Price
              Text(
                ticketPrice,
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              Spacer(),
              // Add Btn
              IconButton(
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.to(
                  () => DetailPage(
                    ticketName: ticketName,
                    ticketPrice: ticketPrice,
                  ),
                );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
