import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/networking/api_error_handler.dart';
import 'package:movie_app/features/search/data/repos/search_repo.dart';
import 'package:movie_app/features/search/logic/search_state.dart';

class SearchCubit extends Cubit<SearchState>{

  final SearchRepo searchRepo;
  SearchCubit(this.searchRepo):super(SearchState.initial());

  Future<void> searchMovies(String query, int page)async {
    print("Searching: $query");
    emit(SearchState.searchLoading());
    final response = await searchRepo.searchMovies(query, page);
    response.when(
      success:(data){
        print("Movies: ${data.results?.length}");
    emit(SearchState.SearchSuccess(data.results??[]));
    },
     failure: (error) {
      emit(
        SearchState.SearchError(
          ErrorHandler.handle(error)
        ),
      );
    },
    );
  }
}