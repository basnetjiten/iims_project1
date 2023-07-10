part of 'movie_cubit.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}
class Loading extends MovieState {}
class Loaded extends MovieState {

  MovieModel movieModel;
  Loaded(this.movieModel);
}
