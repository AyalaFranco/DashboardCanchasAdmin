import 'package:flutter/material.dart';
import 'package:reserva_cancha/admin/dashboard_screen.dart';
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
          return const dashboard();
         // return const CCAHomeScreen();//home
        } else {
          return const dashboard();
        }
      },
    );
  }
}