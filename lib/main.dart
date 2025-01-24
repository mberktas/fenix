import 'package:easy_localization/easy_localization.dart';
import 'package:fenix/app.dart';
import 'package:fenix/application/di/injectable.dart';
import 'package:fenix/core/localization/localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureDependencies();

  runApp(LocalizationWrapper.app(App()));
}
