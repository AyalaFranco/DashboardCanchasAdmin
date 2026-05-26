import 'package:flutter/material.dart';
import 'package:reserva_cancha/components/locality_selector.dart';
import 'package:reserva_cancha/core/box_decorations.dart';
import 'package:reserva_cancha/model/localidad.dart';
import 'package:reserva_cancha/screens/cca_home_screen.dart';
import 'package:reserva_cancha/screens/login_screen.dart';
import 'package:reserva_cancha/services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nombreUsuarioController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final telephoneNumberController = TextEditingController();
  final direccionController = TextEditingController();
  Localidad? _selectedLocalidad;

  final _auth = AuthService();

  Future<void> _submit() async {
    final nombreUsuario = nombreUsuarioController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final telephone = telephoneNumberController.text.trim();
    final direccion = direccionController.text.trim();
    int localidad = _selectedLocalidad?.idLocalidad ?? -1;

    if (nombreUsuario.isEmpty || email.isEmpty || password.isEmpty || telephone.isEmpty || direccion.isEmpty || localidad == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Necesitan llenar los campos")),
      );
      return;
    }

    try {
      await _auth.signUp(
        nombreUsuario: nombreUsuario,
        email: email,
        password: password,
        telephone: telephone,
        direccion: direccion,
        localidad: localidad,
      );

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => CCAHomeScreen()),
      );
    } catch (e) {
      if (!mounted) return;
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
          child: SingleChildScrollView(
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
                _buildInputField(contextText, nombreUsuarioController, "Nombre de Usuario"),
                _buildInputField(contextText, emailController, "Email"),
                _buildInputField(
                  contextText,
                  passwordController,
                  "Password",
                  obscureText: true,
                ),
                _buildInputField(contextText, direccionController, "Direccion"),
                _buildInputField(
                  contextText,
                  telephoneNumberController,
                  "Telephone",
                ),
                LocalitySelector(onSelectedLocalidad: (loc) => _selectedLocalidad = loc),
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
      ),
    );
  }

  @override
  void dispose() {
    nombreUsuarioController.dispose();
    emailController.dispose();
    passwordController.dispose();
    telephoneNumberController.dispose();
    direccionController.dispose();
    super.dispose();
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

  Padding _buildInputField(
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