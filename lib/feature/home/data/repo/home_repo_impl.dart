import 'package:dartz/dartz.dart';

import 'package:moviesapp/core/network/api_services.dart';
import 'package:moviesapp/feature/home/data/models/about_movies/about_movies.dart';
import 'package:moviesapp/feature/home/data/models/category.dart';
import 'package:moviesapp/feature/home/data/models/results.dart';
import 'package:moviesapp/feature/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl({required this.apiServices});

  @override
  Future<Either<String, List<Results>>> fetchAllMovies() async {
    try {
      var data = await apiServices.get(
          endPoint:
              "3/discover/movie?include_adult=false&include_video=true&language=en-US&page=1&sort_by=popularity.des&api_key=d83bd16d8c423e29aaeeea05a0cf2dde");
      List<Results> movies = [];
      for (var i in data["results"]) {
        movies.add(Results.fromJson(i));
      }
      return right(movies);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Category>>> fetchCategory() async {
    try {
      var data = await apiServices.get(
          endPoint:
              "3/genre/movie/list?api_key=d83bd16d8c423e29aaeeea05a0cf2dde&language=en");
      List<Category> category = [];
      for (var i in data["genres"]) {
        category.add(Category(id: i["id"], name: i["name"]));
      }
      return right(category);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Results>>> getDetailsCategory(int num) async {
    try {
      var detailscategory = await apiServices.get(
          endPoint:
              "3/discover/movie?include_adult=true&with_genres=$num&include_video=true&language=en-US&page=1&sort_by=popularity.des&api_key=d83bd16d8c423e29aaeeea05a0cf2dde");
      List<Results> dataDetails = [];
      for (var i in detailscategory["results"]) {
        dataDetails.add(Results.fromJson(i));
      }
      return right(dataDetails);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Results>>> getSimiliarmovie(int num) async {
    try {
      var similiarData = await apiServices.get(
          endPoint:
              "3/movie/$num/similar?language=en-US&page=1&api_key=d83bd16d8c423e29aaeeea05a0cf2dde");
      List<Results> allSimilar = [];
      for (var i in similiarData["results"]) {
        allSimilar.add(Results.fromJson(i));
      }
      return right(allSimilar);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<AboutMovies>>> getAboutmovie() async {
    try {
      var aboutdata = await apiServices.get(
          endPoint:
              "3/movie/533535?language=en-US&api_key=d83bd16d8c423e29aaeeea05a0cf2dde");
      List<AboutMovies> allMovies = [];
      for (var i in aboutdata) {
        allMovies.add(AboutMovies.fromJson(i));
      }
      return right(allMovies);
    } catch (e) {
      return left(e.toString());
    }
  }
}
