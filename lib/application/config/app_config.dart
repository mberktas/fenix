import 'package:fenix/application/config/app_credentials.dart';
import 'package:injectable/injectable.dart';

@Injectable(order: -1)
class AppConfig {
  @singleton
  AppCredentials credentials() {
    return AppCredentials.prod();
  }
}
