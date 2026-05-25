import 'package:reserva_cancha/model/provincia.dart';

class Localidad {
  final int idLocalidad;
  final Provincia idProvincia;
  final String localidad;

  Localidad({
  required this.idLocalidad,
  required this.idProvincia,
  required this.localidad,
  });

  factory Localidad.fromJson(Map<String, dynamic> json) {
    return Localidad(
      idLocalidad: json['idLocalidad'],
      idProvincia: Provincia.fromJson(json['idProvincia']),
      localidad: json['localidad'],
    );
  }
}
