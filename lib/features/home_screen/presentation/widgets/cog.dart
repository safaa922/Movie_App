
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cog extends StatelessWidget {
   Cog({super.key,required this.scfState});
  GlobalKey<ScaffoldState> scfState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: 50.h,
      right: 20.w,
      child: IconButton(
        onPressed: () {
          scfState.currentState!.openEndDrawer();
        },
        icon: const Icon(
          Icons.settings,
          color: Colors.white,
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
