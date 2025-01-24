import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum LangCode {
  tr,
  en;

  Locale get toLocale => LocalizationWrapper.supportedLocales[this]!;
}

class LocalizationWrapper {
  LocalizationWrapper._();

  static const String _localizationPath = 'lib/application/i18n';

  static const Map<LangCode, Locale> supportedLocales = {
    LangCode.tr: Locale('tr', 'TR'),
    LangCode.en: Locale('en', 'US'),
  };

  static Widget app(Widget app) {
    return EasyLocalization(
      supportedLocales: supportedLocales.values.toList(),
      path: _localizationPath,
      fallbackLocale: supportedLocales[LangCode.en],
      child: app,
    );
  }
}
