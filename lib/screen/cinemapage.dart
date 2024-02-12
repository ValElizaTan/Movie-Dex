/* import 'package:flutter/material.dart';

import 'addcinema.dart';
import 'drawer.dart';
import 'showcinema.dart';

class CinemaPage extends StatefulWidget {
  @override
  State<CinemaPage> createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cinema'),
      ),
      drawer: MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('WELCOME HOME', style: TextStyle(fontSize: 30)),
          SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.add_box),
                iconSize: 60,
                tooltip: 'add record',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddCinemaPage()));
                },
              ),
              IconButton(
                icon: Icon(Icons.list),
                iconSize: 60,
                tooltip: 'add record',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RecordsPage()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
 */