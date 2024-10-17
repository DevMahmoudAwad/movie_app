// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:moviesapp/core/utils/app_router.dart';
import 'package:moviesapp/feature/home/data/models/category.dart';

import 'package:moviesapp/feature/home/presentation/controller/category_details_cubit/categortdetails_cubit.dart';

class CategoryItemsWidget extends StatelessWidget {
  CategoryItemsWidget({super.key, required this.newCat, required this.index});
  final List<Category> newCat;
  final int index;

  int? catNnm;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 150,
      height: 40,
      decoration: BoxDecoration(
          color: const Color(0xff1e1b36),
          borderRadius: BorderRadius.circular(15)),
      child: InkWell(
          highlightColor: Colors.red,
          onTap: () {
            catNnm = newCat[index].id;

            CategortdetailsCubit categortdetailsCubit =
                BlocProvider.of(context);
            categortdetailsCubit.getcatdetailscubit(catNnm!);
            GoRouter.of(context).push(AppRouter.KCategoryDetails);
          },
          child: Center(
              child: Text(
            newCat[index].name,
            style: const TextStyle(fontSize: 20, color: Color(0xffebeafa)),
          ))),
    );
  }
}
