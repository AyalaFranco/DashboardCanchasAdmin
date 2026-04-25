import 'package:flutter/material.dart';
import 'package:reserva_cancha/services/auth_service.dart';

class Loginhome extends StatelessWidget {
  const Loginhome({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio"),
      actions: [
        IconButton(
          onPressed: () => auth.signOut(), //Salir sesion
          icon: const Icon(Icons.logout)),
      ],
    ), 
      body: const Center(child: Text("Sesion iniciada!!")),
    );
  }
}