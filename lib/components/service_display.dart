import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reserva_cancha/coreAdmin/box_decorations.dart';
import 'package:reserva_cancha/model/complejo.dart';
import 'package:reserva_cancha/providers/servicios_provider.dart';

class ServiceDisplay extends StatefulWidget {
  final String title;
  final Complejo complejo;

  const ServiceDisplay({
    super.key,
    required this.title,
    required this.complejo,
  });

  @override
  State<ServiceDisplay> createState() => _ServiceDisplayState();
}

class _ServiceDisplayState extends State<ServiceDisplay> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ServiciosProvider>().loadServiciosOfComplejo(
        widget.complejo.idComplejo,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ServiciosProvider>();

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecorations.regularContainer(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: TextTheme.of(
              context,
            ).titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
         _buildBody(provider),
        ],
      ),
    );
  }

  Widget _buildBody(ServiciosProvider provider) {
    if (provider.error != null) {
      return Center(child: Text("Error: ${provider.error}"));
    }

    if (provider.isBusy) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.servicios.isEmpty) {
      return const Center(child: Text("No hay servicios adicionales."));
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
        childAspectRatio: 3.0,
      ),
      itemCount: provider.servicios.length,
      itemBuilder: (_, i) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(_mapServiceToIcon(provider.servicios[i].servicio)),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              provider.servicios[i].servicio,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
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
