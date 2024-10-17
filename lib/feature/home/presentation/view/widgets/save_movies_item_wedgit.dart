import 'package:flutter/material.dart';
import 'package:moviesapp/feature/home/data/models/data_list.dart';
import 'package:moviesapp/feature/home/data/models/results.dart';

class SaveMoviesItemWedgit extends StatefulWidget {
  const SaveMoviesItemWedgit({super.key, required this.mov});
  final Results mov;

  @override
  State<SaveMoviesItemWedgit> createState() => _SaveMoviesItemWedgitState();
}

class _SaveMoviesItemWedgitState extends State<SaveMoviesItemWedgit> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff1f1d35),
        ),
        margin: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500${widget.mov.posterPath}")),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: 200,
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(widget.mov.title),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    saveMovies.remove(widget.mov);
                    
                  });
                },
                icon: Icon(Icons.delete))
          ],
        ));
  }
}
