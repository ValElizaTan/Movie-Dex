import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail.dart';
import 'home.dart';

class Tickets extends StatelessWidget {
  final _ticketName = [
    'Shaw Theatres - Adults',
    'Shaw Theatres - Students',
    'Shaw Theatres - Senior Citizens',
    'Golden Village - Adults',
    'Golden Village - Students',
    'Golden Village - Senior Citizens',
    'Cathay Cineplexes - Adults',
    'Cathay Cineplexes - Students',
    'Cathay Cineplexes - Senior Citizens'
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
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.to(() => Home());
            }),
        title: Text('Tickets'),
      ),
      body: ListView.builder(
        itemCount: _ticketName.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildTicketCard(_ticketName[index], _ticketPrice[index]);
        },
      ),
    );
  }

  Widget _buildTicketCard(String ticketName, String ticketPrice) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          ticketName,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Price: $ticketPrice',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.add_circle),
          color: Colors.blue,
          onPressed: () {
            _navigateToDetailPage(ticketName, ticketPrice);
          },
        ),
      ),
    );
  }

  void _navigateToDetailPage(String ticketName, String ticketPrice) {
    Get.to(() => DetailPage(
          ticketName: ticketName,
          ticketPrice: ticketPrice,
        ));
  }
}
