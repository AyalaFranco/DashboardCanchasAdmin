import 'package:reserva_cancha/model/cancha.dart';
import 'package:reserva_cancha/model/configuracion_precios.dart';

class Turno {
  final int idTurno;
  final double precio;
  final DateTime fechaFinTurno;
  final DateTime fechaInicioTurno;
  final int estadoTurno;
  final ConfiguracionPrecios configuracionPrecios;
  final Cancha cancha;

  Turno({
    required this.idTurno,
    required this.precio,
    required this.fechaFinTurno,
    required this.fechaInicioTurno,
    required this.estadoTurno,
    required this.configuracionPrecios,
    required this.cancha,
  });

  factory Turno.fromJson(Map<String, dynamic> json) {
    return Turno(
      idTurno: json['idTurno'],
      precio: json['precio'],
      fechaFinTurno: json['fechaFinTurno'],
      fechaInicioTurno: json['fechaInicioTurno'],
      estadoTurno: json['estadoTurno'],
      configuracionPrecios: ConfiguracionPrecios.fromJson(
        json['CONFIGURACIONPRECIOS'],
      ),
      cancha: Cancha.fromJson(json['CANCHA']),
    );
  }
}
