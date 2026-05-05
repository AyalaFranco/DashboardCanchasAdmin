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
  bool _isLogin = true; //Variable de cambio de sesion
  final _auth = AuthService();

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
  
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => CCAHomeScreen()),
      );
  
try { //Funcion inicio sesion
    if (_isLogin) {
      await _auth.signIn(email, password);
    } else {
      await _auth.signUp(email , password);
    }
  }catch(e){
    print("Hola");
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
                    
                    _isLogin ? "LogIn" : "Sign In",
                    style: contextText.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              paddingButtons("Email", _emailCtrl),
              paddingButtons("Password", _passCtrl, obscureText: true),
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
                      MaterialPageRoute(builder: (_) => registerPage()));
                },
                child: Text(
                      "¿No tienes cuenta? Registrate"
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Padding paddingButtons(
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
          labelStyle: contextText.bodyMedium!.copyWith(fontStyle: FontStyle.italic),
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
