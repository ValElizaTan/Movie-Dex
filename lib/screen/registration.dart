import 'package:flutter/material.dart';
import 'package:project_1/services/firebaseauth_service.dart';

import '../style.dart';
import 'home.dart';
import 'login.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Controllers for email & pwd
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cfmpasswordController = TextEditingController();

  bool signUp = true;
  bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image(
              image: AssetImage("images/registerbtn.png"),
              fit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  errorText:
                      !emailRegex.hasMatch(emailController.text.trim()) &&
                              emailController.text.isNotEmpty
                          ? 'Enter a valid email address'
                          : null,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                controller: passwordController,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: 'Enter your password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  errorText: !pwdRegex
                              .hasMatch(passwordController.text.trim()) &&
                          passwordController.text.isNotEmpty
                      ? 'Password must contain at least 6 characters, including uppercase, lowercase, numbers, and special characters'
                      : null,
                ),
              ),
            ),
            RaisedButton(
              color: Colors.lightBlueAccent[100],
              padding: EdgeInsets.fromLTRB(100, 10, 100, 20),
              onPressed: () async {
                if (validateFields()) {
                  if (signUp) {
                    var newuser = await FirebaseAuthService().signUp(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                    if (newuser != null) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    }
                  } else {
                    var reguser = await FirebaseAuthService().signIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                    if (reguser != null) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    }
                  }
                }
              },
              child: Text(
                signUp ? 'Sign Up' : 'Sign In',
                style: ButtonTextStyle,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text("Have an account? Sign In"),
            ),
          ],
        ),
      ),
    );
  }

  //  VALIDATION
  final RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  final RegExp pwdRegex = new RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  final RegExp cfmpwdRegex = new RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  final RegExp nameRegex =
      new RegExp(r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$");

  final RegExp phoneRegex = new RegExp(r'^(6|8|9)\d{7}$');

  //  TEXT FORM
  TextFormField textFormField(TextEditingController name) {
    TextInputType textInputType;
    String hint = 'Please enter your ';
    String msg;
    RegExp regExp;

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

  bool validateFields() {
    bool isValid = true;

    if (!emailRegex.hasMatch(emailController.text.trim()) ||
        emailController.text.isEmpty) {
      isValid = false;
    }

    if (!pwdRegex.hasMatch(passwordController.text.trim()) ||
        passwordController.text.isEmpty) {
      isValid = false;
    }

    setState(() {});

    return isValid;
  }
}
