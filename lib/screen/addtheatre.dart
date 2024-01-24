/* import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_1/services/firestore_service.dart';

import 'drawer.dart';

class AddTheatre extends StatefulWidget {
  @override
  State<AddTheatre> createState() => _AddTheatreState();
}

class _AddTheatreState extends State<AddTheatre> {
  String bookAuthor;
  String bookTitle;
  String bookDescription;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Dex ❤️'),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(children: [
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Cinema Name'),
              validator: (val) => val.length == 0 ? "Enter Cinema Name" : null,
              onSaved: (val) => this.theatrename = val,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Book Title'),
              validator: (val) => val.length == 0 ? "Enter Book Title" : null,
              onSaved: (val) => this.theatreaddress = val,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Book Description'),
              validator: (val) =>
                  val.length == 0 ? "Enter Book Description" : null,
              onSaved: (val) => this.latitude = val,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Book Description'),
              validator: (val) =>
                  val.length == 0 ? "Enter Book Description" : null,
              onSaved: (val) => this.longtitude = val,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: RaisedButton(
                onPressed: _submit,
                child: Text('Saved Cinema Record'),
              ),
            )
          ]),
        ),
      )),
    );
  }

  void _submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }

    FirestoreService()
        .addtheatreData(theatrename, theatreaddress, latitude, longtitude);

    Fluttertoast.showToast(
        msg: "Data save successfully", gravity: ToastGravity.TOP);
  }
}
 */