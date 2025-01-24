import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fenix/features/movie/domain/entities/movie.dart';
import 'package:fenix/features/movie/domain/usecases/search_movies.dart';
import 'package:injectable/injectable.dart';

part 'movie_state.dart';

@injectable
class MovieCubit extends Cubit<MovieState> {
  MovieCubit(this.searchMovies) : super(MovieInitial());

  final SearchMovies searchMovies;

  void searchMoviesByQuery(String query) async {
    emit(MovieLoading());
    final result = await searchMovies(SearchMoviesParams(query: query));
    result.fold(
      (failure) => emit(MovieError(failure.toString())),
      (movies) {
        if (movies.isEmpty) {
          return emit(MovieEmpty());
        }
        return emit(MovieLoaded(movies));
      },
    );
  }
}
