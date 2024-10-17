import 'package:moviesapp/feature/home/data/models/results.dart';

abstract class CategortdetailsState {}

class CategortdetailsInitial extends CategortdetailsState {}

class CategortdetailsLoading extends CategortdetailsState {}

class CategortdetailsLoadded extends CategortdetailsState {
  final List<Results> cat;

  CategortdetailsLoadded({required this.cat});
}

class CategortdetailsError extends CategortdetailsState {
  final String error;

  CategortdetailsError({required this.error});
}
