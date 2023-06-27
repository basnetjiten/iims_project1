part of 'popular_movie_cubit.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieFetching extends MovieState {}

class PopularMovieFetched extends MovieState {

  PopularMovieFetched(this.movieResults);

  final List<Result> movieResults;
}


