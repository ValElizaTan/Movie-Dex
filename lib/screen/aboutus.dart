import 'package:flutter/material.dart';

import '../style.dart';
import 'drawer.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Dex ❤️'),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /* CircleAvatar(
                radius: 70, backgroundImage: AssetImage('images/arslan.jpg')), */
            SizedBox(
              height: 30,
            ),
            Text(
              'Valerie Tan',
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.purpleAccent[100],
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  letterSpacing: 2.5,
                  color: Colors.purpleAccent[100],
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
              width: 150,
              child: Divider(
                color: Colors.purpleAccent[100],
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.purpleAccent[100],
                ),
                title: Text(
                  '+65 83160942',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Colors.purpleAccent[100],
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 2, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.purpleAccent[100],
                ),
                title: Text(
                  '211354T@mymail.nyp.edu.sg',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Colors.purpleAccent[100],
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
