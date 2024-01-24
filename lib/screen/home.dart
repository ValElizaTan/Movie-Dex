import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/screen/toprated.dart';
import 'package:project_1/screen/trending.dart';

import 'package:project_1/utility/text.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apikey = '7c8b931265aec52c8b9b9ee661ae729a';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3YzhiOTMxMjY1YWVjNTJjOGI5YjllZTY2MWFlNzI5YSIsInN1YiI6IjY1NTQ3OGFjYWM0MTYxMDBhZDI3ZDI4OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Y8X6I5tEaojJt9cxreAWroIkFNdqDJQBzYZH9Gpnm4Y';
  List trendingmovies = [];
  List topratedmovies = [];
  List searchResults = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    print((trendingresult));
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Dex ❤️'),
      ),
      drawer: MyDrawer(),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          searchTF(),
          SizedBox(
            height: 30,
          ),
          if (searchResults.isNotEmpty)
            SearchResults(searchResults: searchResults)
          else
            Column(
              children: [
                TrendingMovies(
                  trending: trendingmovies,
                ),
                TopRatedMovies(
                  toprated: topratedmovies,
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget searchTF() {
    return TextField(
      onChanged: (query) {
        if (query.isNotEmpty) {
          searchMovies(query);
        } else {
          setState(() {
            searchResults = [];
          });
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(5.0),
          ),
        ),
        filled: true,
        fillColor: Colors.white60,
        contentPadding: EdgeInsets.all(15.0),
        hintText: 'Search movies on TMDb',
      ),
    );
  }

  searchMovies(String query) async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map searchResult = await tmdbWithCustomLogs.v3.search.queryMulti(query);
    List movies = searchResult['results'];

    setState(() {
      searchResults = movies;
    });
  }
}

class SearchResults extends StatelessWidget {
  final List<dynamic> searchResults;

  SearchResults({this.searchResults});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: searchResults
          .map(
            (result) => ListTile(
              title: Text(result['title'] ?? 'Title not available'),
              subtitle: Text(result['overview'] ?? 'Overview not available'),
              leading: result['poster_path'] != null
                  ? Image.network(
                      'https://image.tmdb.org/t/p/w92${result['poster_path']}',
                    )
                  : Container(),
              onTap: () {
                Get.to(() => DescriptionScreen(result: result));
              },
            ),
          )
          .toList(),
    );
  }
}

class DescriptionScreen extends StatelessWidget {
  final dynamic result;

  DescriptionScreen({this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/original${result['backdrop_path']}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Text(
                    '⭐ Average Rating - ${result['vote_average'] ?? 'Not available'}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              result['title'] ?? 'Not Loaded',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Releasing On - ${result['release_date'] ?? 'Not available'}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                height: 200,
                width: 100,
                child: Image.network(
                  'https://image.tmdb.org/t/p/w300${result['poster_path']}',
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    result['overview'] ?? 'Not available',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
