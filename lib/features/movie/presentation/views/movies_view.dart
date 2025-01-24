import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fenix/features/movie/presentation/bloc/movie_cubit.dart';
import 'package:fenix/features/movie/presentation/widgets/movies_grid.dart';
import 'package:fenix/features/movie/presentation/widgets/search_input.dart';
import 'package:fenix/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";

@RoutePage()
class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr(LocaleKeys.movies)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          spacing: 20,
          children: [
            SizedBox.shrink(),
            SearchInput(
              onChanged: (query) {
                context.read<MovieCubit>().searchMoviesByQuery(query);
              },
            ),
            BlocBuilder<MovieCubit, MovieState>(
              builder: (context, state) {
                if (state is MovieInitial) {
                  return Center(
                    child: Text(context.tr(LocaleKeys.searchForMovie)),
                  );
                } else if (state is MovieLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is MovieLoaded) {
                  return Expanded(
                    child: MoviesGrid(
                      movies: state.movies,
                    ),
                  );
                } else {
                  return Center(
                    child: Text(context.tr(LocaleKeys.searchNoResults)),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
