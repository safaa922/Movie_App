import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoMoviesFound extends StatelessWidget {
  const NoMoviesFound({super.key, required this.txt});

  final String txt;
  @override
  Widget build(BuildContext context) {
      return Center(
        child: Column(

          children: [
            SizedBox(height: 190,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    height: 120.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/neon-Photoroom.png"),fit: BoxFit.cover)
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(txt,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            color: Color(0xFFFF8945),blurRadius: 12
                        )
                      ],),),
                ],
              ),
            )
          ],
        )
    );;
  }
}
