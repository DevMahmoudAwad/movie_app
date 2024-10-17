import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/core/utils/app_router.dart';
import 'package:moviesapp/feature/home/data/models/results.dart';

// ignore: must_be_immutable
class CategoryDetailsItemWedgit extends StatelessWidget {
  CategoryDetailsItemWedgit({super.key, required this.results});
  final Results results;
  int idmovie = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.KCategoryDetailsMovies, extra: results);
      },
      child: Container(
        //child: Text("${valResult2?[index].title}"),
        margin: const EdgeInsets.all(10),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500${results.posterPath}")),
        ),
      ),
    );
  }
}
