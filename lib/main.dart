import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reserva_cancha/data/supabase_localidades_repository.dart';
import 'package:reserva_cancha/data/supabase_reservas_repository.dart';
import 'package:reserva_cancha/data/supabase_servicios_repository.dart';
import 'package:reserva_cancha/data/supabase_usuarios_repository.dart';
import 'package:reserva_cancha/providers/canchas_provider.dart';
import 'package:reserva_cancha/coreAdmin/app_themes.dart';
import 'package:reserva_cancha/data/supabase_canchas_repository.dart';
import 'package:reserva_cancha/providers/localidades_provider.dart';
import 'package:reserva_cancha/providers/reservas_provider.dart';
import 'package:reserva_cancha/providers/servicios_provider.dart';
import 'package:reserva_cancha/providers/usuarios_provider.dart';
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
        ChangeNotifierProvider(
          create: (context) =>
              ServiciosProvider(repository: SupabaseServiciosRepository()),
        ),

        ChangeNotifierProvider(
          create: (context) =>
              CanchasProvider(repository: SupabaseCanchasRepository()),
        ),

        ChangeNotifierProvider(
          create: (context) =>
              LocalidadesProvider(repository: SupabaseLocalidadesRepository()),
        ),

        ChangeNotifierProvider(
          create: (context) =>
              ReservasProvider(repository: SupabaseReservasRepository()),
        ),

        ChangeNotifierProvider(
          create: (context) =>
              UsuariosProvider(repository: SupabaseUsuariosRepository()),
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
