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
        title: Text(
          'Cinemas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
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
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  snapshot.data[index].name,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Center(
                                child: Text(
                                  snapshot.data[index].address,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.map_rounded),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MapPage(
                                  cinemaLatitude: double.parse(
                                      snapshot.data[index].latitude),
                                  cinemaLongitude: double.parse(
                                      snapshot.data[index].longitude),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "${snapshot.error}",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16.0,
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}