import 'package:flutter/material.dart';
import 'package:project_1/utility/dialogutil.dart';

import '../style.dart';
import 'drawer.dart';

final _formKey = GlobalKey<FormState>();
class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();

  void dispose() {
    firstName.dispose();
    lastName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 60,
        title: Text('Register', style: AppBarTextStyle),
        backgroundColor: Colors.cyan[300],
      ),
      backgroundColor: Colors.cyan[50],
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
                containerForm('First Name:', firstName),
                containerForm('Last Name:', lastName),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: FlatButton(
                    padding: EdgeInsets.fromLTRB(120, 10, 120, 20),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        save();
                        showDialogOK(context, 'Save',
                            'Profile Saved!');
                      } else {
                        showDialogOK(
                            context, 'Error', 'Form entry is incomplete!');
                      }
                    },
                    color: Colors.cyan[400],
                    child: Text(
                      'Register',
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
  save() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    if (firstName.text != '') {
      await sp.setString('firstName', firstName.text);
    }
    if (lastName.text != '') {
      await sp.setString('lastName', lastName.text);
    }
    if (email.text != '') {
      await sp.setString('email', email.text);
    }
    if (phone.text != '') {
      await sp.setString('phone', phone.text);
    }
  }

  //  VALIDATION
  final RegExp nameRegex =
      new RegExp(r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$");

  final RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  final RegExp phoneRegex = new RegExp(r'^(6|8|9)\d{7}$');

  //  TEXT FORM
  TextFormField textFormField(TextEditingController name) {
    TextInputType textInputType;
    String hint = 'Please enter your ';
    String msg;
    RegExp regExp;

    if (name == this.email) {
      textInputType = TextInputType.emailAddress;
      hint = hint + 'email';
      msg = 'Please enter valid email';
      regExp = emailRegex;
    } else if (name == this.phone) {
      textInputType = TextInputType.phone;
      hint = hint + 'phone';
      msg = 'Please enter valid local phone number';
      regExp = phoneRegex;
    } else if (name == this.firstName || name == this.lastName) {
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
