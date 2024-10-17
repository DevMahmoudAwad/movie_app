import 'package:flutter/material.dart';
import 'package:moviesapp/feature/home/presentation/view/widgets/category_details_list_wedgit.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CategoryDetailsListWedgit()],
      ),
    );
  }
}
