import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_1/screen/aboutus.dart';
import 'package:project_1/screen/registration.dart';

import 'screen/drawer.dart';
import 'screen/home.dart';
import 'screen/login.dart';
import 'screen/profile.dart';
import 'screen/search.dart';
import 'screen/aboutus.dart';
import 'package:project_1/controllers/DrawerController.dart' as drawerControl;

Future<void> main() async {
  Get.put(drawerControl.DrawerController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title = 'Movie Dex';
  int index = 0;
  List<Widget> list = [Login(), Search(), Home(), Profile(), AboutUs()];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GetX<drawerControl.DrawerController>(
          builder: (controller) {
            switch (controller.currentScreenIndex.value) {
              case 0:
                return Login();
              case 1:
                return Search();
              case 2:
                return Home();
              case 3:
                return Profile();
              case 4:
                return AboutUs();
              case 5:
                return Register();
              default:
                return Login();
            }
          },
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}
