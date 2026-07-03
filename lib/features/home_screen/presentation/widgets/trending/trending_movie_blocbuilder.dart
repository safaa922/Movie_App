
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/networking/api_error_handler.dart';
import 'package:movie_app/features/home_screen/logic/home_cubit.dart';
import 'package:movie_app/features/home_screen/logic/home_state.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/full_screen_listview.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/movie_listview.dart';

class TrendingMovieBlocbuilder extends StatelessWidget {
  const TrendingMovieBlocbuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return current is Success ||
            current is TrendingPaginationLoading ||
            current is Loading;
      },
      builder: (context, state) {
        return state.maybeWhen(
          Loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          Success: () {
            return FullScreenListview(
              movieList: cubit.trendingMovieList, controller: cubit.trendingScrollController,
            );
          },

          TrendingPaginationLoading: () {
            return MovieListview(
              controller: cubit.trendingScrollController,
              movieList: cubit.trendingMovieList, isTV: false,
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
