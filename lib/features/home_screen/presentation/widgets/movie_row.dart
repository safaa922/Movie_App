import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MovieRow extends StatelessWidget {
  final Widget widget;
  final String txt;

  const MovieRow({
    super.key,
    required this.widget, required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child:  Text(
            txt,
            style: TextStyle(
              fontSize: 17.5,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Color(0xFFFF8945),
                  blurRadius: 20,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
       Padding(padding: EdgeInsets.all(10),
           child:  SizedBox(
         height: 220.h,
         child: widget,
       ),)
      ],
    );
  }
}