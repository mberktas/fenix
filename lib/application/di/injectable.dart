import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import "./injectable.config.dart";

/// DI Container
final sl = GetIt.instance;

/// Initializes the dependency injection container.
@InjectableInit(
    asExtension: false,
    preferRelativeImports: true,
    initializerName: r'$initGetIt')
Future<void> configureDependencies({
  String? environment = Environment.dev,
}) async =>
    $initGetIt(sl, environment: environment);
