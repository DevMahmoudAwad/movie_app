import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/feature/home/data/models/results.dart';
import 'package:moviesapp/feature/home/data/repo/home_repo_impl.dart';
import 'package:moviesapp/feature/home/presentation/controller/all_movies_cubit/all_movies_state.dart';

class AllMoviesCubit extends Cubit<AllMoviesState> {
  AllMoviesCubit(this.homeRepoImpl) : super(AllMoviesInitial());

  final HomeRepoImpl homeRepoImpl;

  Either<String, List<Results>>? fianlData;

  getAllMoviesCubit() async {
    emit(AllMoviesLoading());
    fianlData = await homeRepoImpl.fetchAllMovies();
    fianlData!.fold((error) {
      return emit(AllMoviesError(error: error));
    }, (results) {
      return emit(AllMoviesLoadded(results: results));
    });
  }
}
