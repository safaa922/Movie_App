import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 113.w,
      height: 44.h,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF221D33), // Same as button
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFF9189).withOpacity(0.4),
              blurRadius: 15,
              spreadRadius: 4,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          style: GoogleFonts.iceland(
            fontSize: 13.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            shadows: const [
              Shadow(
                color: Color(0xFFFF9059),
                blurRadius: 15,
                offset: Offset(0, 0),
              ),
            ],
          ),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            isCollapsed: true,
            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
            hintText: "Name",
            hintStyle: GoogleFonts.iceland(
              fontSize: 13.0,
              color: Colors.white.withOpacity(0.6),
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}