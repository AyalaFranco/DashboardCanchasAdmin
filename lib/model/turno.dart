import 'package:reserva_cancha/model/cancha.dart';
import 'package:reserva_cancha/model/configuracionPrecios.dart';

class Turno {
  final int idTurno;
  final double precio;
  final DateTime fechaFinTurno;
  final DateTime fechaInicioTurno;
  final int estadoTurno;
  final ConfiguracionPrecios idConfiguracionPrecios;
  final Cancha idCancha;

  Turno({
    required this.idTurno,
    required this.precio,
    required this.fechaFinTurno,
    required this.fechaInicioTurno,
    required this.estadoTurno,
    required this.idConfiguracionPrecios,
    required this.idCancha,
  });

  factory Turno.fromJson(Map<String, dynamic> json) {
    return Turno(
      idTurno: json['idTurno'],
      precio: json['precio'],
      fechaFinTurno: json['fechaFinTurno'],
      fechaInicioTurno: json['fechaInicioTurno'],
      estadoTurno: json['estadoTurno'],
      idConfiguracionPrecios: ConfiguracionPrecios.fromJson(json['idConfiguracionPrecios']),
      idCancha: Cancha.fromJson(json['idCancha'])
    );
  }

}