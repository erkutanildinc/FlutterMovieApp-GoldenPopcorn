import 'package:flutter/material.dart';

import '../screens/movie_details.dart';
import 'movie_card.dart';

class MovieGridList extends StatelessWidget {
  List movieList;
  List genreNames;
  bool borderFlag;
  var listHeight;
  final String baseURL = "https://image.tmdb.org/t/p/w500/";

  MovieGridList({@required this.movieList, @required this.borderFlag,@required this.genreNames,this.listHeight});

  @override
  Widget build(BuildContext context) 
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          height: listHeight,
          child: GridView.builder(
              gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            childAspectRatio: 0.75,
                          ),
              itemCount: movieList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetails(
                          movie_genres: movieList[index]["genre_ids"],
                          movie_title: movieList[index]["title"],
                          movie_overview: movieList[index]["overview"],
                          movie_id: movieList[index]["id"],
                          movie_posterURL: baseURL+movieList[index]["poster_path"],
                          movie_backdropURL: baseURL+movieList[index]["backdrop_path"],
                          movie_releaseDate: movieList[index]["release_date"],                                  
                          movie_vote: (movieList[index]["vote_average"]).toDouble(),
                          genre_names: genreNames,
                          movie_language: movieList[index]["original_language"],
                        ),
                      ),
                    );
                  },
                  child: MovieCard(
                      imagePath: baseURL + movieList[index]["poster_path"],
                      borderFlag: borderFlag,
                      releaseDate: movieList[index]["release_date"],
                      title: movieList[index]["title"]),
                );
              })),
        ),
      ),
    );
  }
}