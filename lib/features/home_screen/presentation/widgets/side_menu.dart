import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/core/helpers/extensions.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> signOut() async {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      context.pushNamed("/Login");
    }

    return Drawer(
      width: 230.w,
      backgroundColor: const Color(0xFF241B42),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.settings_rounded,
                    color: Color(0xFFFF8945),
                    size: 28,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Settings",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 18.h),

              Container(
                height: 1,
                color: Colors.white24,
              ),

              SizedBox(height: 25.h),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  leading: const Icon(
                    Icons.person_outline,
                    // color: Color(0xFFFFB26B),
                    color: Color(0xFFFF8945),
                  ),
                  title: const Text(
                    "Profile",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white54,
                  ),
                  onTap: () {
                    context.pushNamed("/ProfileScreen");
                  },
                ),
              ),

              SizedBox(height: 14.h),

              Container(
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  leading: const Icon(
                    Icons.logout_rounded,
                    color: Colors.redAccent,
                  ),
                  title: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: signOut,
                ),
              ),

              const Spacer(),

              Center(
                child: Text(
                  "Movie App v1.0",
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}