import 'package:reserva_cancha/model/cancha.dart';

// ¿Esto necesita ser una clase en el modelo?
// Tenía entendido que la relación en la BD era más bien por temas de auditoría.
// Un turno como tal no tiene una "ConfiguracionPrecios" como atributo, ...
// ... esta corresponde más bien a una plantilla para generarlo.
class ConfiguracionPrecios {
  final int idConfiguracionPrecios;
  final int diasAplicados;
  final DateTime horaInicio;
  final DateTime horaFin;
  final double precio;
  final Cancha cancha;

  ConfiguracionPrecios({
    required this.idConfiguracionPrecios,
    required this.diasAplicados,
    required this.horaInicio,
    required this.horaFin,
    required this.precio,
    required this.cancha,
  });

  factory ConfiguracionPrecios.fromJson(Map<String, dynamic> json) {
    return ConfiguracionPrecios(
      idConfiguracionPrecios: json['idConfiguracionPrecios'],
      diasAplicados: json['diasAplicados'],
      horaInicio: DateTime.parse(json['horaInicio']),
      horaFin: DateTime.parse(json['horaFin']),
      precio: json['precio'],
      cancha: Cancha.fromJson(json['CANCHA']),
    );
  }
}
