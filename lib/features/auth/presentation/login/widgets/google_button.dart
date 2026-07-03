import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Or Login With", style: const TextStyle(
          color: Colors.white,
          shadows: [
            Shadow(color: Color(0xFF838FFF),offset: Offset(0, 0),blurRadius: 20)
          ]
      ),),
      const SizedBox(width: 10),
    GestureDetector(
    onTap: onPressed,
    child: Image.asset("assets/images/google-removebg-preview.png")
    ),
    ],
    )
    );
  }
}