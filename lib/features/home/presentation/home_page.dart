import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:awesome_app_iims/core/router.gr.dart';
import 'package:awesome_app_iims/features/home/data/popular_movie_model.dart';
import 'package:awesome_app_iims/features/home/data/popular_movie_repo_impl.dart';
import 'package:awesome_app_iims/features/home/presentation/blocs/movie_cubit/movie_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PopularMovieList movieList;
  late MovieCubit _movieCubit;

  @override
  void initState() {
    super.initState();
    _movieCubit = MovieCubit();
    _movieCubit.getPopularMovieData();
  }

  /// USE THIS BUILD METHOD USING BLOC BUILDER
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<MovieCubit, MovieState>(
          bloc: _movieCubit,
          builder: (context, state) {
            if (state is MovieFetching) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieFetched) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Trending TV Shows This Week"),
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.movieResults.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final singleMovieResult = state.movieResults[index];
                          print(singleMovieResult.posterPath);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 250,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        color: Colors.green,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            'https://image.tmdb.org/t/p/original/${singleMovieResult.posterPath}',
                                          ),
                                        ),
                                      ),
                                    ),
                                    // CachedNetworkImage(
                                    //     imageUrl:
                                    //         'https://image.tmdb.org/t/p/original/${popularMovie.posterPath}')
                                  ],
                                ),
                                Text(singleMovieResult.title)
                              ],
                            ),
                          );
                        }),
                  )
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

/// USE THIS METHOD FOR FUTURE BUILDER
// Future<PopularMovieList> _getPopularMovieData() async {
//   PopularMoveRepoImpl movieRepo = PopularMoveRepoImpl();
//   return await movieRepo.getPopularMovie();
// }

///// UNCOMMENT TO USE THIS BUILD TO FETCH DATA USING FUTURE BUILDER
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child:
//
//         FutureBuilder<PopularMovieList>(
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text(
//                   '${snapshot.error} occurred',
//                   style: const TextStyle(fontSize: 18),
//                 ),
//               );
//
//               // if we got our data
//             } else if (snapshot.hasData) {
//               return ListView(
//                 children: [
//                   Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Text("Trending TV Shows This Week"),
//                       SizedBox(
//                         height: 400,
//                         child: ListView.builder(
//                             shrinkWrap: true,
//                             itemCount: snapshot.data!.results.length,
//                             scrollDirection: Axis.horizontal,
//                             itemBuilder: (context, index) {
//                               final singleMovieResult =
//                                   snapshot.data!.results[index];
//                               print(singleMovieResult.posterPath);
//                               return Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                     Stack(
//                                       children: [
//                                         Container(
//                                           height: 250,
//                                           width: 200,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(20)),
//                                             color: Colors.green,
//                                             image: DecorationImage(
//                                               fit: BoxFit.cover,
//                                               image: NetworkImage(
//                                                 'https://image.tmdb.org/t/p/original/${singleMovieResult.posterPath}',
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         // CachedNetworkImage(
//                                         //     imageUrl:
//                                         //         'https://image.tmdb.org/t/p/original/${popularMovie.posterPath}')
//                                       ],
//                                     ),
//                                     Text(singleMovieResult.title)
//                                   ],
//                                 ),
//                               );
//                             }),
//                       )
//                     ],
//                   ),
//                   Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Text("Trending TV Shows This Today"),
//                       SizedBox(
//                         height: 400,
//                         child: ListView.builder(
//                             shrinkWrap: true,
//                             itemCount: 20,
//                             scrollDirection: Axis.horizontal,
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Container(
//                                   height: 250,
//                                   width: 200,
//                                   color: Colors.green,
//                                 ),
//                               );
//                             }),
//                       )
//                     ],
//                   ),
//                   Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Text("Trending Movies Shows This Week"),
//                       SizedBox(
//                         height: 400,
//                         child: ListView.builder(
//                             shrinkWrap: true,
//                             itemCount: 20,
//                             scrollDirection: Axis.horizontal,
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Container(
//                                   height: 250,
//                                   width: 200,
//                                   color: Colors.green,
//                                 ),
//                               );
//                             }),
//                       )
//                     ],
//                   ),
//                 ],
//               );
//             }
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//           future: _getPopularMovieData(),
//         ),
//       ),
//     );
//   }
// }
