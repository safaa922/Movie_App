import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home_screen/data/models/movies_response_model.dart';
import 'package:movie_app/features/home_screen/logic/home_cubit.dart';
import 'package:movie_app/features/home_screen/logic/home_state.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/movie_listview.dart';

class TopRatedMoviesBlocbuilder extends StatelessWidget {
  const TopRatedMoviesBlocbuilder({super.key});

  @override

  Widget build(BuildContext context) {

    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return current is Success ||
            current is TopRatedMoviesPaginationLoading ||
            current is Loading;
      },
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        return state.maybeWhen(
          Loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          Success: () {

            return MovieListview(
              controller: cubit.topRatedMoviesScrollController,
              movieList: cubit.TopRatedMovies, isTV: false,
            );
          },
          TopRatedMoviesPaginationLoading: () {
            return MovieListview(
              controller: cubit.topRatedMoviesScrollController,
              movieList: cubit.TopRatedMovies, isTV: false,
            );
          },


          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
