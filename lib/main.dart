import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/di/dependency_injection.dart';
import 'package:movie_app/my_app.dart';
import 'package:movie_app/core/routing/app_router.dart';

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUpGetIT();
  bool isLoggedIn=false;
  final dio = Dio();

  await ScreenUtil.ensureScreenSize();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
      SystemUiOverlay.bottom
    ]
  );
  runApp( MyApp(appRouter: AppRouter(),));
}
