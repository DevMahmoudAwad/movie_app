import 'package:dartz/dartz.dart';
import 'package:moviesapp/feature/home/data/models/about_movies/about_movies.dart';
import 'package:moviesapp/feature/home/data/models/category.dart';

import 'package:moviesapp/feature/home/data/models/results.dart';

abstract class HomeRepo {
  Future<Either<String, List<Results>>> fetchAllMovies();
  Future<Either<String, List<Category>>> fetchCategory();
  Future<Either<String, List<Results>>> getDetailsCategory(int num);
  Future<Either<String, List<Results>>> getSimiliarmovie(int num);
  Future<Either<String, List<AboutMovies>>> getAboutmovie();
}
