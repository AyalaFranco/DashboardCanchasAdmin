import 'package:flutter/material.dart';
import 'package:reserva_cancha/screens/cca_home_screen.dart';
import 'package:reserva_cancha/screens/login_screen.dart';
import 'package:reserva_cancha/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {

    final auth = AuthService();

    return StreamBuilder<AuthState>( //Validar sesion
      stream: auth.authState,
      builder: (context, snapshot){//Muestra los estados del widget
        final session = snapshot.data?.session;

        if (session != null){
          return const LoginPage(); //Esto está mal y habría que cambiarlo en el futuro.
          //Se crean sesiones fantasmas que, si bien no están activas en el dispositivo...
          //...sí lo están en la base de datos, dando posibles problemas de integridad.
         //return const CCAHomeScreen();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}