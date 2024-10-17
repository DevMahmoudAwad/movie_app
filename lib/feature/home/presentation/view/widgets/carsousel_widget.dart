import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import 'package:moviesapp/feature/home/presentation/controller/all_movies_cubit/all_movies_cubit.dart';
import 'package:moviesapp/feature/home/presentation/controller/all_movies_cubit/all_movies_state.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // AllMoviesCubit cubit = BlocProvider.of(context);
    // List<Results>? val = cubit.getAllMoviesCubit();

    return BlocBuilder<AllMoviesCubit, AllMoviesState>(
      builder: (context, state) {
        if (state is AllMoviesLoadded) {
          return Container(
              child: FlutterCarousel(
            options: FlutterCarouselOptions(
              height: 450,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
            ),
            items: [0, 1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,

                    decoration: BoxDecoration(
                        color: const Color(0xff07041f),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500${state.results[i].posterPath}"))),
                    // child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                  );
                },
              );
            }).toList(),
          ));
        } else if (state is AllMoviesError) {
          return Text(state.error);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
