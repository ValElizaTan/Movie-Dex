import 'package:flutter/material.dart';
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
          .map((result) => ListTile(
                title: Text(result['title'] ??
                    'Title not available'), // Provide a default value if result['title'] is null
                subtitle: Text(result['overview'] ??
                    'Overview not available'), // Provide a default value if result['overview'] is null
                leading: result['poster_path'] != null
                    ? Image.network(
                        'https://image.tmdb.org/t/p/w92${result['poster_path']}',
                      )
                    : Container(), // You can replace Container() with a placeholder image or text
              ))
          .toList(),
    );
  }
}
