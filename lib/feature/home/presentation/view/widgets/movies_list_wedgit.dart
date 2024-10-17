import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:moviesapp/feature/home/presentation/controller/all_movies_cubit/all_movies_cubit.dart';
import 'package:moviesapp/feature/home/presentation/controller/all_movies_cubit/all_movies_state.dart';
import 'package:moviesapp/feature/home/presentation/view/widgets/movie_item_wedgit.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllMoviesCubit, AllMoviesState>(
      builder: (context, state) {
        // AllMoviesCubit cubit = BlocProvider.of(context);
        // List<Results>? cuVal = cubit.getAllMoviesCubit();
        if (state is AllMoviesLoadded) {
          return Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    //crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return MovieItemWidget(
                    valResult2: state.results[index],
                    index: index,
                  );
                },
                itemCount: state.results.length),
          );
        } else if (state is AllMoviesError) {
          return const Text("Error");
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
