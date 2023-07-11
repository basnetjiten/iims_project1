part of 'search_movie_cubit.dart';

@immutable
abstract class SearchMovieState {}

class MovieInitial extends SearchMovieState {}

class Loading extends SearchMovieState {}

class Empty extends SearchMovieState {}

class Loaded extends SearchMovieState {
  Loaded(this.searchedMovies);

  final List<SearchResult> searchedMovies;
}
