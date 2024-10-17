import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:moviesapp/feature/home/data/models/category.dart';
import 'package:moviesapp/feature/home/data/repo/home_repo_impl.dart';
import 'package:moviesapp/feature/home/presentation/controller/category_cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.homeRepoImpl) : super(CategoryInitial());
  final HomeRepoImpl homeRepoImpl;
  getCategory() async {
    emit(CategoryLoading());
    Either<String, List<Category>> categoryData =
        await homeRepoImpl.fetchCategory();
    categoryData.fold((error) {
      return emit(CategoryError(error: error));
    }, (cate) {
      return emit(CategoryLoadded(cat: cate));
    });
  }
}
