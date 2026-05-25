import 'package:reserva_cancha/model/cancha.dart';

class ConfiguracionPrecios {
  final int idConfiguracionPrecios;
  final int diasAplicados;
  final DateTime horaInicio;
  final DateTime horaFin;
  final double precio;
  final Cancha idCancha;

  ConfiguracionPrecios({
    required this.idConfiguracionPrecios,
    required this.diasAplicados,
    required this.horaInicio,
    required this.horaFin,
    required this.precio,
    required this.idCancha,
  });

  factory ConfiguracionPrecios.fromJson(Map<String, dynamic> json) {
    return ConfiguracionPrecios(
      idConfiguracionPrecios: json['idConfiguracionPrecios'],
      diasAplicados: json['diasAplicados'],
      horaInicio: json['horaInicio'],
      horaFin: json['horaFin'],
      precio: json['precio'],
      idCancha: Cancha.fromJson(json['idCancha'])
    );
  }
} 