import 'package:flutter/material.dart';
import 'package:reserva_cancha/components/date_picker.dart';
import 'package:reserva_cancha/components/time_picker.dart';
import 'package:intl/intl.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirmación Reserva"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _ConfirmationHeader(
              image: widget.field.imagenCancha,
              title: widget.field.nombre,
            ),
            Padding(
              //Selector de Día
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  DatePicker(
                    title: "Elegí una fecha",
                    enabledDays: 30,
                    onDateChanged: (date) =>
                        (setState(() => _selectedDate = date)),
                  ),
                  SizedBox(height: 16),
                  TimePicker(
                    enabled: _selectedDate != null,
                    height: 100,
                    title: "Elegí un horario",
                    selectedHour: _selectedHour,
                    onHourSelected: (h) => setState(() => _selectedHour = h),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (_selectedHour != null) ? () => () : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        disabledForegroundColor: Colors.grey.shade600,
                      ),
                      child: Text(
                        _confirmationButtonText,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
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
