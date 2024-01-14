import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/UserController.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../style.dart';
import 'drawer.dart';
import 'profile.dart';

final _formKey = GlobalKey<FormState>();

class EditProfile extends StatelessWidget {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Dex ❤️'),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                containerForm('First Name:', firstName),
                SizedBox(height: 15),
                containerForm('Last Name:', lastName),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: FlatButton(
                    padding: EdgeInsets.fromLTRB(120, 10, 120, 20),
                    onPressed: () {
                      userController.updateFirstName(firstName.text);
                      userController.updateLastName(lastName.text);
                      Get.off(Profile());
                    },
                    color: Colors.cyan[400],
                    child: Text(
                      'Save Profile',
                      style: ButtonTextStyle,
                    ),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //  SAVE
  /* save() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    if (firstName.text != '') {
      await sp.setString('firstName', firstName.text);
    }
    if (lastName.text != '') {
      await sp.setString('lastName', lastName.text);
    }
  } */

  //  VALIDATION
  final RegExp nameRegex =
      new RegExp(r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$");

  //  TEXT FORM
  TextFormField textFormField(TextEditingController name) {
    TextInputType textInputType;
    String hint = 'Please enter your ';
    String msg;
    RegExp regExp;

    if (name == this.firstName || name == this.lastName) {
      textInputType = TextInputType.name;
      hint = hint + 'name';
      msg = 'Please enter valid name';
      regExp = nameRegex;
    }

    return TextFormField(
      controller: name,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.all(10),
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
      ),
      keyboardType: textInputType,
      validator: (value) {
        if (!regExp.hasMatch(value) && value.isNotEmpty) {
          return msg;
        } else {
          return null;
        }
      },
    );
  }

  //  CONTAINER FORM
  Container containerForm(String label, TextEditingController name) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 2,
            child: Text(label),
          ),
          Expanded(
            flex: 3,
            child: textFormField(name),
          ),
        ],
      ),
    );
  }
}
