import 'package:flutter/material.dart';

import 'package:moviesapp/feature/home/data/models/results.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget(
      {super.key, required this.valResult2, required this.index});
  final Results valResult2;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      //child: Text("${valResult2?[index].title}"),
      margin: const EdgeInsets.all(10),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
                "https://image.tmdb.org/t/p/w500${valResult2.posterPath}")),
      ),
    );
  }
}
