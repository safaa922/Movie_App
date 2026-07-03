import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/search/logic/search_cubit.dart';
import 'package:movie_app/features/search/logic/search_state.dart';
import 'package:movie_app/features/search/presentation/no_movies_found.dart';
import 'package:movie_app/features/search/presentation/search_listview.dart';

class SearchBlocbuilder extends StatelessWidget {
  const SearchBlocbuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit,SearchState>(
        builder: (context,state){
          return state.when(
              initial: (){
                return NoMoviesFound(txt: "Search by a movie name...");
              },
              searchLoading: (){
                return  const Center(child: CircularProgressIndicator());
              },
              SearchSuccess: (movies){
                if(movies.isEmpty){
                    return NoMoviesFound(txt: "No Movies found...");
                }

               return SearchListview(movies: movies);
              },
          SearchError: (error) =>
          Center(child: Text(error.ApiErrorHandlerFailure.message ?? "Error")));
        }
    );
  }
}
