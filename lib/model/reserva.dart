import 'package:reserva_cancha/model/turno.dart';
import 'package:reserva_cancha/model/usuario.dart';

class Reserva {
  final int idReserva;
  final DateTime fechaAltaReserva;
  final int estadoReserva;
  final double precioReserva;
  final Turno idTurno;
  final Usuario idUsuario;


  Reserva({
  required this.idReserva,
  required this.fechaAltaReserva,
  required this.estadoReserva,
  required this.precioReserva,
  required this.idTurno,
  required this.idUsuario,
  });

  factory Reserva.fromJson(Map<String, dynamic> json) {
    return Reserva(
      idReserva: json['idReserva'],
      fechaAltaReserva: json['fechaAltaReserva'],
      estadoReserva: json['estadoReserva'],
      precioReserva: json['precioReserva'],
      idTurno: Turno.fromJson(json['TURNO']),
      idUsuario: Usuario.fromJson(json['USUARIO'])
    );
  }
  
}
