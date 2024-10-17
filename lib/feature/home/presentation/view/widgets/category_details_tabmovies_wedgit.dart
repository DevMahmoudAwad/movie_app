import 'package:flutter/material.dart';
import 'package:moviesapp/feature/home/data/models/results.dart';
import 'package:moviesapp/feature/home/presentation/view/widgets/about_movies_wedgit.dart';
import 'package:moviesapp/feature/home/presentation/view/widgets/similiar_movies_wedgit.dart';

class CategoryDetailsTabmoviesWedgit extends StatelessWidget {
  const CategoryDetailsTabmoviesWedgit({super.key, required this.allMoives});
  final Results allMoives;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          //title: const Text('TabBar Sample'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Episode",
              ),
              Tab(
                text: "Similiar",
              ),
              Tab(
                text: "About",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            const Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: SimiliarMoviesWedgit(id: allMoives.id),
            ),
            const Center(
              child: AboutMoviesWedgit(),
            ),
          ],
        ),
      ),
    );
  }
}
