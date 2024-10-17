import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import 'package:moviesapp/feature/home/data/models/about_movies/about_movies.dart';
import 'package:moviesapp/feature/home/data/repo/home_repo_impl.dart';
import 'package:moviesapp/feature/home/presentation/controller/about_movies/about_movies_state.dart';

class AboutMoviesCubit extends Cubit<AboutMoviesState> {
  AboutMoviesCubit(this.homeRepoImpl) : super(AboutMoviesInitial());
  final HomeRepoImpl homeRepoImpl;

  getAboutmovCubit() async {
    emit(AboutMoviesLoading());
    Either<String, List<AboutMovies>> data = await homeRepoImpl.getAboutmovie();
    data.fold((error) {
      emit(AboutMoviesError(error: error));
    }, (movies) {
      emit(AboutMoviesLoaded(movie: movies));
    });
  }
}
