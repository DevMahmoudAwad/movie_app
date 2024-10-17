import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/network/services_locator.dart';
import 'package:moviesapp/feature/home/data/repo/home_repo_impl.dart';
import 'package:moviesapp/feature/home/presentation/controller/similiar_movies_cubit/similiar_movies_cubit.dart';
import 'package:moviesapp/feature/home/presentation/controller/similiar_movies_cubit/similiar_movies_state.dart';
import 'package:moviesapp/feature/home/presentation/view/widgets/similiar_tap_list_wedgit.dart';

class SimiliarMoviesWedgit extends StatelessWidget {
  const SimiliarMoviesWedgit({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SimiliarMoviesCubit(getIt.get<HomeRepoImpl>())
          ..getSimiliarCubit(id),
        child: BlocBuilder<SimiliarMoviesCubit, SimiliarMoviesState>(
            builder: (context, state) {
          if (state is SimiliarMoviesLoaded) {
            return SimiliarTapListWedgit(move: state.movie);
          } else if (state is SimiliarMoviesError) {
            return Text(state.error);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }
}
