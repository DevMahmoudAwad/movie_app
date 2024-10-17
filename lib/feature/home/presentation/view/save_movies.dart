import 'package:flutter/material.dart';
import 'package:moviesapp/feature/home/data/models/data_list.dart';
import 'package:moviesapp/feature/home/presentation/view/widgets/bottom_navigation_widget.dart';
import 'package:moviesapp/feature/home/presentation/view/widgets/save_movies_item_wedgit.dart';

class SaveMovies extends StatefulWidget {
  const SaveMovies({super.key});

  @override
  State<SaveMovies> createState() => _SaveMoviesState();
}

class _SaveMoviesState extends State<SaveMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Saved"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return SaveMoviesItemWedgit(mov: saveMovies[index]);
                },
                itemCount: saveMovies.length,
              ),
            ),
            BottomNavigationWidget()
          ],
        ));
  }
}
