import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/feature/home/presentation/controller/category_details_cubit/categortdetails_cubit.dart';
import 'package:moviesapp/feature/home/presentation/controller/category_details_cubit/categortdetails_state.dart';
import 'package:moviesapp/feature/home/presentation/view/widgets/category_details_item_wedgit.dart';

class CategoryDetailsListWedgit extends StatelessWidget {
  const CategoryDetailsListWedgit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategortdetailsCubit, CategortdetailsState>(
      builder: (context, state) {
        if (state is CategortdetailsLoadded) {
          return Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    //crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return CategoryDetailsItemWedgit(results: state.cat[index]);
                },
                itemCount: state.cat.length),
          );
        } else if (state is CategortdetailsError) {
          return const Text("Error");
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
