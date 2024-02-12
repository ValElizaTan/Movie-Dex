/* import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_1/screen/drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchTheatre extends StatefulWidget {
  @override
  _SearchTheatreState createState() => _SearchTheatreState();
}

class _SearchTheatreState extends State<SearchTheatre> {
  final apiKey = 'AIzaSyDHNPFTOAgycjGi7tdPTnxWUJy8FAe0koE';
  TextEditingController searchTextController = TextEditingController();
  List<Map<String, dynamic>> theatres = [
    {"name": "Cinema X", "address": "123 Main St"},
    {"name": "Roxie Theatre", "address": "456 Elm St"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Theaters Nearby'),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchTextController,
              decoration: InputDecoration(
                labelText: 'Search Nearby Theaters',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    await searchNearbyTheatresByLocation();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: theatres.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(theatres[index]['name']),
                  subtitle: Text(theatres[index]['address']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> searchNearbyTheatresByLocation() async {
    try {
      theatres = await searchNearbyTheatres(1.3521, 103.8198, apiKey);
      setState(() {});
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<List<Map<String, dynamic>>> searchNearbyTheatres(
      double lat, double lng, String apiKey) async {
    final radius = 5000; // in meters

    final apiUrl =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
        'location=$lat,$lng&radius=$radius&type=movie_theater&key=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data['status'] == 'OK') {
        List<dynamic> results = data['results'];

        List<Map<String, dynamic>> theatres = results.map((result) {
          return {
            'name': result['name'],
            'address': result['vicinity'],
            'latitude': result['geometry']['location']['lat'],
            'longitude': result['geometry']['location']['lng'],
          };
        }).toList();

        return theatres;
      } else {
        throw Exception('Failed to fetch data');
      }
    } else {
      throw Exception(
          'Failed to load data. Status Code: ${response.statusCode}');
    }
  }
}
 */