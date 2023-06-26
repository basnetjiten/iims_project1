import 'package:awesome_app_iims/features/home/data/popular_movie_model.dart';
import 'package:awesome_app_iims/features/home/data/popular_movie_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  //constructor that initializes the movieRepo
  MovieCubit()
      : movieRepo = PopularMoveRepoImpl(),
        super(MovieInitial());

  late PopularMoveRepoImpl movieRepo;

  void getPopularMovieData() async {
    emit(MovieFetching());

    final movieModel = await movieRepo.getPopularMovie();

    if (movieModel.results.isNotEmpty) {
      emit(PopularMovieFetched(movieModel.results));
    }
  }

  void fetchTrendingMovieData() async {
    emit(MovieFetching());

    final topRatedMovie = await movieRepo.getTopRatedMovies();

    if (topRatedMovie.results.isNotEmpty) {

      emit(TrendingMovieFetched(topRatedMovie.results));
    }
  }
}

// class Apple {
//   Apple() : color = 'red';
//   late String color;
// }
//
// Apple apple = Apple();
// apple.color; <=== call the instance variable
