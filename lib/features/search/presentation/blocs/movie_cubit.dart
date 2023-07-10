import 'package:awesome_app_iims/features/search/data/search_movie_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit()
      : _searchMovieRepoImpl = SearchMovieRepoImpl(),
        super(MovieInitial());

  //Depended class
  // SearchMovieRepoImpl _searchMovieRepoImpl;
  //
  // searchMovie(String query) async {
  //   emit(Loading());
  //   final data = await _searchMovieRepoImpl.searchMovie(query);
  //   emit(Loaded(data));
  // }

  final SearchMovieRepoImpl _searchMovieRepoImpl;

  void searchMovieWithQuery(String query) async {
    emit(Loading());
    final searchedMovies =
        await _searchMovieRepoImpl.searchMovieWithQuery(query);
    emit(Loaded(searchedMovies));
  }
}
