//import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/feature/home/data/models/data_list.dart';

import 'package:moviesapp/feature/home/data/models/results.dart';
import 'package:moviesapp/feature/home/presentation/view/widgets/category_details_tabmovies_wedgit.dart';

class CategoryDetailsMovies extends StatelessWidget {
  const CategoryDetailsMovies({super.key, required this.movie});

  final Results movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff07041f),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500${movie.posterPath}"))),
            child: Container(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: InkWell(
                    onTap: () {
                      saveMovies.add(movie);
                    },
                    child: Icon(
                      Icons.save_alt,
                      color: Colors.amber,
                    )),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xfffeffff)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.play_arrow), Text("Play")],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 150,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.download), Text("Download")],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  maxLines: 2,
                  movie.overview,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xff6c6a7f),
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          Expanded(child: CategoryDetailsTabmoviesWedgit(allMoives: movie))
        ],
      ),
    );
  }
}
