import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;
  ApiServices({required this.dio});

  final _baseUrl = "https://api.themoviedb.org/";

  get({required final endPoint}) async {
    var respone = await dio.get("$_baseUrl$endPoint");
    return respone.data;
  }
}
