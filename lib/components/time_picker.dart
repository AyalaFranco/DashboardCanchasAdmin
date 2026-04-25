import 'package:flutter/material.dart';
import 'package:reserva_cancha/core/app_colors.dart';
import 'package:reserva_cancha/core/box_decorations.dart';

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
      decoration: BoxDecorations.regularContainer(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: enabled
                ? TextTheme.of(
                    context,
                  ).titleLarge?.copyWith(fontWeight: FontWeight.bold)
                : TextTheme.of(
                    context,
                  ).titleLarge?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, i) => enabled
                  ? _enabledButtonBuilder(ctx, i)
                  : _disabledButtonBuilder(i),
              separatorBuilder: (_, _) => SizedBox(width: 8),
              itemCount: 24,
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton _enabledButtonBuilder(BuildContext ctx, int index) {
    return ElevatedButton(
      style: (selectedHour == index)
          ? ElevatedButton.styleFrom(
              backgroundColor: ColorScheme.of(ctx).primary,
              foregroundColor: ColorScheme.of(ctx).onPrimary,
            )
          : ElevatedButton.styleFrom(foregroundColor: AppColors.secondary),
      onPressed: () => onHourSelected(index),
      child: Text("${index.toString().padLeft(2, '0')}hs"),
    );
  }

  ElevatedButton _disabledButtonBuilder(int index) {
    return ElevatedButton(
      onPressed: null,
      child: Text("${index.toString().padLeft(2, '0')}hs"),
    );
  }
}
