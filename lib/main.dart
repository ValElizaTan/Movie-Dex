import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_1/screen/aboutus.dart';
import 'package:project_1/screen/cinemapage.dart';
import 'package:project_1/screen/showcinema.dart';

import 'controllers/UserController.dart';
import 'screen/drawer.dart';
import 'screen/home.dart';
import 'screen/login.dart';
import 'screen/profile.dart';
import 'screen/aboutus.dart';
import 'package:project_1/controllers/DrawerController.dart' as drawerControl;

import 'screen/searchtheatre.dart';

Future<void> main() async {
  Get.put(drawerControl.DrawerController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(UserController());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  List<Widget> list = [Login(), Home(), Profile(), AboutUs()];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GetX<drawerControl.DrawerController>(
          builder: (controller) {
            switch (controller.currentScreenIndex.value) {
              case 0:
                return Login();
              case 1:
                return Home();
              case 2:
                return Profile();
              case 3:
                return AboutUs();
              case 4:
                return SearchCinema();
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
