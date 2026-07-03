import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/side_menu.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_cubit.dart';
import 'package:movie_app/features/movie_details/presentation/movie_details_blocbuilder.dart';
import 'package:movie_app/features/movie_details/presentation/widgets/movie_landing.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key, required this.movieId, required this.isTv});
  final int? movieId;
  final bool isTv;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {

  late YoutubePlayerController controller;
  late List<int>watchList;
  late List<int>favList;
  GlobalKey<ScaffoldState> LandingScfState = GlobalKey();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<MovieDetailsCubit>();
    if (widget.isTv) {
      cubit.loadTvPage(widget.movieId!);
    } else {
      cubit.loadMoviePage(widget.movieId!);
    }
    LandingScfState = cubit.LandingScfState;
  }
  @override
  Widget build(BuildContext context) {



    final cubit = context.watch<MovieDetailsCubit>();
    final movie = cubit.movieDetailsResponseModel;
    final tv = cubit.tvDetailsResponseModel;

    final isFav = movie != null && cubit.favoriteIds.contains(movie.id);
    final isWatchLater = movie != null && cubit.WatchIds.contains(movie.id);
    final trailer = cubit.trailerModel;
    print("movie: $movie");
    print("trailer: $trailer");
    if (!widget.isTv && movie == null) {
      return const Center(
        child: SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (widget.isTv && tv == null) {
      return const Center(
        child: SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(),
        ),
      );
    }
    final id = widget.isTv
        ? tv!.id
        : movie!.id;
    return Scaffold(
      key: LandingScfState,
      endDrawer: SideMenu(),
      backgroundColor: Color(0xFF1C1434),
      body: Column(
          children: [
            MovieLanding(
              movieId: id,
              isTv: widget.isTv,
            ),

            Expanded(
              child: MovieDetailsBlocbuilder(
                movieId: id,
                // isTv: widget.isTv,
              ),
            ),
          ],
        ),
    );

  }


}

