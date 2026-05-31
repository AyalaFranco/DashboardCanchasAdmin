import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const InfoText({
    super.key,
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