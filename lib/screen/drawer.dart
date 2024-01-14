import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/DrawerController.dart' as DrawerControl;

import 'aboutus.dart';
import 'home.dart';
import 'login.dart';
import 'profile.dart';
import 'registration.dart';
import 'search.dart';

class MyDrawer extends StatelessWidget {
  final Function onTap;
  MyDrawer({this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //Use SizeBox to contain Drawer
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/header_bg.jpg'),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/superhero.jpg'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Super Hero',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'super_hero@nyp.edu.sg',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Login'),
              onTap: () =>
                  Get.offAll(() => Login())
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search'),
              onTap: () =>
                  Get.offAll(() => Search())
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () =>
                  Get.offAll(() => Home())
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () =>
                  Get.offAll(() => Profile())
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('About Us'),
              onTap: () =>
                  Get.offAll(() => AboutUs())
            ),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text('Register'),
              onTap: () =>
                  Get.offAll(() => Register())
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () =>
                  Get.offAll(() => Login())
            ),
          ],
        ),
      ),
    );
  }
}
