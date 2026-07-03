import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/di/dependency_injection.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/features/auth/logic/auth_cubit.dart';
import 'package:movie_app/features/auth/presentation/signup/signup_screen.dart';
import 'package:movie_app/features/home_screen/logic/home_cubit.dart';
import 'package:movie_app/features/home_screen/presentation/home_screen.dart';
import 'package:movie_app/features/movie_details/logic/details_args.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_cubit.dart';
import 'package:movie_app/features/movie_details/presentation/movie_details_screen.dart';
import 'package:movie_app/features/profile/logic/profile_cubit.dart';
import 'package:movie_app/features/profile/presentation/profile_screen.dart';
import 'package:movie_app/features/search/logic/search_cubit.dart';
import 'package:movie_app/features/search/presentation/search_screen.dart';
import 'package:movie_app/features/start_screen.dart';

import '../../features/auth/presentation/login/login_screen.dart';

class AppRouter{
  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {

      case Routes.HomeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getit<HomeCubit>(),
            child: const HomeScreen(),
          ),
        );

      case Routes.MovieDetails:

        final args = settings.arguments as DetailsArgs;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getit<MovieDetailsCubit>(),
            child: MovieDetailsScreen(
              movieId: args.id,
              isTv: args.isTv,
            ),
          ),
        );
      case Routes.ProfileScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<ProfileCubit>(
                create: (_) => getit<ProfileCubit>(),
              ),
              BlocProvider<MovieDetailsCubit>(
                create: (_) => getit<MovieDetailsCubit>(),
              ),
            ],
            child: const ProfileScreen(),
          ),
        );

      case Routes.StartScreen:
        return MaterialPageRoute(
            builder: (context)=> StartScreen()
        );

      case Routes.Login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getit<AuthCubit>(),
            child:  LoginScreen(),
          ),
        );

      case Routes.Signup:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getit<AuthCubit>(),
            child:  SignupScreen(),
          ),
        );

      case Routes.SearchScreen:
        return MaterialPageRoute(builder: (_)=>BlocProvider(
          create: (_)=>getit<SearchCubit>(),child: const SearchScreen(),),);
      default:
        return null;
    }
  }
}