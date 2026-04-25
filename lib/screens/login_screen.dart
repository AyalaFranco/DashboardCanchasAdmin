import 'package:flutter/material.dart';
import 'package:reserva_cancha/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailCtrl = TextEditingController();//Acceder al texto del campo
  final _passCtrl = TextEditingController();
  bool _isLogin = true; //Variable de cambio de sesion
  final _auth = AuthService();

  Future<void> _submit() async{ //Funcion de apretar boton
    final email = _emailCtrl.text.trim();
    final password = _passCtrl.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Necesitan llenar los campos")));
      return;
    }

try { //Funcion inicio sesion
    if (_isLogin) {
      await _auth.signIn(email, password);
    } else {
      await _auth.signUp(email , password);
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content : Text(e.toString())));
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
                _isLogin ? "Login" : "Crear Cuenta",
                style: const TextStyle(fontSize:50),
              ),
              TextField(
                controller: _emailCtrl,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: _passCtrl,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () => _submit(),
                child: const Text("Iniciar sesion"),
                ),
                TextButton( //Cambiar de estado o pagina
                  onPressed: () {
                    setState(() => _isLogin =! _isLogin);
                  },
                  child: Text(
                    _isLogin
                    ? "¿No tienes cuenta? Registrate"
                    : "¿Tienes cuenta? Inicia sesion",
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}