import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/features/home_screen/data/models/movies_response_model.dart';
import 'package:movie_app/features/movie_details/logic/details_args.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        height: 140,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: movie.posterPath != null
                  ? Image.network(
                "https://image.tmdb.org/t/p/w300${movie.posterPath}",
                width: 90,
                height: 140,
                fit: BoxFit.cover,
              )
                  : Container(
                width: 90,
                height: 140,
                color: Colors.grey.shade800,
                child: const Icon(
                  Icons.movie,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      movie.releaseDate ?? '',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.star_outlined,color: Color(0xFFFF8945),shadows: [Shadow(color: Color(0xFFFF8945))],size: 19,),
                        SizedBox(width: 6,),
                        Text(
                          movie.voteAverage.toString() ?? '',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}