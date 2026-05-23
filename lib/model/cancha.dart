import 'package:reserva_cancha/model/complejo.dart';

class Cancha {
  final int?
  idCancha; //id puede ser null si el objeto viene de la app en lugar de la DB
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
      complejo: Complejo.fromJson(json['COMPLEJO']),
    );
  }

  Map<String, dynamic> toDbJson() {
    return {
      'sueloCancha': sueloCancha,
      'tipoCancha': tipoCancha,
      'imagenCancha': imagenCancha,
      'numeroCancha': numeroCancha,
      'idComplejo': complejo.idComplejo,
    };
  }

  Cancha copyWith({
    int? idCancha,
    String? sueloCancha,
    String? tipoCancha,
    String? imagenCancha,
    int? numeroCancha,
    Complejo? complejo,
  }) {
    return Cancha(
      idCancha: idCancha ?? this.idCancha,
      sueloCancha: sueloCancha ?? this.sueloCancha,
      tipoCancha: tipoCancha ?? this.tipoCancha,
      imagenCancha: imagenCancha ?? this.imagenCancha,
      numeroCancha: numeroCancha ?? this.numeroCancha,
      complejo: complejo ?? this.complejo,
    );
  }
}
