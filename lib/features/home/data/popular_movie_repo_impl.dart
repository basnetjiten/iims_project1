/*
* @Author:Jiten Basnet on 19/06/2023
* @Company: EB Pearls
*/

import 'package:awesome_app_iims/features/bootstrap.dart';
import 'package:awesome_app_iims/features/home/data/popular_movie_model.dart';

class PopularMoveRepoImpl {
  PopularMoveRepoImpl();

  Future<PopularMovieList> getPopularMovie() async {
    final data = await dioInstance.get('popular');

    PopularMovieList popularMovieModel = PopularMovieList.fromJson(data.data);
    return popularMovieModel;
  }

  void getTopRatedMovie() async {
    final data = await dioInstance.get('top_rated');
    print("DAATAA==> $data");
  }

  void getTopUpcomingMovie() async {
    final data = await dioInstance.get('top_rated');
    print("DAATAA==> $data");
  }
}
