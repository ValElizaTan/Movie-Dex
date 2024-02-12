import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_1/model/cinema.dart';
import 'package:project_1/services/firestore_service.dart';

class RecordsPage extends StatefulWidget {
  @override
  State<RecordsPage> createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cinema Records'),
      ),
      body: FutureBuilder<List<Cinema>>(
        future: FirestoreService().readCinemaData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          snapshot.data[index].name,
                          style: TextStyle(color: Colors.blue, fontSize: 16.0),
                        ),
                        Column(
                          children: [
                            Text(
                              snapshot.data[index].address,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 12.0),
                            ),
                            Text(
                              snapshot.data[index].latitude,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 12.0),
                            ),
                            Text(
                              snapshot.data[index].longitude,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 12.0),
                            )
                          ],
                        ),
                        IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            setState(() {
                              FirestoreService()
                                  .deleteCinemaData(snapshot.data[index].uid);
                            });
                            Fluttertoast.showToast(
                                msg: "Data deleted successfulyy",
                                gravity: ToastGravity.TOP);
                          },
                        )
                      ],
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Container(
            alignment: AlignmentDirectional.center,
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
