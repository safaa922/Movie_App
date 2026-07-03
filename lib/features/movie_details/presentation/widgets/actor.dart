import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/networking/api_constants.dart';
import 'package:movie_app/features/movie_details/data/models/movie_cast_response_model.dart';

class Actor extends StatelessWidget {
  const Actor({super.key, required this.actor});
  final CastModel? actor;
  @override
  Widget build(BuildContext context) {

    if (actor == null || actor!.profilePath == null) {
      return Image.asset("assets/images/broken.jpg",fit: BoxFit.fill,);
    }

    return Padding(
      padding: EdgeInsets.all(7),
      child: Container(
        decoration: BoxDecoration(

        ),
        width: 110.w,
        height: 190.h,
      child: GridTile(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              "${ApiConstants.imageBaseUrl}${actor!.profilePath}",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        footer: Padding(
            padding: EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 6),
        child: Text(
          actor!.name??"name",
          maxLines: 1,
          style: TextStyle(
            fontSize: 13,
            color: Colors.white,
              overflow: TextOverflow.ellipsis
          ),
        ),
        )
      )
    ),);
  }
}
