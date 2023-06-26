part of 'movie_cubit.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieFetching extends MovieState {}

class PopularMovieFetched extends MovieState {

  PopularMovieFetched(this.movieResults);

  final List<Result> movieResults;
}

class TrendingMovieFetched extends MovieState{

  TrendingMovieFetched(this.trendingMovieResult);
  late final List<Result> trendingMovieResult;
}
