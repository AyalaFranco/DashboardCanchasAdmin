import 'package:reserva_cancha/model/turno.dart';
import 'package:reserva_cancha/model/usuario.dart';

class Reserva {
  final int idReserva;
  final DateTime fechaAltaReserva;
  final int estadoReserva;
  final double precioReserva;
  final Turno turno;
  final Usuario usuario;

  Reserva({
    required this.idReserva,
    required this.fechaAltaReserva,
    required this.estadoReserva,
    required this.precioReserva,
    required this.turno,
    required this.usuario,
  });

  factory Reserva.fromJson(Map<String, dynamic> json) {
    return Reserva(
      idReserva: json['idReserva'],
      fechaAltaReserva: DateTime.parse(json['fechaAltaReserva']),
      estadoReserva: json['estadoReserva'],
      precioReserva: json['precioReserva'],
      turno: Turno.fromJson(json['TURNO']),
      usuario: Usuario.fromJson(json['USUARIO']),
    );
  }
}
