import 'package:awesome_app_iims/features/bootstrap.dart';
import 'package:awesome_app_iims/features/search/data/search_movie_model.dart';

class SearchMovieRepoImpl {
  Future<List<SearchResult>> searchMovieWithQuery(String userQuery) async {
    final obtainedJson = await dioInstance
        .get('/search/collection', queryParameters: {'query': userQuery});

    return SearchedMovieModel.fromJson(obtainedJson.data).searchedResults;
  }
}
