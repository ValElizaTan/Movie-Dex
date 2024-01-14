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
  List tv = [];

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
          TrendingMovies(
            trending: trendingmovies,
          ),
          TopRatedMovies(
            toprated: topratedmovies,
          ),
        ],
      ),
    );
  }
}
