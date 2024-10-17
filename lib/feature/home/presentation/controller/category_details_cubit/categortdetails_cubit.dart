import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/feature/home/data/models/results.dart';
import 'package:moviesapp/feature/home/data/repo/home_repo_impl.dart';
import 'package:moviesapp/feature/home/presentation/controller/category_details_cubit/categortdetails_state.dart';

class CategortdetailsCubit extends Cubit<CategortdetailsState> {
  CategortdetailsCubit(this.homeRepoImpl) : super(CategortdetailsInitial());

  final HomeRepoImpl homeRepoImpl;
  getcatdetailscubit(int num) async {
    emit(CategortdetailsLoading());
    Either<String, List<Results>> finalCat =
        await homeRepoImpl.getDetailsCategory(num);
    finalCat.fold((error) {
      return emit(CategortdetailsError(error: error));
    }, (cat) {
      return emit(CategortdetailsLoadded(cat: cat));
    });
  }
}
