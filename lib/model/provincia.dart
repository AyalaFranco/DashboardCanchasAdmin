import 'package:reserva_cancha/model/pais.dart';

class Provincia {
  final int idProvincia;
  final Pais idPais;
  final String provincia;

  Provincia({
  required this.idProvincia,
  required this.idPais,
  required this.provincia,
  });

  factory Provincia.fromJson(Map<String, dynamic> json) {
    return Provincia(
      idProvincia: json['idProvincia'],
      idPais: Pais.fromJson(json['idPais']),
      provincia: json['provincia'],
    );
  }
}
