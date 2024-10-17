import 'package:flutter/material.dart';
import 'package:moviesapp/feature/home/data/models/results.dart';
import 'package:moviesapp/feature/home/presentation/view/widgets/similiar_tap_item_wedgit.dart';

class SimiliarTapListWedgit extends StatelessWidget {
  const SimiliarTapListWedgit({super.key, required this.move});

  final List<Results> move;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              //crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return SimiliarTapItemWedgit(finalmov: move[index]);
          },
          itemCount: move.length),
    );
  }
}
