import "package:dio/dio.dart";
import "package:fenix/features/movie/data/models/search_response.dart";
import "package:flutter/foundation.dart";
import "package:injectable/injectable.dart";
import "package:retrofit/retrofit.dart";

part "tmdb_client.g.dart";

@injectable
@RestApi(parser: Parser.FlutterCompute)
abstract class TMDBClient {
  @factoryMethod
  factory TMDBClient(Dio dio, {@factoryParam String? baseUrl}) = _TMDBClient;

  @GET("/search/movie")
  Future<SearchResponse> searchMovies(@Query("query") String query);
}

SearchResponse deserializeSearchResponse(Map<String, dynamic> json) {
  return SearchResponse.fromJson(json);
}
