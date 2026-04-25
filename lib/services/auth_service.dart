import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService { //Servicios de autenticacion (Inicio de sesion/registro/cierre)
  final SupabaseClient _client = Supabase.instance.client; //Aceder al cliente

  Future<void> signUp(String email, String password)async { //Metodo signUp
    final response = await _client.auth.signUp( 
      email: email , password: password);

  if (response.user == null){
    throw Exception("Erorr al registrarse!!!");
    }
  }

  Future<void> signIn(String email, String password) async{ //Inicio sesion
    final response = await _client.auth.signInWithPassword(
        email: email , password: password);

    if (response.user == null){
      throw Exception("Erorr al Iniciar sesion!!!");
    }
  }

  Future<void> signOut() async{ //Cierre sesion
  await _client.auth.signOut();
  }

  Stream <AuthState> get authState => _client.auth.onAuthStateChange; //Getter de estado de autenticacion
}