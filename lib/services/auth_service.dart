import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:local_auth/local_auth.dart';

class AuthService {
  //Servicios de autenticacion (Inicio de sesion/registro/cierre)
  final SupabaseClient _client = Supabase.instance.client; //Aceder al cliente
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> authenticate() async {
    // Verificar si el dispositivo soporta biometría
    final bool canCheck = await auth.canCheckBiometrics;
    final bool isSupported = await auth.isDeviceSupported();

    if (!canCheck || !isSupported) return false;

    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Autenticate para continuar',
        options: const AuthenticationOptions(
          biometricOnly: false, // false = permite PIN como fallback
          stickyAuth: true, // mantiene el diálogo si la app pasa a background
        ),
      );

      if (didAuthenticate) {
        return true;
      }
    } on Exception catch (e) {
      print('Error: ${e.toString()}');
    }
    return false;
  }

  Future<void> signUp({
    required String nombreUsuario,
    required String email,
    required String password,
    required String telephone,
    required String direccion,
    int? localidad,
  }
  ) async {
    //Metodo signUp
    final response = await _client.auth.signUp(
      email: email,
      password: password,
      data: {
        "nombreUsuario" : nombreUsuario,
        "direccion": direccion,
        "telephone": telephone,
        "idLocalidad": localidad,
      },
    );

    if (response.user == null) {
      throw Exception("Erorr al registrarse!!!");
    }
  }

  Future<void> signIn(String email, String password) async {
    //Inicio sesion
    final response = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user == null) {
      throw Exception("Erorr al Iniciar sesion!!!");
    }
  }

  Future<void> signOut() async {
    //Cierre sesion
    await _client.auth.signOut();
  }

  Stream<AuthState> get authState =>
      _client.auth.onAuthStateChange; //Getter de estado de autenticacion
}
