import 'package:moviesapp/feature/home/data/models/about_movies/about_movies.dart';

abstract class AboutMoviesState {}

class AboutMoviesInitial extends AboutMoviesState {}

class AboutMoviesLoading extends AboutMoviesState {}

class AboutMoviesLoaded extends AboutMoviesState {
  final List<AboutMovies> movie;

  AboutMoviesLoaded({required this.movie});
}

class AboutMoviesError extends AboutMoviesState {
  final String error;

  AboutMoviesError({required this.error});
}
