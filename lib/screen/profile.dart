import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/DrawerController.dart' as DrawerControl;
import 'package:project_1/controllers/UserController.dart';

import '../style.dart';
import 'drawer.dart';
import 'editprofile.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final drawerController = DrawerControl.DrawerController();
  UserController userController = Get.find<UserController>();

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
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("images/profile.gif"),
              fit: BoxFit.contain,
            ),
            Text(
              'Welcome',
              style: TitleTextStyle,
            ),
            Obx(() => Text(
                  '${userController.firstName} ${userController.lastName}',
                  style: TitleTextStyle,
                )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => EditProfile());
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
