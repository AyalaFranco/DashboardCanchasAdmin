import 'package:flutter/material.dart';
import 'package:reserva_cancha/core/box_decorations.dart';
import 'package:reserva_cancha/core/text_styles.dart';

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
      decoration: BoxDecorations.containerName,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyles.bodyText),
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
