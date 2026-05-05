import 'package:flutter/material.dart';
import 'package:reserva_cancha/core/app_colors.dart';

class AppThemes {
  static final ColorScheme _lightColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.green,
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,

    textTheme: TextTheme(
      titleMedium: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 20),
      bodyMedium: TextStyle(fontSize: 16),
      bodySmall: TextStyle(fontSize: 10, color: Colors.grey),
    ),
    
    appBarTheme: AppBarTheme(
      backgroundColor: _lightColorScheme.primary,
      foregroundColor: _lightColorScheme.onPrimary,
      surfaceTintColor: _lightColorScheme.surface

    ),
    
  );
}
