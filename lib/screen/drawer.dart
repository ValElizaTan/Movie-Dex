import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/DrawerController.dart' as DrawerControl;
import 'package:project_1/controllers/UserController.dart';
import 'package:project_1/screen/cinemapage.dart';
import 'package:project_1/screen/map.dart';

import 'aboutus.dart';
import 'home.dart';
import 'login.dart';
import 'profile.dart';
import 'searchtheatre.dart';

class MyDrawer extends StatelessWidget {
  UserController userController = Get.find<UserController>();
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
                    Obx(
                      () => Text(
                        '${userController.firstName} ${userController.lastName}',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
                leading: Icon(Icons.login),
                title: Text('Login'),
                onTap: () => Get.offAll(() => Login())),
            ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () => Get.offAll(() => Home())),
            ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () => Get.offAll(() => Profile())),
            ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('About Us'),
                onTap: () => Get.offAll(() => AboutUs())),
            ListTile(
                leading: Icon(Icons.map_sharp),
                title: Text('Search Cinema'),
                onTap: () => Get.offAll(() => CinemaPage())),
            ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () => Get.offAll(() => Login())),
          ],
        ),
      ),
    );
  }
}
