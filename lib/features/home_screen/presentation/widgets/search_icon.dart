
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/extensions.dart';

class SearchIcon extends StatelessWidget {
  SearchIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: 50.h,
      left: 20.w,
      child: IconButton(
        onPressed: () {
          context.pushNamed("/SearchScreen");
        },
        icon: const Icon(
          Icons.search_rounded,
          color: Colors.white,
          size: 31,
          shadows: [
            Shadow(
                color: Color(0xFFFF8945),blurRadius: 12
            )
          ],
        ),
      ),
    );
  }
}
