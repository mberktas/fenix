import 'package:fenix/features/movie/domain/entities/movie.dart';
import 'package:fenix/features/movie/presentation/widgets/movies_grid_item.dart';
import 'package:flutter/material.dart';

class MoviesGrid extends StatelessWidget {
  const MoviesGrid({super.key, required this.movies});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return MoviesGridItem(
          movie: movies[index],
        );
      },
      itemCount: movies.length,
    );
  }
}
