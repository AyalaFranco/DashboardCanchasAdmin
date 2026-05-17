import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reserva_cancha/components/date_picker.dart';
import 'package:reserva_cancha/components/service_display.dart';
import 'package:reserva_cancha/components/time_picker.dart';
import 'package:intl/intl.dart';
import 'package:reserva_cancha/core/box_decorations.dart';
import 'package:reserva_cancha/model/cancha.dart';

class ConfirmationScreen extends StatefulWidget {
  final Cancha field;

  const ConfirmationScreen({super.key, required this.field});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  int? _selectedHour;
  DateTime? _selectedDate;

  String get _confirmationButtonText {
    String text = "CONFIRMAR RESERVA";

    if (_selectedDate != null) {
      text += " ${DateFormat('dd/MM/yyyy').format(_selectedDate!)}";
      if (_selectedHour != null) {
        text += " $_selectedHour:00hs";
      }
    }

    return text;
  }

  String _reservationCode(String fieldName) {
    String text = fieldName.substring(0, 3).trim().toUpperCase();
    return "$text-${Random().nextInt(999)}";
  }

  @override
  Widget build(BuildContext context) {
    final contextColors = ColorScheme.of(context);
    final contextText = TextTheme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text("Confirmación Reserva")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _ConfirmationHeader(
              image: widget.field.imagenCancha ?? "null.png",
              title: widget.field.complejo.nombreComplejo,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecorations.regularContainer(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detalles",
                          style: contextText.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _InfoText(
                          label: 'Ubicación',
                          value: widget.field.complejo.direccion,
                          icon: Icons.location_on,
                        ),
                        _InfoText(
                          label: 'Teléfono',
                          value: widget.field.complejo.telefono,
                          icon: Icons.phone,
                        ),
                        _InfoText(
                          label: 'Tipo',
                          value: widget.field.tipoCancha,
                          icon: Icons.stadium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ServiceDisplay(
                    height: 80,
                    title: "Servicios",
                    services: ["PLACEHOLDER", "PLACEHOLDER"],
                  ),
                  const SizedBox(height: 16),
                  DatePicker(
                    title: "Seleccionar Fecha",
                    enabledDays: 30,
                    onDateChanged: (date) =>
                        (setState(() => _selectedDate = date)),
                  ),
                  const SizedBox(height: 16),
                  TimePicker(
                    enabled: _selectedDate != null,
                    height: 110,
                    title: "Seleccionar Horario",
                    selectedHour: _selectedHour,
                    onHourSelected: (h) => setState(() => _selectedHour = h),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Total: ARS 25000",
                    style: contextText.headlineSmall?.copyWith(
                      color: _selectedHour != null
                          ? contextColors.primary
                          : contextColors.onSurface.withValues(alpha: 0.38),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (_selectedHour == null)
                          ? null
                          : () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("¡Reserva Exitosa!"),
                                    content: Text(
                                      "Código: ${_reservationCode(widget.field.complejo.nombreComplejo)}",
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("Entendido"),
                                      ),
                                    ],
                                  );
                                },
                              ).then((_) {
                                if (context.mounted) Navigator.pop(context);
                              });
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: contextColors.primary,
                        foregroundColor: contextColors.onPrimary,
                      ),
                      child: Text(_confirmationButtonText),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoText extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _InfoText({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 8),
        Expanded(
          child: Text("$label: $value", style: TextTheme.of(context).bodyLarge),
        ),
      ],
    );
  }
}

class _ConfirmationHeader extends StatelessWidget {
  final String image;
  final String title;

  const _ConfirmationHeader({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      //Header
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/fields/$image"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.5),
            BlendMode.darken,
          ),
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 38, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
