part of 'movie_cubit.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieFetching extends MovieState {}

class MovieFetched extends MovieState {
  MovieFetched(this.movieResults);

  final List<Result> movieResults;
}
