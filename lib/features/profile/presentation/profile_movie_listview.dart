import 'package:flutter/material.dart';
import 'package:movie_app/features/movie_details/data/models/movie_details_response_model.dart';
import 'package:movie_app/features/profile/presentation/profile_movie_item.dart';

class ProfileMovieListview extends StatelessWidget {
  const ProfileMovieListview({super.key, this.movieList});
  final List<MovieDetailsResponseModel?>? movieList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieList!.length,
        itemBuilder: (context,idx){
          return ProfileMovieItem(movie: movieList![idx]!);
        }
    );
  }
}
