import 'package:moviesapp/feature/home/data/models/results.dart';

abstract class SimiliarMoviesState {}

class SimiliarMoviesInitial extends SimiliarMoviesState {}

class SimiliarMoviesLoading extends SimiliarMoviesState {}

class SimiliarMoviesLoaded extends SimiliarMoviesState {
  final List<Results> movie;

  SimiliarMoviesLoaded({required this.movie});
}

class SimiliarMoviesError extends SimiliarMoviesState {
  final String error;

  SimiliarMoviesError({required this.error});
}
