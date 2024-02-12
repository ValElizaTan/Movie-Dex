import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/DrawerController.dart' as DrawerControl;
import 'package:project_1/controllers/UserController.dart';
import 'package:getwidget/getwidget.dart';

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
        title: Text('Profile'),
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
              'Hello,',
              style: TitleTextStyle,
            ),
            Obx(() => Text(
                  '${userController.firstName} ${userController.lastName}',
                  style: TitleTextStyle,
                )),
            SizedBox(height: 20),
            GFButton(
              onPressed: () {
                Get.to(() => EditProfile());
              },
              text: "Edit Profile",
              shape: GFButtonShape.pills,
              icon: Icon(Icons.edit),
              color: Colors.purpleAccent[700],
            ),
          ],
        ),
      ),
    );
  }
}
