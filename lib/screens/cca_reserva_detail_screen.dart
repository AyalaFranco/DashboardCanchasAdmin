import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reserva_cancha/components/info_text.dart';
import 'package:reserva_cancha/components/reservas_detail.dart';
import 'package:reserva_cancha/coreAdmin/box_decorations.dart';
import 'package:reserva_cancha/model/reserva.dart';

class CcaReservaDetailScreen extends StatelessWidget {
  final Reserva reserva;

  const CcaReservaDetailScreen({super.key, required this.reserva});

  @override
  Widget build(BuildContext context) {
    final turno = reserva.turno;
    final cancha = turno.cancha;
    final ctxColors = ColorScheme.of(context);
    final ctxTexts = TextTheme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text("Detalles de tu Reserva")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          //height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReservaDetail(reserva: reserva),
              const SizedBox(height: 8),
              Spacer(),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ctxColors.primary,
                    foregroundColor: ctxColors.onPrimary,
                    textStyle: ctxTexts.bodyLarge,
                  ),
                  child: const Text("Volver Atrás"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}