import 'package:moviesapp/feature/home/data/models/results.dart';

abstract class AllMoviesState {}

class AllMoviesInitial extends AllMoviesState {}

class AllMoviesLoading extends AllMoviesState {}

class AllMoviesLoadded extends AllMoviesState {
  final List<Results> results;

  AllMoviesLoadded({required this.results});
}

class AllMoviesError extends AllMoviesState {
  final String error;

  AllMoviesError({required this.error});
}
