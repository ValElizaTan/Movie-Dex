import 'package:flutter/material.dart';
import 'package:project_1/description.dart';
import 'package:project_1/utility/text.dart';


class TrendingMovies extends StatefulWidget {
  final List trending;

  const TrendingMovies({Key key, this.trending}) : super(key: key);

  @override
  _TrendingMoviesState createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Trending Movies 👍',
            size: 26,
          ),
          SizedBox(height: 10),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: widget.trending[index]['title'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500' +
                              widget.trending[index]['backdrop_path'],
                          posterurl: 'https://image.tmdb.org/t/p/w500' +
                              widget.trending[index]['poster_path'],
                          description: widget.trending[index]['overview'],
                          vote:
                              widget.trending[index]['vote_average'].toString(),
                          launch_on: widget.trending[index]['release_date'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      widget.trending[index]['poster_path']),
                            ),
                          ),
                          height: 200,
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: modified_text(
                              size: 15,
                              text: widget.trending[index]['title'] != null
                                  ? widget.trending[index]['title']
                                  : 'Not Available'),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
