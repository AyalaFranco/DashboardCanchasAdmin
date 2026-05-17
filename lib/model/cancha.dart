import 'package:reserva_cancha/model/complejo.dart';

class Cancha {
  final int idCancha;
  final String sueloCancha;
  final String tipoCancha;
  final String? imagenCancha;
  final int numeroCancha;
  final Complejo complejo;

  Cancha({
    required this.idCancha,
    required this.sueloCancha,
    required this.tipoCancha,
    required this.imagenCancha,
    required this.numeroCancha,
    required this.complejo,
  });

  factory Cancha.fromJson(Map<String, dynamic> json) {
    return Cancha(
      idCancha: json['idCancha'],
      sueloCancha: json['sueloCancha'],
      tipoCancha: json['tipoCancha'],
      imagenCancha: json['imagenCancha'],
      numeroCancha: json['numeroCancha'],
      complejo: Complejo.fromJson(json['COMPLEJO'])
    );
  }

}
