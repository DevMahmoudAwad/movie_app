import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/core/utils/app_router.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int y = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (x) {
          setState(() {
            y = x;
            if (y == 2) {
              GoRouter.of(context).push(AppRouter.KSaveMovies);
            } else if (y == 1) {
              GoRouter.of(context).push(AppRouter.KSearchMovies);
            } else if (y == 0) {
              GoRouter.of(context).push(AppRouter.KHomePage);
            }
          });
        },
        currentIndex: y,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xff605e73),
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Color(0xff26233e),
              icon: Icon(Icons.home),
              label: "Home"),
          BottomNavigationBarItem(
              backgroundColor: Color(0xff26233e),
              icon: Icon(Icons.search),
              label: "Search"),
          BottomNavigationBarItem(
              backgroundColor: Color(0xff26233e),
              icon: Icon(Icons.save),
              label: "Saved"),
          BottomNavigationBarItem(
              backgroundColor: Color(0xff26233e),
              icon: Icon(Icons.download),
              label: "Downloads"),
          BottomNavigationBarItem(
              backgroundColor: Color(0xff26233e),
              icon: Icon(Icons.login),
              label: "Me"),
        ]);
  }
}
