import 'package:reserva_cancha/model/localidad.dart';

class Usuario {
  //NO ES UN ERROR QUE EL ID SEA STRING -> En la BD lo tenemos como uuid
  final String idUsuario;
  final String nombreUsuario;
  final String? telefonoUsuario;
  final String correoUsuario;
  final String direccionUsuario;
  final bool esAdmin;
  final DateTime fechaAlta;
  final Localidad localidad;

  Usuario({
    required this.idUsuario,
    required this.nombreUsuario,
    required this.telefonoUsuario,
    required this.correoUsuario,
    required this.direccionUsuario,
    required this.esAdmin,
    required this.fechaAlta,
    required this.localidad,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      idUsuario: json['idUsuario'],
      nombreUsuario: json['nombreUsuario'],
      telefonoUsuario: json['telefonoUsuario'],
      correoUsuario: json['correoUsuario'],
      direccionUsuario: json['direccionUsuario'],
      esAdmin: json['esAdmin'],
      fechaAlta: DateTime.parse(json['fechaAlta']),
      localidad: Localidad.fromJson(json['LOCALIDAD'])
    );
  }
}
