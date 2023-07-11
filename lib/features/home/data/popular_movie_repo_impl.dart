/*
* @Author:Jiten Basnet on 19/06/2023
* @Company: EB Pearls
*/

import 'package:awesome_app_iims/features/bootstrap.dart';
import 'package:awesome_app_iims/features/home/data/popular_movie_model.dart';

class PopularMoveRepoImpl {
  PopularMoveRepoImpl();

  Future<MovieModel> getPopularMovie() async {
    final data = await dioInstance.get('movie/popular');

    MovieModel popularMovieModel = MovieModel.fromJson(data.data);

    return popularMovieModel;
  }


  Future<MovieModel>getTopRatedMovies()async{
    final jsonResponse = await dioInstance.get('movie/top_rated');
    MovieModel popularMovieModel = MovieModel.fromJson(jsonResponse.data);

    return popularMovieModel;
  }

}
