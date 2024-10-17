import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/network/services_locator.dart';
import 'package:moviesapp/feature/home/data/repo/home_repo_impl.dart';
import 'package:moviesapp/feature/home/presentation/controller/about_movies/about_movies_cubit.dart';
import 'package:moviesapp/feature/home/presentation/controller/about_movies/about_movies_state.dart';

class AboutMoviesWedgit extends StatelessWidget {
  const AboutMoviesWedgit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            AboutMoviesCubit(getIt.get<HomeRepoImpl>())..getAboutmovCubit(),
        child: BlocBuilder<AboutMoviesCubit, AboutMoviesState>(
            builder: (context, state) {
          if (state is AboutMoviesLoaded) {
            return Container(
                child: Column(
              children: [
                Row(
                  children: [
                    Text("${state.movie[0].genres?[0].name}"),
                    const Text("data"),
                  ],
                ),
                const Row(
                  children: [
                    Text("data1"),
                    Text("data"),
                  ],
                )
              ],
            ));
          } else if (state is AboutMoviesError) {
            return Text(state.error);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }
}
