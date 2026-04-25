import 'package:flutter/material.dart';

class AppThemes {
  static final ColorScheme _lightColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.green,
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    
    appBarTheme: AppBarTheme(
      backgroundColor: _lightColorScheme.primary,
      foregroundColor: _lightColorScheme.onPrimary,
    ),
  );
}
