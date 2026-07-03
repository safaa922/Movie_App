import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home_screen/data/models/movies_response_model.dart';
import 'package:movie_app/features/movie_details/logic/firebase_logic/firebase_operation_service.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_cubit.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_state.dart';
import 'package:movie_app/features/profile/presentation/profile_movie_listview.dart';

class ProfileMoviesBlocbuilder extends StatefulWidget {
  const ProfileMoviesBlocbuilder({super.key});

  @override
  State<ProfileMoviesBlocbuilder> createState() => _ProfileMoviesBlocbuilderState();
}

class _ProfileMoviesBlocbuilderState extends State<ProfileMoviesBlocbuilder> {

  List<Movie?>? FavmovieList ;
  List<Movie?>? WatchListMovies ;
  FirebaseOperationService firebaseOperationService = FirebaseOperationService();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MovieDetailsCubit>();

    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        print(state);

        return state.maybeWhen(
          GetProfileMoviesLoading: () =>
          const Center(child: CircularProgressIndicator()),

          GetProfileMoviesSuccess: () {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 14),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Favourite Movies",
                        style: const TextStyle(
                            fontSize: 17.5,
                            color: Colors.white,
                            shadows: [
                              Shadow(color: Color(0xFFFF8945),offset: Offset(0, 0),blurRadius: 20)
                            ]
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 250,
                    child: ProfileMovieListview(
                      movieList: context.read<MovieDetailsCubit>().FavMovies,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 14),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Watch List",
                        style: const TextStyle(
                            fontSize: 17.5,
                            color: Colors.white,
                            shadows: [
                              Shadow(color: Color(0xFFFF8945),offset: Offset(0, 0),blurRadius: 20)
                            ]
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 250,
                    child: ProfileMovieListview(
                      movieList: context.read<MovieDetailsCubit>().WatchListMovies,
                    ),
                  ),
                ],
              )
            );
          },

          GetProfileMoviesError: (e) => Text(e),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
