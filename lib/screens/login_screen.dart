import 'package:flutter/material.dart';
import 'package:reserva_cancha/screens/cca_home_screen.dart';
import 'package:reserva_cancha/services/auth_service.dart';
import 'package:reserva_cancha/core/box_decorations.dart';
import 'package:reserva_cancha/screens/register_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailCtrl = TextEditingController(); //Acceder al texto del campo
  final _passCtrl = TextEditingController();
  final _auth = AuthService();

  Future<bool> _performBiometricAuth() async {
    try {
      bool authSucces = await _auth.authenticate();
      return authSucces;
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error En Huella Biométrica: ${e.toString()}"),
          ),
        );
      }
      return false;
    }
  }

  Future<void> _submit() async {
    //Funcion de apretar boton
    final email = _emailCtrl.text.trim();
    final password = _passCtrl.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Necesitas llenar los campos")),
      );
      return;
    }

    try {
      //Funcion inicio sesion
      await _auth.signIn(email, password);

      if (!mounted) return;

      bool biometricAuth = await _performBiometricAuth();

      if (mounted && biometricAuth) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => CCAHomeScreen()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error en TrySignIn:${e.toString()}")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final contextText = TextTheme.of(context);

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecorations.regularContainer(context),
                  width: 160,
                  child: Text(
                    "Iniciar Sesión",
                    style: contextText.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              _buildInputField("Email", _emailCtrl),
              _buildInputField("Password", _passCtrl, obscureText: true),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: ElevatedButton(
                  onPressed: () => _submit(),
                  child: const Text("Iniciar sesion"),
                ),
              ),
              TextButton(
                //Cambiar de estado o pagina
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => RegisterScreen()),
                  );
                },
                child: Text("¿No tienes cuenta? Registrate"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildInputField(
    String texto,
    TextEditingController controller, {
    bool obscureText = false,
  }) {
    final contextText = TextTheme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelStyle: contextText.bodyMedium!.copyWith(
            fontStyle: FontStyle.italic,
          ),
          labelText: texto,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
