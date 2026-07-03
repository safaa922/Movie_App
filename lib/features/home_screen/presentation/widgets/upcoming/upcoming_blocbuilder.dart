

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home_screen/data/models/movies_response_model.dart';
import 'package:movie_app/features/home_screen/logic/home_cubit.dart';
import 'package:movie_app/features/home_screen/logic/home_state.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/movie_listview.dart';

class UpcomingBlocbuilder extends StatelessWidget {
  const UpcomingBlocbuilder({super.key});

  @override

  Widget build(BuildContext context) {

    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return current is Success ||
            current is UpcomingPaginationLoading ||
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
              controller: cubit.upcomingScrollController,
              movieList: cubit.upcomingMovies, isTV: false,
            );
          },
          UpcomingPaginationLoading: () {
            return MovieListview(
              controller: cubit.upcomingScrollController,
              movieList: cubit.upcomingMovies, isTV: false,
            );
          },


          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
