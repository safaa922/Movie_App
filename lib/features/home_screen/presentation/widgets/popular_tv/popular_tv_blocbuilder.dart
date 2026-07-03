
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home_screen/logic/home_cubit.dart';
import 'package:movie_app/features/home_screen/logic/home_state.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/movie_listview.dart';

class PopularTvBlocbuilder extends StatelessWidget {
  const PopularTvBlocbuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
        buildWhen: (previous, current) {
          return current is Success ||
              current is PopularTVPaginationLoading ||
              current is Loading;
        },
        builder:(context,state){
      final cubit = context.read<HomeCubit>();

      return state.maybeWhen(
        Loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        Success: () {

          return MovieListview(
            controller: cubit.popularTVScrollController,
            movieList: cubit.PopularTV, isTV: true,
          );
        },
        PopularTVPaginationLoading: (){
          return MovieListview(
            controller: cubit.popularTVScrollController,
            movieList: cubit.PopularTV, isTV: true,
          );
        },
        orElse: () => const SizedBox.shrink(),
      );


    });
  }
}
