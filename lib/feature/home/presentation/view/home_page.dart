import 'package:flutter/material.dart';
import 'package:moviesapp/feature/home/presentation/view/widgets/bottom_navigation_widget.dart';
import 'package:moviesapp/feature/home/presentation/view/widgets/carsousel_widget.dart';
import 'package:moviesapp/feature/home/presentation/view/widgets/category_list_wedgit.dart';
import 'package:moviesapp/feature/home/presentation/view/widgets/movies_list_wedgit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff07041f),
      body: Column(
        children: [
          Expanded(child: Container(child: const CarouselWidget())),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Catagories",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xfff4f3ff)),
                      ),
                    ),
                  ],
                ),
                CategoryListWidget(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Most Popular",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xfff4f3ff)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(child: MovieListWidget()),
          Container(child: const BottomNavigationWidget())
        ],
      ),
    );
  }
}
