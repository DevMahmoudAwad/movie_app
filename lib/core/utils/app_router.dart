import 'package:go_router/go_router.dart';
import 'package:moviesapp/feature/home/data/models/results.dart';
import 'package:moviesapp/feature/home/presentation/view/category_details.dart';
import 'package:moviesapp/feature/home/presentation/view/category_details_movies.dart';

import 'package:moviesapp/feature/home/presentation/view/home_page.dart';
import 'package:moviesapp/feature/home/presentation/view/save_movies.dart';
import 'package:moviesapp/feature/home/presentation/view/search_movies.dart';

abstract class AppRouter {
  static const KCategoryDetailsMovies = '/category_details_movies';
  static const KCategoryDetails = '/category_details';
  static const KSaveMovies = "/save_movies";
  static const KSearchMovies = "/search_movies";
  static const KHomePage = "/home_page";

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(path: KHomePage, builder: (context, state) => const HomePage()),
    GoRoute(path: KSearchMovies, builder: (context, state) => SearchMovies()),
    GoRoute(
        path: KCategoryDetailsMovies,
        builder: (context, state) {
          final Results movie = state.extra as Results;
          return CategoryDetailsMovies(movie: movie);
        }),
    GoRoute(
        path: KCategoryDetails,
        builder: (context, state) => const CategoryDetails()),
    GoRoute(
      path: KSaveMovies,
      builder: (context, state) => const SaveMovies(),
    )

    // GoRoute(path: KHomeDetails,builder: (context,state){
    // final Books books = state.extra as Books;
    //  return HomeDetails(books: books);
  ]);
}
