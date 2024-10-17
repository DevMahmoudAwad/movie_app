import 'package:moviesapp/feature/home/data/models/category.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoadded extends CategoryState {
  final List<Category> cat;

  CategoryLoadded({required this.cat});
}

class CategoryError extends CategoryState {
  final String error;

  CategoryError({required this.error});
}
