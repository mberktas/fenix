import 'package:dartz/dartz.dart';
import 'package:fenix/core/error/failures.dart';
import 'package:fenix/core/services/logger_service.dart';
import 'package:fenix/features/movie/data/datasources/remote/movie_remote_datasource.dart';
import 'package:fenix/features/movie/domain/entities/movie.dart';
import 'package:fenix/features/movie/domain/repositories/movie_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MovieRepository)
class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDatasource _remoteDatasource;

  MovieRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query) async {
    try {
      final response = await _remoteDatasource.searchMovies(query);
      return Right(response.results.map((e) => Movie.fromModel(e)).toList());
    } on Exception catch (e) {
      logger.e(e.toString());
      return Left(ServerFailure());
    }
  }
}
