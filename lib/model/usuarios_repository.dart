import 'package:reserva_cancha/model/usuario.dart';

abstract class UsuariosRepository {
  Future<Usuario?> fetchUsuarioByUuid(String uuid);
}