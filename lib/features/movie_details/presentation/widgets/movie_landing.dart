import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/networking/api_constants.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/cog.dart';
import 'package:movie_app/features/movie_details/logic/firebase_logic/firebase_operation_service.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_cubit.dart';

class MovieLanding extends StatefulWidget {
  const MovieLanding({
    super.key,
    required this.movieId,
    required this.isTv,
  });

  final int? movieId;
  final bool isTv;

  @override
  State<MovieLanding> createState() => _MovieLandingState();
}

class _MovieLandingState extends State<MovieLanding> {
  late GlobalKey<ScaffoldState> landingScfState;

  @override
  void initState() {
    super.initState();

    final cubit = context.read<MovieDetailsCubit>();
    final firebaseService = FirebaseOperationService();

    cubit.GetFav(firebaseService);
    cubit.GetWatchlist(firebaseService);

    if (widget.isTv) {
      cubit.loadTvPage(widget.movieId!);
    } else {
      cubit.loadMoviePage(widget.movieId!);
    }

    landingScfState = cubit.LandingScfState;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MovieDetailsCubit>();
    final firebaseService = FirebaseOperationService();

    final movie = cubit.movieDetailsResponseModel;
    final tv = cubit.tvDetailsResponseModel;

    final isTv = widget.isTv;

    /// ✅ SAFE FIELD SELECTION (NO OBJECT ERROR)
    final id = isTv ? tv?.id : movie?.id;
    final title = isTv ? tv?.name : movie?.title;
    final date = isTv ? tv?.firstAirDate : movie?.releaseDate;
    final overview = isTv ? tv?.overview : movie?.overview;
    final backdropPath = isTv ? tv?.backdropPath : movie?.backdropPath;
    final posterPath = isTv ? tv?.posterPath : movie?.posterPath;

    final genres = (isTv ? tv?.genres : movie?.genres) ?? [];
    final genresText = genres.isNotEmpty
        ? genres.map((g) => g.name).join(" • ")
        : "Genre";

    final isFav = id != null && cubit.favoriteIds.contains(id);
    final isWatchLater = id != null && cubit.WatchIds.contains(id);

    final trailer = cubit.trailerModel;

    /// loading state
    if (id == null) {
      return const SizedBox(
        height: 360,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Stack(
      children: [
        /// BACKDROP
        SizedBox(
          width: double.infinity,
          height: 360.h,
          child: Image.network(
            "${ApiConstants.imageBaseUrl}$backdropPath",
            fit: BoxFit.cover,
          ),
        ),

        /// POSTER
        Positioned(
          left: 30,
          top: 190,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "${ApiConstants.imageBaseUrl}$posterPath",
              width: 110.w,
              height: 159.h,
              fit: BoxFit.cover,
            ),
          ),
        ),

        /// MENU
        Cog(scfState: landingScfState),

        /// PLAY BUTTON
        Positioned(
          bottom: 140.h,
          left: 169.w,
          child: IconButton(
            onPressed: () {
              if (trailer != null) {
                cubit.openTrailer(trailer.key);
              }
            },
            icon: const Icon(
              CupertinoIcons.play_arrow,
              size: 60,
              color: Colors.white,
              shadows: [
                Shadow(color: Color(0xFFFFD9A4), blurRadius: 22),
              ],
            ),
          ),
        ),

        /// FAVORITE + WATCHLIST
        Positioned(
          bottom: 130.h,
          right: 20.w,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  if (id == null) return;

                  if (!isFav) {
                    cubit.AddToFavorite(id, firebaseService);
                  } else {
                    cubit.DeleteFavorite(id, firebaseService);
                  }
                },
                icon: const Icon(Icons.favorite),
                color: isFav ? Colors.red : Colors.grey,
              ),

              IconButton(
                onPressed: () {
                  if (id == null) return;

                  if (!isWatchLater) {
                    cubit.AddToWatchlist(id, firebaseService);
                  } else {
                    cubit.DeleteWatchlist(id, firebaseService);
                  }
                },
                icon: const Icon(Icons.access_time),
                color: isWatchLater ? const Color(0xFFFFCB82) : Colors.grey,
              ),
            ],
          ),
        ),

        /// TITLE
        Positioned(
          bottom: 240.h,
          left: 30.w,
          child: Text(
            title ?? "Unknown",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        /// GENRES
        Positioned(
          bottom: 218.h,
          left: 30.w,
          child: Text(
            "($genresText)",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        /// DATE
        Positioned(
          bottom: 196.h,
          left: 30.w,
          child: Text(
            date ?? "Date",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        /// OVERVIEW
        Positioned(
          bottom: 30.h,
          left: 160.w,
          child: SizedBox(
            width: 200.w,
            height: 100.h,
            child: SingleChildScrollView(
              child: Text(
                overview ?? "",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}