import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/network/services_locator.dart';
import 'package:moviesapp/core/utils/app_router.dart';
import 'package:moviesapp/feature/home/data/repo/home_repo_impl.dart';
import 'package:moviesapp/feature/home/presentation/controller/all_movies_cubit/all_movies_cubit.dart';
import 'package:moviesapp/feature/home/presentation/controller/category_cubit/category_cubit.dart';
import 'package:moviesapp/feature/home/presentation/controller/category_details_cubit/categortdetails_cubit.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AllMoviesCubit(getIt.get<HomeRepoImpl>())..getAllMoviesCubit(),
          ),
          BlocProvider(
              create: (context) =>
                  CategoryCubit(getIt.get<HomeRepoImpl>())..getCategory()),
          BlocProvider(
              create: (context) =>
                  CategortdetailsCubit(getIt.get<HomeRepoImpl>())
                    ..getcatdetailscubit(28))
        ],
        child: MaterialApp.router(
          theme: ThemeData.dark()
              .copyWith(scaffoldBackgroundColor: const Color(0xff07041f)),
          // You can use the library anywhere in the app even in theme

          routerConfig: AppRouter.router,
          // home: child,
        ));
  }
}
