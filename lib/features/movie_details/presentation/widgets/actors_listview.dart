import 'package:flutter/material.dart';
import 'package:movie_app/features/movie_details/data/models/movie_cast_response_model.dart';
import 'package:movie_app/features/movie_details/presentation/widgets/actor.dart';

class ActorsListview extends StatelessWidget {
  const ActorsListview({super.key, required this.actorsList});
  final List<CastModel?>? actorsList;

  @override
  Widget build(BuildContext context) {
   return ListView.builder(
     scrollDirection: Axis.horizontal,
     itemCount: actorsList?.length,
     itemBuilder: (context,idx) {
       return Actor(
           actor: actorsList?[idx]
       );
     },

   );
  }
}
