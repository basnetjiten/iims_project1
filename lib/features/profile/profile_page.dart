import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:awesome_app_iims/core/router.gr.dart';
import 'package:awesome_app_iims/core/theme/text_style/app_text_style.dart';
import 'package:awesome_app_iims/features/home/data/popular_movie_repo_impl.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Netflix',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body:

          // GridView(
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       childAspectRatio: 1,
          //       mainAxisSpacing: 10.0,
          //       crossAxisSpacing: 1.0,
          //       crossAxisCount: 2),
          //   children: [
          //     Container(
          //       height: 10,
          //       width: 25,
          //       color: Colors.yellow,
          //     ),
          //     Container(
          //       height: 10,
          //       width: 25,
          //       color: Colors.green,
          //     ),
          //     Container(
          //       height: 10,
          //       width: 25,
          //       color: Colors.red,
          //     ),
          //     Container(
          //       height: 10,
          //       width: 25,
          //       color: Colors.purple,
          //     ),
          //     Container(
          //       height: 10,
          //       width: 25,
          //       color: Colors.amber,
          //     ),
          //   ],
          // )

          GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {

                 context.pushRoute(const HomeRoute());
                },
                child: Container(
                  height: 200,
                  width: 250,
                  color: Colors.green,
                ),
              ),
              Text("profile ${index + 1}", style: AppTextStyle.normalTextStyle)
            ],
          );
        },
        itemCount: 5,
      ),
    );
  }
}
