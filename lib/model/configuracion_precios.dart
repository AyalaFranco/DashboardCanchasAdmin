import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reserva_cancha/model/cancha.dart';

// ¿Esto necesita ser una clase en el modelo?
// Tenía entendido que la relación en la BD era más bien por temas de auditoría.
// Un turno como tal no tiene una "ConfiguracionPrecios" como atributo, ...
// ... esta corresponde más bien a una plantilla para generarlo.
class ConfiguracionPrecios {
  final int idConfiguracionPrecios;
  final int diasAplicados;
  final TimeOfDay horaInicio;
  final TimeOfDay horaFin;
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
      horaInicio: TimeOfDay.fromDateTime(DateFormat("hh:mm:ss").parse(json['horaInicio'])),
      horaFin: TimeOfDay.fromDateTime(DateFormat("hh:mm:ss").parse(json['horaFin'])),
      precio: json['precio'].toDouble(),
      cancha: Cancha.fromJson(json['CANCHA']),
    );
  }
}
