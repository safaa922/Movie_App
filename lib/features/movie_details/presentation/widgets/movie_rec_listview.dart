import 'package:flutter/material.dart';
import 'package:movie_app/features/home_screen/data/models/movies_response_model.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/movie_item.dart';
import 'package:movie_app/features/movie_details/data/models/recommendations_response_model.dart';
import 'package:movie_app/features/movie_details/presentation/widgets/movie_rec_item.dart';
class MovieRecListview extends StatelessWidget {
  const MovieRecListview({super.key, required this.movieList});

  final List<RecommendedMovie> movieList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movieList.length,
      itemBuilder: (context, idx) {
        return MovieRecItem(movie: movieList[idx]);
      },
    );
  }
}