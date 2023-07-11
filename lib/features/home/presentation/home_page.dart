import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:awesome_app_iims/features/home/presentation/blocs/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:awesome_app_iims/features/home/presentation/blocs/trending_movie_cubit/trending_movie_cubit.dart';
import 'package:awesome_app_iims/features/home/presentation/search_result_page.dart';
import 'package:awesome_app_iims/features/search/presentation/blocs/search_movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PopularMovieCubit _movieCubit;
  late TrendingMovieCubit _trendingMovieCubit;
  late TextEditingController _searchEditingController;
  late SearchMovieCubit _searchMovieCubit;

  int selectedIndex = 0;

  List<Widget> navContent = [];

  @override
  void initState() {
    super.initState();
    _movieCubit = PopularMovieCubit();
    _trendingMovieCubit = TrendingMovieCubit();
    _movieCubit.getPopularMovieData();
    _trendingMovieCubit.fetchTrendingMovieData();
    _searchEditingController = TextEditingController();
    _searchMovieCubit = SearchMovieCubit();

    navContent = [
      BlocBuilder<PopularMovieCubit, MovieState>(
        bloc: _movieCubit,
        builder: (context, state) {
          if (state is MovieFetching) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PopularMovieFetched) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text("Popular Movies"),
                Flexible(
                  child: ListView.builder(
                      shrinkWrap: false,
                      itemCount: state.movieResults.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final singleMovieResult = state.movieResults[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 250,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/original/${singleMovieResult.posterPath}',
                                    ),
                                  ),
                                ),
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
      BlocBuilder<TrendingMovieCubit, TrendingMovieState>(
          bloc: _trendingMovieCubit,
          builder: (context, state) {
            if (state is Fetching) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is Fetched) {
              return Flexible(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: state.trendingMovieResult.length,
                    itemBuilder: (context, index) {
                      final singleTrendingMovie =
                          state.trendingMovieResult[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/original/${singleTrendingMovie.posterPath}',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(singleTrendingMovie.title)
                        ],
                      );
                    }),
              );
            }

            return const Center(child: CircularProgressIndicator());
          })
    ];
  }

  /// USE THIS BUILD METHOD USING BLOC BUILDER
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: TextFormField(
          controller: _searchEditingController,
        ),
        actions: [
          IconButton(
              onPressed: () {
                _searchMovieCubit
                    .searchMovieWithQuery(_searchEditingController.text);

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                        create: (context) => _searchMovieCubit,
                        child: const SearchedResulPage()),
                  ),
                );
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Center(
        child: navContent[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_sharp),
            label: 'Popular',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trending',
          ),
        ],
        selectedItemColor: Colors.green[800],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          print("SELECTED INDEX $index");
        },
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

// navContent[0];
// navContent[1];
