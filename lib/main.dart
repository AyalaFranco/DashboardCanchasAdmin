import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reserva_cancha/data/supabase_reservas_repository.dart';
import 'package:reserva_cancha/model/reservas_repository.dart';
import 'package:reserva_cancha/providers/canchas_provider.dart';
import 'package:reserva_cancha/core/app_themes.dart';
import 'package:reserva_cancha/data/supabase_canchas_repository.dart';
import 'package:reserva_cancha/model/canchas_repository.dart';
import 'package:reserva_cancha/providers/reservas_provider.dart';
import 'package:reserva_cancha/services/auth/auth_gate.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://qqyywtlistoirjpbkeyx.supabase.co',
    anonKey: 'sb_publishable_0yJ5oU4X6NFXliTSnMZh3Q_WJ0GB5ZH',
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<CanchasRepository>(create: (_) => SupabaseCanchasRepository()),

        ChangeNotifierProvider(
          create: (context) =>
              CanchasProvider(repository: context.read<CanchasRepository>()),
        ),

        Provider<ReservasRepository>(create: (_) => SupabaseReservasRepository()),

        ChangeNotifierProvider(
          create: (context) =>
              ReservasProvider(repository: context.read<ReservasRepository>()),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AuthGate(), theme: AppThemes.lightTheme);
  }
}
