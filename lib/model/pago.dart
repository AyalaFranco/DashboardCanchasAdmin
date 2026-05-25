import 'package:reserva_cancha/model/reserva.dart';

class Pago {
  final int idPago;
  final DateTime fechaAltaPago;
  final String? metodoPago;
  final Reserva reserva;
  final double montoPago;
  final DateTime fechaPago;
  final int estadoPago;

  Pago({
    required this.idPago,
    required this.fechaAltaPago,
    required this.metodoPago,
    required this.reserva,
    required this.montoPago,
    required this.fechaPago,
    required this.estadoPago,
  });

  factory Pago.fromJson(Map<String, dynamic> json) {
    return Pago(
      idPago: json['idPago'],
      fechaAltaPago: DateTime.parse(json['fechaAltaPago']),
      metodoPago: json['metodoPago'],
      reserva: Reserva.fromJson(json['RESERVA']),
      montoPago: json['montoPago'],
      fechaPago: DateTime.parse(json['fechaPago']),
      estadoPago: json['estadoPago'],
    );
  }
}
