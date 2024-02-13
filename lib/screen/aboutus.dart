import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'drawer.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Text(
              'About Us',
              style: TextStyle(
                fontFamily: 'Pacifico',
                color: Colors.purpleAccent[100],
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
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
                  Icons.info_outlined,
                  color: Colors.purpleAccent[100],
                ),
                title: Text(
                  'This app enables the users to search for movie theatres and book movie tickets.\n\n'
                  'A list of now showing movies & places where these movies screen. \n\n'
                  'They can input their choice of movie or based on the location of the user to search for theatres. \n\n'
                  'After completion of booking, the user is set to watch their movie of choice.',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Colors.purpleAccent[100],
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.purpleAccent[100],
                ),
                title: Text(
                  'Developer: Valerie Tan',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Colors.purpleAccent[100],
                    fontSize: 20,
                  ),
                ),
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
                  '+65 8316 0942',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Colors.purpleAccent[100],
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  _launchPhone('+65 83160942');
                },
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
                onTap: () {
                  _launchEmail('211354T@mymail.nyp.edu.sg');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchPhone(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchEmail(String emailAddress) async {
    final url = 'mailto:$emailAddress';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
