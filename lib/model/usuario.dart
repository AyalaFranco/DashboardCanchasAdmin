import 'package:reserva_cancha/model/Localidad.dart';
import 'package:reserva_cancha/model/authUsers.dart';

class Usuario {
  final String nombreUsuario;
  final int telefonoUsuario;
  final String correoUsuario;
  final bool esAdmin;
  final DateTime fechaAlta;
  final Localidad idLocalidad;
  final AuthUsers idUsuario;

  Usuario({
  required this.nombreUsuario,
  required this.telefonoUsuario,
  required this.correoUsuario,
  required this.esAdmin,
  required this.fechaAlta,
  required this.idLocalidad,
   required this.idUsuario,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      nombreUsuario: json['nombreUsuario'],
      telefonoUsuario: json['telefonoUsuario'],
      correoUsuario: json['correoUsuario'],
      esAdmin: json['esAdmin'],
      fechaAlta: json['fechaAlta'],
      idLocalidad: Localidad.fromJson(json['idLocalidad']),
      idUsuario: AuthUsers.fromJson(json['idUsuario'])
    );
  }
}