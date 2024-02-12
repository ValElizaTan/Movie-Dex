import 'package:flutter/material.dart';
import 'package:project_1/model/cinema.dart';
import 'package:project_1/services/firestore_service.dart';

import 'drawer.dart';
import 'map.dart'; 
class SearchCinema extends StatefulWidget {
  @override
  State<SearchCinema> createState() => _SearchCinemaState();
}

class _SearchCinemaState extends State<SearchCinema> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cinema Records'),
      ),
      drawer: MyDrawer(),
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
                      Column(
                        children: [
                          Text(
                            snapshot.data[index].name,
                            style: TextStyle(color: Colors.blue, fontSize: 16.0),
                          ),
                          Text(
                            snapshot.data[index].address,
                            style: TextStyle(color: Colors.white, fontSize: 12.0),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            snapshot.data[index].latitude,
                            style: TextStyle(color: Colors.white, fontSize: 12.0),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            snapshot.data[index].longitude,
                            style: TextStyle(color: Colors.white, fontSize: 12.0),
                          )
                        ],
                      ),
                      IconButton(
                        color: Colors.blue,
                        icon: Icon(Icons.map_rounded),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapPage(
                                cinemaLatitude: double.parse(snapshot.data[index].latitude),
                                cinemaLongitude: double.parse(snapshot.data[index].longitude),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

