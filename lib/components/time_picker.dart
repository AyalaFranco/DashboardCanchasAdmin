import 'package:flutter/material.dart';
import 'package:reserva_cancha/core/box_decorations.dart';
import 'package:reserva_cancha/core/text_styles.dart';

class TimePicker extends StatelessWidget {
  final int? selectedHour;
  final double height;
  final String title;
  final void Function(int) onHourSelected;

  const TimePicker({super.key,  required this.onHourSelected, required this.height, required this.title, this.selectedHour});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.all(8),
      decoration: BoxDecorations.containerName,
      child: Column(
        children: [
          Text(title, style: TextStyles.bodyText),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) => ElevatedButton(
                style: (selectedHour == i)
                    ? ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      )
                    : null,
                onPressed: () => onHourSelected(i),
                child: Text("${i.toString().padLeft(2, '0')}hs"),
              ),
              separatorBuilder: (_, _) => SizedBox(width: 8),
              itemCount: 24,
            ),
          ),
        ],
      ),
    );
  }
}
