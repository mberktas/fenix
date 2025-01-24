import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fenix/core/error/failures.dart';
import 'package:fenix/core/error/usecases/usecase.dart';
import 'package:fenix/features/movie/domain/entities/movie.dart';
import 'package:fenix/features/movie/domain/repositories/movie_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchMovies implements UseCase<List<Movie>, SearchMoviesParams> {
  final MovieRepository repository;

  SearchMovies(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(params) async {
    return await repository.searchMovies(params.query);
  }
}

class SearchMoviesParams extends Equatable {
  final String query;

  const SearchMoviesParams({required this.query});

  @override
  List<Object?> get props => [query];
}
