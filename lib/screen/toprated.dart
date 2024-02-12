import 'package:flutter/material.dart';
import 'package:project_1/description.dart';
import 'package:project_1/utility/text.dart';


class TopRatedMovies extends StatefulWidget {
  final List toprated;

  const TopRatedMovies({Key key, this.toprated}) : super(key: key);

  @override
  _TopRatedMoviesState createState() => _TopRatedMoviesState();
}

class _TopRatedMoviesState extends State<TopRatedMovies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Top Rated Movies ⬆️',
            size: 26,
          ),
          SizedBox(height: 10),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.toprated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: widget.toprated[index]['title'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500' +
                              widget.toprated[index]['backdrop_path'],
                          posterurl: 'https://image.tmdb.org/t/p/w500' +
                              widget.toprated[index]['poster_path'],
                          description: widget.toprated[index]['overview'],
                          vote:
                              widget.toprated[index]['vote_average'].toString(),
                          launch_on: widget.toprated[index]['release_date'],
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
                                      widget.toprated[index]['poster_path']),
                            ),
                          ),
                          height: 200,
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: modified_text(
                              size: 15,
                              text: widget.toprated[index]['title'] != null
                                  ? widget.toprated[index]['title']
                                  : 'Loading'),
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
