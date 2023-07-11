import 'package:awesome_app_iims/features/home/data/popular_movie_model.dart';
import 'package:awesome_app_iims/features/search/data/search_movie_model.dart';
import 'package:awesome_app_iims/features/search/data/search_movie_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_movie_state.dart';

class SearchMovieCubit extends Cubit<SearchMovieState> {
  SearchMovieCubit()
      : _searchMovieRepoImpl = SearchMovieRepoImpl(),
        super(MovieInitial());

  final SearchMovieRepoImpl _searchMovieRepoImpl;

  void searchMovieWithQuery(String query) async {
    emit(Loading());
    final searchedMovies =
        await _searchMovieRepoImpl.searchMovieWithQuery(query);

    if (searchedMovies.isNotEmpty) {
      emit(Loaded(searchedMovies));
    } else {
      emit(Empty());
    }
  }
}
