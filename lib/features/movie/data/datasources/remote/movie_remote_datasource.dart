import 'package:fenix/features/movie/data/models/search_response.dart';
import 'package:fenix/features/movie/data/services/tmdb_client.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieRemoteDatasource {
  final TMDBClient _client;

  MovieRemoteDatasource(this._client);

  Future<SearchResponse> searchMovies(String query) async {
    return await _client.searchMovies(query);
  }
}
