import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:moviesapp/core/network/api_services.dart';
import 'package:moviesapp/feature/home/data/repo/home_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiServices>(ApiServices(dio: Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(apiServices: getIt.get<ApiServices>()));
}
