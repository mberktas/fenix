import 'package:dartz/dartz.dart';
import 'package:fenix/features/movie/domain/entities/movie.dart';
import 'package:fenix/features/movie/domain/repositories/movie_repository.dart';
import 'package:fenix/features/movie/domain/usecases/search_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_movies_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])
void main() {
  late SearchMovies usecase;
  late MovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = SearchMovies(mockMovieRepository);
  });

  test('should get data from the repository', () async {
    final searchQuery = "The Avengers";
    final searchMovieParams = SearchMoviesParams(query: searchQuery);
    final movies = [
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

    when(mockMovieRepository.searchMovies(searchQuery))
        .thenAnswer((_) async => Right(movies));

    final result = await usecase(searchMovieParams);

    expect(result, Right(movies));
    verify(mockMovieRepository.searchMovies(searchQuery));
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
