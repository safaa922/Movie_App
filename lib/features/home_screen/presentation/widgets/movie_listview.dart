import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/routing/app_router.dart';
import 'package:movie_app/features/home_screen/data/models/movies_response_model.dart';
import 'package:movie_app/features/home_screen/logic/home_cubit.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/movie_item.dart';

class MovieListview extends StatelessWidget {
  const MovieListview({super.key, this.movieList, required this.controller, required this.isTV});
  final List<Movie?>? movieList;
  final ScrollController controller;
  final bool isTV;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      scrollDirection: Axis.horizontal,
      itemCount: movieList!.length ,
        itemBuilder: (context,idx){
          return MovieItem(movie: movieList![idx]!, isTV: isTV,);
        }
        );
  }
}
