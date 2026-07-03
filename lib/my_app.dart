
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/networking/api_service.dart';
import 'package:movie_app/core/routing/app_router.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movie_app/features/home_screen/presentation/home_screen.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
       initialRoute: FirebaseAuth.instance.currentUser==null? Routes.StartScreen: Routes.HomeScreen,
        onGenerateRoute: appRouter.generateRoutes,
      )
    );
  }
}
