import 'package:flutter/material.dart';
import 'package:moviesapp/feature/home/data/models/results.dart';

class SimiliarTapItemWedgit extends StatelessWidget {
  const SimiliarTapItemWedgit({super.key, required this.finalmov});
  final Results finalmov;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
                "https://image.tmdb.org/t/p/w500${finalmov.posterPath}")),
      ),
    );
  }
}
