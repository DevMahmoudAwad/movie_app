import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/feature/home/data/models/results.dart';
import 'package:moviesapp/feature/home/data/repo/home_repo_impl.dart';
import 'package:moviesapp/feature/home/presentation/controller/all_movies_cubit/all_movies_cubit.dart';
import 'package:moviesapp/feature/home/presentation/view/widgets/bottom_navigation_widget.dart';

class SearchMovies extends StatefulWidget {
  SearchMovies({super.key});

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  late List<Results> newmov;
  @override
  Widget build(BuildContext context) {
    // AllMoviesCubit allMoviesCubit = BlocProvider.of(context);
    // newmov = allMoviesCubit.getAllMoviesCubit();
    var value = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 10, left: 10, top: 50, bottom: 50),
            child: TextFormField(
              onChanged: onChanged,
              controller: value,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.cancel),
                  hintText: "search by title,genre,actor"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(newmov[index].title);
              },
              itemCount: 4,
            ),
          ),
          const BottomNavigationWidget()
        ],
      ),
    );
  }

  void onChanged(String val) {
    final sugis = newmov.where((x) {
      final movtitle = x.title.toLowerCase();
      final input = val.toLowerCase();
      return movtitle.contains(input);
    }).toList();
    setState(() {
      newmov = sugis;
    });
  }
}
