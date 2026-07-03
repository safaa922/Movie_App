import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/home_screen/logic/home_cubit.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/cog.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/movie_item.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/movie_row.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/popular_movies_blocbuilder.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/popular_tv/popular_tv_blocbuilder.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/search_icon.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/side_menu.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/top_rated_movies/top_rated_movies_blocbuilder.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/top_rated_tv/top_rated_tv_blocbuilder.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/trending/trending_movie_blocbuilder.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/upcoming/upcoming_blocbuilder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   ScrollController popularScrollController = ScrollController();
   ScrollController trendingScrollController = ScrollController();
   ScrollController topRatedTVScrollController = ScrollController();
   ScrollController topRatedMoviesScrollController = ScrollController();
   ScrollController UpcomingScrollController = ScrollController();
   ScrollController popularTVScrollController = ScrollController();
  @override
  void initState(){
    super.initState();
    context.read<HomeCubit>().loadHomeData();
    popularScrollController=context.read<HomeCubit>().popularScrollController;
    trendingScrollController=context.read<HomeCubit>().trendingScrollController;
    topRatedTVScrollController = context.read<HomeCubit>().topRatedTVScrollController;
    UpcomingScrollController = context.read<HomeCubit>().upcomingScrollController;
    topRatedMoviesScrollController = context.read<HomeCubit>().topRatedMoviesScrollController;
    popularTVScrollController = context.read<HomeCubit>().popularTVScrollController;

    popularScrollController.addListener((){
      if(popularScrollController.position.pixels>=popularScrollController.position.maxScrollExtent-200){
        context.read<HomeCubit>().LoadMorePopularMovies();
      }
    });

    trendingScrollController.addListener((){
      if(trendingScrollController.position.pixels>=trendingScrollController.position.maxScrollExtent-200){
        context.read<HomeCubit>().LoadMoreTrending();
      }
    });

    topRatedTVScrollController.addListener((){
      if(topRatedTVScrollController.position.pixels>= topRatedTVScrollController.position.maxScrollExtent-200){
        context.read<HomeCubit>().LoadMoreTopRatedTV();
      }
    });

    UpcomingScrollController.addListener((){
      if(UpcomingScrollController.position.pixels>= UpcomingScrollController.position.maxScrollExtent-200){
        context.read<HomeCubit>().LoadMoreUpcoming();
      }
    });

    popularTVScrollController.addListener((){
      if(popularTVScrollController.position.pixels>= popularTVScrollController.position.maxScrollExtent-200){
        context.read<HomeCubit>().LoadMorePopularTV();
      }
    });

    topRatedMoviesScrollController.addListener((){
      if(topRatedMoviesScrollController.position.pixels>= topRatedMoviesScrollController.position.maxScrollExtent-200){
        context.read<HomeCubit>().LoadMoreTopRatedMovies();
      }
    });

  }


GlobalKey<ScaffoldState> scfState = GlobalKey();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF1C1434),
      endDrawer: SideMenu(),
      key: scfState,

      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              height: 320.h,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: TrendingMovieBlocbuilder(),
                  ),

                  Cog( scfState: scfState,),
                  SearchIcon()
                ],
              ),
            ),
            const SizedBox(height: 40),
            MovieRow(widget: UpcomingBlocbuilder(), txt: "Upcoming Movies",),
            const SizedBox(height: 20),
           MovieRow(widget: PopularMoviesBlocbuilder(), txt: "Popular Movies",),
            const SizedBox(height: 20),
            MovieRow(widget: PopularTvBlocbuilder(),txt: "Popular TV Shows"),
            const SizedBox(height: 20),
            MovieRow(widget: TopRatedMoviesBlocbuilder(),txt: "Top Rated Movies"),
            const SizedBox(height: 20),
            MovieRow(widget: TopRatedTvBlocbuilder(),txt: "Top Rated TV Shows")
          ],
        ),
      ));
  }


}
