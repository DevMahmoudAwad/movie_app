import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/feature/home/presentation/controller/category_cubit/category_cubit.dart';
import 'package:moviesapp/feature/home/presentation/controller/category_cubit/category_state.dart';
import 'package:moviesapp/feature/home/presentation/view/widgets/category_item_wedgit.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
      if (state is CategoryLoadded) {
        return SizedBox(
          height: 40,
          child: Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryItemsWidget(newCat: state.cat, index: index);
                },
                itemCount: state.cat.length),
          ),
        );
      } else if (state is CategoryError) {
        return const Text("Error");
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
