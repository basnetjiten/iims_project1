import 'package:awesome_app_iims/features/home/data/popular_movie_model.dart';
import 'package:awesome_app_iims/features/home/data/popular_movie_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'trending_movie_state.dart';

class TrendingMovieCubit extends Cubit<TrendingMovieState> {
  TrendingMovieCubit()
      : movieRepo = PopularMoveRepoImpl(),
        super(Initial());

  late PopularMoveRepoImpl movieRepo;

  void fetchTrendingMovieData() async {
    /// emitting MovieFetchingState
    emit(Fetching());

    final topRatedMovie = await movieRepo.getTopRatedMovies();

    if (topRatedMovie.results.isNotEmpty) {
      /// emitting TrendingMovieFetched
      emit(Fetched(topRatedMovie.results));
    }
  }
}
