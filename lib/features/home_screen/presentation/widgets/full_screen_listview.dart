import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/routing/app_router.dart';
import 'package:movie_app/features/home_screen/data/models/movies_response_model.dart';
import 'package:movie_app/features/home_screen/logic/home_cubit.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/movie_item.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/trending/full_screen_item.dart';

class FullScreenListview extends StatelessWidget {
  const FullScreenListview({super.key, this.movieList, required this.controller});
  final List<Movie?>? movieList;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: PageController(viewportFraction: 1),
        scrollDirection: Axis.horizontal,
        itemCount: movieList!.length ,
        itemBuilder: (context,idx){
          return FullScreenItem(movie: movieList![idx]!);
        }
    );
  }
}
