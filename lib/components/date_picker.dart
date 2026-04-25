import 'package:flutter/material.dart';
import 'package:reserva_cancha/core/box_decorations.dart';

class DatePicker extends StatelessWidget {
  final String title;
  final int enabledDays;
  final void Function(DateTime) onDateChanged;

  const DatePicker({
    super.key,
    required this.title,
    required this.enabledDays,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecorations.regularContainer(context),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextTheme.of(
              context,
            ).titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: enabledDays)),
            onDateChanged: onDateChanged,
          ),
        ],
      ),
    );
  }
}
