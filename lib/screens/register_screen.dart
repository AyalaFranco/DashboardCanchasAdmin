import 'package:flutter/material.dart';
import 'package:reserva_cancha/core/box_decorations.dart';
import 'package:reserva_cancha/screens/cca_home_screen.dart';
import 'package:reserva_cancha/screens/login_screen.dart';
import 'package:reserva_cancha/services/auth_service.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final telephoneNumberController = TextEditingController();
  final direccionController = TextEditingController();
  final localidadController= TextEditingController();


  bool _isRegister = true; //Variable de cambio de sesion
  final _auth = AuthService();

  Future<void> _submit() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final telephone = telephoneNumberController.text.trim();
    final dni= direccionController.text.trim();
    int localidad=1;
    //parse(localidadController.text.trim());
    //cambiar localidad a final cuando se resuelva
    
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Necesitan llenar los campos")),
      );
      return;
    }

    try {
      if (_isRegister) {
        await _auth.signUp(email, password,telephone,dni, localidad);
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => CCAHomeScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
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
                  alignment: Alignment.center,
                  child: Text("Crear Cuenta", style: contextText.bodyLarge),
                ),
              ),
              paddingButtons(contextText, emailController, "Email"),
              paddingButtons(
                contextText,
                passwordController,
                "Password",
                obscureText: true,
              ),
              paddingButtons(contextText, direccionController, "Direccion"),
              paddingButtons(contextText, telephoneNumberController, "Telephone"),
              Padding(
                padding: const EdgeInsets.all(6),
                child: ElevatedButton(
                  onPressed: _submit,
                  child: const Text("Registrarse"),
                ),
              ),

              TextButton(
                //Cambiar de estado o pagina
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoginPage()),
                  );
                },

                child: Text("¿Tienes cuenta? Inicia sesion"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField textFields(TextTheme contextText, String texto) {
    return TextField(
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
    );
  }

  Padding paddingButtons(
    TextTheme contextText,
    TextEditingController controller,
    String texto, {
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
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
