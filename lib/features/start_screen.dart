
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/features/custom_outlined_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration:BoxDecoration(
              image:  DecorationImage(image: AssetImage("assets/images/start.jpg"),fit: BoxFit.fill,),
            ),
          ),
          Positioned(
              bottom: 120,
              left: 30,
              right: 30,
              child: Center(
                child: CustomOutlinedButton(
                    FontWeight:FontWeight.bold,
                  height: 74.h,
                    width: 220.w,
                    fontSize: 24.0,
                    text: "Get Started",
                    onPressed: (){
                  context.pushNamed("/Login");
                })
              )
          )
        ],
      )
    );
  }
}
