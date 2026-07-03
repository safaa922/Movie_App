

import 'package:flutter/material.dart';
import 'package:movie_app/features/home_screen/data/models/movies_response_model.dart';
import 'package:movie_app/features/search/presentation/search_item.dart';

class SearchListview extends StatelessWidget {
  const SearchListview({super.key, required this.movies});

  final List<Movie>movies;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context,idx){
          final movie = movies[idx];
          return SearchItem(movie: movie,);
        });;
  }
}
