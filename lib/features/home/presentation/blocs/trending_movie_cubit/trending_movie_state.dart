part of 'trending_movie_cubit.dart';

@immutable
abstract class TrendingMovieState {}

class Initial extends TrendingMovieState {}

class Fetching extends TrendingMovieState {}

class Fetched extends TrendingMovieState {
  Fetched(this.trendingMovieResult);

  late final List<Result> trendingMovieResult;
}
