import 'package:flutter/material.dart';
import 'package:reserva_cancha/screens/cca_home_screen.dart';
import 'package:reserva_cancha/screens/login_screen.dart';
import 'package:reserva_cancha/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isRegister = true; //Variable de cambio de sesion
  final _auth = AuthService();

   Future<void> _submit() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Necesitan llenar los campos")),
      );
      return;
    }

    try {
      if (_isRegister) {
        await _auth.signUp(email, password);
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => CCAHomeScreen()),
      );

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Crear Cuenta",
                style: const TextStyle(fontSize:50),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: _submit,
                child: const Text("Registrarse"),
                ),
                TextButton( //Cambiar de estado o pagina
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginPage())
                      );
                  },
                  child: Text(
                  "¿Tienes cuenta? Inicia sesion",
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}