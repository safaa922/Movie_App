import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final width;
  final height;
  final fontSize;
  final FontWeight;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed, this.width, this.height, this.fontSize, this.FontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: GestureDetector(
            onTap: onPressed,
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    color: Color(0xFF221D33),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFFF9189).withOpacity(0.4),
                          blurRadius: 15,
                          spreadRadius: 4,
                          offset: Offset(0,0)
                      )
                    ]
                ),

            child:Center(
          child: Text(
          text,
          style: GoogleFonts.iceland(
              fontSize: fontSize,
              color: Colors.white,
              fontWeight: FontWeight,
              shadows: [
                Shadow(color: Color(0xFFFF9059,),
                    blurRadius: 15,
                    offset: Offset(0,0))
              ]
          ),),
      )
        ),
      )
    );
  }
}