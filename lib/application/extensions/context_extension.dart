import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
  ThemeData get theme => Theme.of(this);
}
