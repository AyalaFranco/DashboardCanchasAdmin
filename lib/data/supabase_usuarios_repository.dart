import 'package:reserva_cancha/model/usuario.dart';
import 'package:reserva_cancha/model/usuarios_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseUsuariosRepository implements UsuariosRepository {
  final _client = Supabase.instance.client;

  @override
  Future<Usuario?> fetchUsuarioByUuid(String uuid) async {
    final response = await _client
        .from('USUARIO')
        .select('*, LOCALIDAD(*, PROVINCIA(*, PAIS(*)))')
        .eq('idUsuario', uuid)
        .maybeSingle();

    if(response == null) return null;
    return Usuario.fromJson(response);
  }
}