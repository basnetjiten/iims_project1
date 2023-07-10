import 'package:awesome_app_iims/features/bootstrap.dart';
import 'package:awesome_app_iims/features/home/data/popular_movie_model.dart';
import 'package:dio/dio.dart';

class SearchMovieRepoImpl {
  // Future<MovieModel> searchMovie(String query) async {
  //   final data = await dioInstance.get(
  //       'https://api.themoviedb.org/3/search/collection',
  //       queryParameters: {'query': query});
  //
  //   return MovieMode.fromJson(data);
  // }

  Future<List<Result>> searchMovieWithQuery(String userQuery) async {
    final obtainedJson = await dioInstance
        .get('/search/collection', queryParameters: {'query': userQuery});

    return PopularMovieList.fromJson(obtainedJson.data).results;
  }
}
