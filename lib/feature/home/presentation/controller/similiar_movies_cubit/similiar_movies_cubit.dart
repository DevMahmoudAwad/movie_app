import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/feature/home/data/models/results.dart';
import 'package:moviesapp/feature/home/data/repo/home_repo_impl.dart';
import 'package:moviesapp/feature/home/presentation/controller/similiar_movies_cubit/similiar_movies_state.dart';

class SimiliarMoviesCubit extends Cubit<SimiliarMoviesState> {
  SimiliarMoviesCubit(this.homeRepoImpl) : super(SimiliarMoviesInitial());
  final HomeRepoImpl homeRepoImpl;

  getSimiliarCubit(int nummovies) async {
    emit(SimiliarMoviesLoading());
    Either<String, List<Results>> data =
        await homeRepoImpl.getSimiliarmovie(nummovies);
    data.fold((error) {
      emit(SimiliarMoviesError(error: error));
    }, (movies) {
      emit(SimiliarMoviesLoaded(movie: movies));
    });
  }
}
