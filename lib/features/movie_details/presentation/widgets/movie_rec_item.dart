import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/networking/api_constants.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/features/home_screen/data/models/movies_response_model.dart';
import 'package:movie_app/features/movie_details/data/models/recommendations_response_model.dart';
import 'package:movie_app/features/movie_details/logic/details_args.dart';
import 'package:movie_app/features/movie_details/presentation/movie_details_blocbuilder.dart';

class MovieRecItem extends StatelessWidget {
  const MovieRecItem({super.key, required this.movie});

  final RecommendedMovie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(padding: EdgeInsets.all(8),child: Container(
          width: 140.w,
          height: 220.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage("assets/images/card_bg.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: GridTile(
            child: Padding(
              padding: const EdgeInsets.only(top: 7,left: 7,right: 7,bottom: 40),
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(
                    Routes.MovieDetails,
                    arguments: DetailsArgs(
                      id: movie.id,
                      isTv: false,
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
    image: (movie.posterPath.isNotEmpty)
    ? NetworkImage("${ApiConstants.imageBaseUrl}${movie.posterPath}")
        : const AssetImage("assets/images/broken.jpg"),

                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            footer: Container(
                child: Padding(padding: EdgeInsets.all(13),child: Text(
                  movie.title?? "Title",
                  maxLines: 1,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Color(0xFFFFE8CA),fontSize: 12, fontWeight: FontWeight.w500
                  ),
                ),)
            ),
          ),
        ),)
      ],
    );
  }
}
