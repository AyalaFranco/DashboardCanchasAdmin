import 'package:flutter/material.dart';
import 'package:reserva_cancha/core/box_decorations.dart';
import 'package:reserva_cancha/core/text_styles.dart';

class ServiceDisplay extends StatelessWidget {
  final double height;
  final String title;
  final List<String> services;

  const ServiceDisplay({
    super.key,
    required this.height,
    required this.title,
    required this.services,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: height,
      decoration: BoxDecorations.containerName,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyles.bodyText),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) => Row(
                children: [
                  Icon(_mapServiceToIcon(services[i])),
                  Text(services[i], style: TextStyle(fontSize: 18)),
                ],
              ),
              separatorBuilder: (_, i) => const SizedBox(width: 8),
              itemCount: services.length,
            ),
          ),
        ],
      ),
    );
  }

  IconData _mapServiceToIcon(String service) {
    return switch (service.toLowerCase()) {
      "quincho" => Icons.cabin,
      "bar" => Icons.local_bar,
      "cumpleaños" => Icons.cake,
      "parrilla" => Icons.outdoor_grill,
      "estacionamiento" => Icons.directions_car,
      "torneos" => Icons.emoji_events,
      "wi-fi" => Icons.wifi,
      _ => Icons.room_service,
    };
  }
}
