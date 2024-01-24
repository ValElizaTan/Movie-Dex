import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/UserController.dart';
import 'package:getwidget/getwidget.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Edit Profile',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Image(
                      image: AssetImage("images/editprofile.gif"),
                      width: 60,
                      height: 60,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                containerForm('First Name:', firstName),
                SizedBox(height: 15),
                containerForm('Last Name:', lastName),
                SizedBox(height: 30),
                GFButton(
                  onPressed: () {
                    userController.updateFirstName(firstName.text);
                    userController.updateLastName(lastName.text);
                    Get.off(Profile());
                  },
                  text: "Save Profile",
                  shape: GFButtonShape.pills,
                  icon: Icon(Icons.save_alt_rounded),
                  color: Colors.purpleAccent[700],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
