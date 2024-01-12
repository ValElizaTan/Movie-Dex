import 'package:flutter/material.dart';

void showDialogOK(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (_) => new AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
      ),
      title: new Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}
