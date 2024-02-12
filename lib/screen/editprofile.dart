import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/UserController.dart';
import 'package:getwidget/getwidget.dart';

import 'drawer.dart';
import 'profile.dart';

class EditProfile extends StatelessWidget {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Image(
                    image: AssetImage("images/editprofile.gif"),
                    width: 60,
                    height: 60,
                  ),
                ],
              ),
              SizedBox(height: 30),
              _buildTextField('First Name', firstName),
              SizedBox(height: 15),
              _buildTextField('Last Name', lastName),
              SizedBox(height: 30),
              GFButton(
                onPressed: _saveProfile,
                text: "Save Profile",
                shape: GFButtonShape.pills,
                icon: Icon(Icons.save_alt_rounded),
                color: Colors.cyan[700],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveProfile() {
    userController.updateFirstName(firstName.text);
    userController.updateLastName(lastName.text);
    Get.off(Profile());
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.cyan[700], width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.cyan[700], width: 2),
        ),
      ),
      style: TextStyle(color: Colors.white),
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value.trim().isEmpty) {
          return 'Please enter your $label';
        }
        return null;
      },
    );
  }
}
