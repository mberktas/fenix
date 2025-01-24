import 'package:dartz/dartz.dart';
import 'package:fenix/features/movie/domain/entities/movie.dart';
import 'package:fenix/features/movie/domain/usecases/search_movies.dart';
import 'package:fenix/features/movie/presentation/bloc/movie_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movie_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SearchMovies>()])
void main() {
  late MovieCubit cubit;
  late MockSearchMovies mockSearchMovies;

  setUp(() {
    mockSearchMovies = MockSearchMovies();
    cubit = MovieCubit(mockSearchMovies);
  });

  test('initial state should be MovieInitial', () {
    expect(cubit.state, equals(MovieInitial()));
  });

  group("SearchMovies", () {
    final searchQuery = "The Avengers";
    final searchMovieParams = SearchMoviesParams(query: searchQuery);
    final List<Movie> movies = [
      Movie(
        id: 1,
        title: "The Avengers",
        overview:
            "Earth's mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.",
        releaseDate: DateTime.parse("2012-04-25"),
        posterPath: "/cezWGskPY5x7GaglTTRN4Fugfb8.jpg",
        backdropPath: "/hbn46fQaRmlpBuUrEiFqv0GDL6Y.jpg",
        voteAverage: 7.7,
        voteCount: 221,
      ),
    ];
    test("should get data from the searchMovies use case", () async {
      when(mockSearchMovies.call(searchMovieParams))
          .thenAnswer((_) async => Right(movies));

      cubit.searchMoviesByQuery(searchQuery);

      await untilCalled(mockSearchMovies.call(searchMovieParams));

      verify(mockSearchMovies.call(searchMovieParams)).called;
    });

    test(
        "should emit [MovieLoading, MovieLoaded] when data is gotten successfully",
        () async {
      when(mockSearchMovies.call(searchMovieParams))
          .thenAnswer((_) async => Right(movies));

      final expected = [
        MovieLoading(),
        MovieLoaded(movies),
      ];

      expectLater(cubit.stream, emitsInOrder(expected));

      cubit.searchMoviesByQuery(searchQuery);
    });

    test("should emit MovieEmpty when data is empty", () async {
      when(mockSearchMovies.call(searchMovieParams))
          .thenAnswer((_) async => Right([]));

      final expected = [
        MovieLoading(),
        MovieEmpty(),
      ];

      expectLater(cubit.stream, emitsInOrder(expected));

      cubit.searchMoviesByQuery(searchQuery);
    });
  });
}
