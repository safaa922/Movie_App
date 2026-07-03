import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/helpers/show_snackbar.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_cubit.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_state.dart';
import 'package:movie_app/features/movie_details/presentation/movie_details_screen.dart';
import 'package:movie_app/features/movie_details/presentation/widgets/actors_listview.dart';
import 'package:movie_app/features/movie_details/presentation/widgets/movie_landing.dart';
import 'package:movie_app/features/movie_details/presentation/widgets/movie_rec_listview.dart';

class MovieDetailsBlocbuilder extends StatelessWidget {
  const MovieDetailsBlocbuilder({super.key, required this.movieId});

  final int movieId;
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<MovieDetailsCubit,MovieDetailsState>(
        builder: (context,state){

          if (state is MovieLoading) {
            return const Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(),
              ),);
          }
          final actors = context.watch<MovieDetailsCubit>().actorsList;
          final recs = context.watch<MovieDetailsCubit>().recList;


          if ((actors?.isNotEmpty ?? false) ||
              (recs?.isNotEmpty ?? false)) {
            return  SingleChildScrollView(
              child: Column(
                children: [

                  const SizedBox(height: 20),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text("Cast",
                        style: const TextStyle( fontSize: 19.5, color: Colors.white,
                            shadows: [ Shadow(color: Color(0xFFFF8945),offset: Offset(0, 0),blurRadius: 20) ] ),),
                    ),
                  ),

                  Padding(padding: EdgeInsets.all(15),child:  SizedBox(
                    height: 150,
                    child: ActorsListview(actorsList: actors!,),
                  ),),

                  const SizedBox(height: 20),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text("Similar Movies", style: const TextStyle( fontSize: 19.5, color: Colors.white,
                          shadows: [ Shadow(color: Color(0xFFFF8945),offset: Offset(0, 0),blurRadius: 20) ] ),),
                    ),
                  ),

                  Padding(padding: EdgeInsets.all(15),child: SizedBox(
                    height: 220,
                    child: MovieRecListview( movieList: recs!,),
                  ),
                  ),
                ],
              ),
            );
          }

          if(state is FavoriteLoading){
            return const CircularProgressIndicator();
          }
          if(state is WatchLoading){
            return const CircularProgressIndicator();
          }

          if (state is MovieDetailsError) {
            print(state.errHandler.ApiErrorHandlerFailure.message);
            return SnackBar(content: Text(state.errHandler.ApiErrorHandlerFailure.message.toString()));
          }

          return const SizedBox.shrink();
        },
        listener: (context,state){
          state.maybeWhen(
              MovieLoading: ()=>CircularProgressIndicator(),
              MovieSuccess: (){
                context.read<MovieDetailsCubit>();
                print("success");

              },
              MovieDetailsError: (e)=> showSnackBar(context, "${e}"),
              FavoriteError: (e){
                showSnackBar(context, e);
              },
              WatchError: (e){
                showSnackBar(context, e);
              },
              FavoriteSuccess: () {
              },

              WatchSuccess: () {
                // showSnackBar(
                //   context,
                //   "Added to watchlist",
                // );
              },
              orElse: () { return const SizedBox.shrink(); }

          );
        });
  }
}
