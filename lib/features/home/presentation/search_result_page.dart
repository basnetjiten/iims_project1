import 'package:awesome_app_iims/core/theme/text_style/app_text_style.dart';
import 'package:awesome_app_iims/features/home/presentation/widgets/movie_card_widget.dart';
import 'package:awesome_app_iims/features/search/data/search_movie_model.dart';
import 'package:awesome_app_iims/features/search/presentation/blocs/search_movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchedResulPage extends StatefulWidget {
  const SearchedResulPage({super.key});

  @override
  State<SearchedResulPage> createState() => _SearchedResulPageState();
}

class _SearchedResulPageState extends State<SearchedResulPage> {
  late SearchMovieCubit _searchMovieCubit;

  @override
  void initState() {
    _searchMovieCubit = context.read<SearchMovieCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Flexible(
            child: BlocBuilder<SearchMovieCubit, SearchMovieState>(
                builder: (context, state) {
              if (state is Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Loaded) {
                final searchMovies = state.searchedMovies;

                return ListView.builder(
                    itemCount: searchMovies.length,
                    itemBuilder: (context, index) {
                      final singleSearchedMovie = searchMovies[index];
                      return SingleChildScrollView(
                        child: MovieCardContainerWidget(
                          movieName: singleSearchedMovie.name,
                          movieOverView: singleSearchedMovie.overview,
                          imageUrl: singleSearchedMovie.posterPath,
                        ),
                      );
                    });
              }

              if (state is Empty) {
                return const Center(
                  child: Text('No search result'),
                );
              }

              return const Text(
                'Your search result will appear here',
              );
            }),
          )
        ],
      ),
    );
  }
}
