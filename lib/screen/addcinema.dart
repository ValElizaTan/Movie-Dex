import 'package:flutter/material.dart';
import 'package:project_1/services/firestore_service.dart';

import 'package:fluttertoast/fluttertoast.dart';

class AddCinemaPage extends StatefulWidget {
  @override
  State<AddCinemaPage> createState() => _AddCinemaPageState();
}

class _AddCinemaPageState extends State<AddCinemaPage> {
  String name;
  String address;
  String latitude;
  String longitude;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Saving Cinema'), actions: <Widget>[]),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(children: [
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (val) => val.length == 0 ? "Enter Cinema Name" : null,
              onSaved: (val) => this.name = val,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Cinema Address'),
              validator: (val) => val.length == 0 ? "Enter Cinema Address" : null,
              onSaved: (val) => this.address = val,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Cinema Latitude'),
              validator: (val) =>
                  val.length == 0 ? "Enter Cinema Latitude" : null,
              onSaved: (val) => this.latitude = val,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Cinema longitude'),
              validator: (val) =>
                  val.length == 0 ? "Enter Cinema longitude" : null,
              onSaved: (val) => this.longitude = val,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: RaisedButton(
                onPressed: _submit,
                child: Text('Saved Book Cinema'),
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

    FirestoreService().addCinemaData(name, address, latitude, longitude);

    Fluttertoast.showToast(
        msg: "Data save successfully", gravity: ToastGravity.TOP);
  }
}
