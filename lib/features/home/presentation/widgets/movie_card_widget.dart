import 'package:awesome_app_iims/core/theme/text_style/app_text_style.dart';
import 'package:flutter/material.dart';

class MovieCardContainerWidget extends StatelessWidget {
  const MovieCardContainerWidget({
    super.key,
    required this.imageUrl,
    required this.movieName,
    required this.movieOverView,
  });

  final String? imageUrl;
  final String movieName;
  final String movieOverView;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 350,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(

                    'https://image.tmdb.org/t/p/original/$imageUrl',
                ),
              ),
            ),
          ),
        ),
        Text(
          movieName,
          style: AppTextStyle.movieTextStyle,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(movieOverView),
        )
      ],
    );
  }
}
