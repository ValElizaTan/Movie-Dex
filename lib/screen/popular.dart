import 'package:flutter/material.dart';
import 'package:project_1/description.dart';
import 'package:project_1/utility/text.dart';

class PopularMovies extends StatefulWidget {
  final List popular;

  const PopularMovies({Key key, this.popular}) : super(key: key);

  @override
  _PopularMoviesState createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Popular Movies ❤️',
            size: 26,
          ),
          SizedBox(height: 10),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.popular.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: widget.popular[index]['title'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500' +
                              widget.popular[index]['backdrop_path'],
                          posterurl: 'https://image.tmdb.org/t/p/w500' +
                              widget.popular[index]['poster_path'],
                          description: widget.popular[index]['overview'],
                          vote:
                              widget.popular[index]['vote_average'].toString(),
                          launch_on: widget.popular[index]['release_date'],
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
                                      widget.popular[index]['poster_path']),
                            ),
                          ),
                          height: 200,
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: modified_text(
                              size: 15,
                              text: widget.popular[index]['title'] != null
                                  ? widget.popular[index]['title']
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
