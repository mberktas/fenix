import 'package:dio/dio.dart';
import 'package:fenix/application/config/app_config.dart';
import 'package:fenix/application/config/env.dart';
import 'package:fenix/application/di/injectable.dart';
import 'package:injectable/injectable.dart';

import 'logger_service.dart';

@module
@injectable
abstract class DioModule {
  @singleton
  Dio dio() {
    Dio dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.baseUrl = sl<AppConfig>().credentials().apiUrl;
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Add api key to query parameters
        options.queryParameters.addAll({
          "api_key": Env.tmdbApiKey,
        });

        // Add authorization header
        options.headers.addAll({
          "Authorization": "Bearer ${Env.tmdbApiKey}",
        });

        handler.next(options);
      },
      onResponse: (e, handler) {
        handler.next(e);
        //
      },
      onError: (e, handler) {
        logger.e(e);
        handler.next(e);
      },
    ));

    return dio;
  }
}
