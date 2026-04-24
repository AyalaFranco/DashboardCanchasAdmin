import 'package:flutter/material.dart';
import 'package:reserva_cancha/core/app_colors.dart';
import 'package:reserva_cancha/core/box_decorations.dart';
import 'package:reserva_cancha/core/text_styles.dart';

class TimePicker extends StatelessWidget {
  final int? selectedHour;
  final double height;
  final String title;
  final bool enabled;
  final void Function(int) onHourSelected;

  const TimePicker({
    super.key,
    required this.onHourSelected,
    required this.height,
    required this.title,
    this.selectedHour,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.all(8),
      decoration: BoxDecorations.containerName,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: enabled
                ? TextStyles.bodyText
                : TextStyles.bodyText.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 8,),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) => enabled
                  ? _enabledButtonBuilder(i)
                  : _disabledButtonBuilder(i),
              separatorBuilder: (_, _) => SizedBox(width: 8),
              itemCount: 24,
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton _enabledButtonBuilder(int index) {
    return ElevatedButton(
      style: (selectedHour == index)
          ? ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonBackground,
              foregroundColor: AppColors.buttonForeground,
            )
          : ElevatedButton.styleFrom(foregroundColor: AppColors.secondary),
      onPressed: () => onHourSelected(index),
      child: Text("${index.toString().padLeft(2, '0')}hs"),
    );
  }

  ElevatedButton _disabledButtonBuilder(int index) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(foregroundColor: AppColors.buttonForeground),
      onPressed: null,
      child: Text("${index.toString().padLeft(2, '0')}hs"),
    );
  }
}
