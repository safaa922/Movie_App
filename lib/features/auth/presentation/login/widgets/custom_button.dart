import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final height;
  final width;
  final fontSize;
  final FontWeight;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed, this.height, this.width, this.fontSize, this.FontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            boxShadow: [
             BoxShadow(
               color: Color(0xFFFF9189).withOpacity(0.34),
               offset: Offset(0, 0),
               blurRadius: 15,
             )
            ],
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(colors: [
              Color(0xFFFF594D),
              Color(0xFF5D76EF),
            ])
          ),
          child: Center(
            child: Text(text,style: GoogleFonts.iceland(color: Colors.white,fontSize: fontSize,fontWeight:FontWeight),),
          ),
        ));

  }
}