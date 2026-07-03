import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/networking/api_constants.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/features/custom_outlined_button.dart';
import 'package:movie_app/features/home_screen/data/models/movies_response_model.dart';
import 'package:movie_app/features/movie_details/presentation/movie_details_blocbuilder.dart';

class FullScreenItem extends StatelessWidget {
  const FullScreenItem({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
         Container(
          width: MediaQuery.of(context).size.width,
          height: 380.h,
          child: GridTile(
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(
                    Routes.MovieDetails,
                    arguments: movie.id,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: (movie.backdropPath?.isNotEmpty ?? false)
                          ? NetworkImage(
                        "${ApiConstants.imageBaseUrl}${movie.backdropPath!}",
                      )
                          : const AssetImage("assets/images/broken.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ),

          ),
         ),
        Positioned(
          bottom: 30.h,
          right: 20.w,
          child: CustomOutlinedButton(
              height: 44.h,
              fontSize: 16.0,
              width: 113.w,
              text: "Watch Trailer",
              onPressed: (){

              }),
        ),

        Positioned(
          bottom: 140.h,
          left: 20.w,
          child:Text(movie.title?? "Title",
            style: TextStyle(
              color: Color(0xFFFFFFFF),
            fontSize: 25,
              fontWeight: FontWeight.bold
          ),)
        ),

        Positioned(
          bottom: 80.h,
          left: 20.w,
          child: SizedBox(
            width: 220.w, // adjust as needed
            child: Text(
              movie.overview ?? "",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ]
        );

  }
}
