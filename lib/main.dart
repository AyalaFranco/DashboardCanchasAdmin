import 'package:flutter/material.dart';
import 'package:reserva_cancha/core/app_themes.dart';
import 'package:reserva_cancha/screens/cca_home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CCAHomeScreen(),
      theme: AppThemes.lightTheme,
    );
  }
}
