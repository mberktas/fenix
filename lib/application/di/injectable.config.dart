// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../core/services/dio_module.dart' as _i624;
import '../../features/movie/data/datasources/remote/movie_remote_datasource.dart'
    as _i353;
import '../../features/movie/data/repositories/movie_repository_impl.dart'
    as _i863;
import '../../features/movie/data/services/tmdb_client.dart' as _i821;
import '../../features/movie/domain/repositories/movie_repository.dart'
    as _i224;
import '../../features/movie/domain/usecases/search_movies.dart' as _i452;
import '../../features/movie/presentation/bloc/movie_cubit.dart' as _i664;
import '../config/app_config.dart' as _i650;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioModule = _$DioModule();
  gh.factory<_i650.AppConfig>(() => _i650.AppConfig());
  gh.singleton<_i361.Dio>(() => dioModule.dio());
  gh.factoryParam<_i821.TMDBClient, String?, dynamic>((
    baseUrl,
    _,
  ) =>
      _i821.TMDBClient(
        gh<_i361.Dio>(),
        baseUrl: baseUrl,
      ));
  gh.factory<_i353.MovieRemoteDatasource>(
      () => _i353.MovieRemoteDatasource(gh<_i821.TMDBClient>()));
  gh.factory<_i224.MovieRepository>(
      () => _i863.MovieRepositoryImpl(gh<_i353.MovieRemoteDatasource>()));
  gh.factory<_i452.SearchMovies>(
      () => _i452.SearchMovies(gh<_i224.MovieRepository>()));
  gh.factory<_i664.MovieCubit>(
      () => _i664.MovieCubit(gh<_i452.SearchMovies>()));
  return getIt;
}

class _$DioModule extends _i624.DioModule {}
