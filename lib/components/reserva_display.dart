import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reserva_cancha/coreAdmin/box_decorations.dart';
import 'package:reserva_cancha/providers/reservas_provider.dart';
import 'package:reserva_cancha/screens/cca_reserva_detail_screen.dart';

class ReservasDisplay extends StatefulWidget {
  final String? uuidUser;
  final int? idCancha;
  final String title;

  const ReservasDisplay({
    super.key,
    this.uuidUser,
    this.idCancha,
    required this.title,
  });

  @override
  State<ReservasDisplay> createState() => _ReservasDisplayState();
}

class _ReservasDisplayState extends State<ReservasDisplay> {
  bool _onlyActive = false;

  @override
  void initState() {
    super.initState();

    if (widget.uuidUser != null && widget.idCancha != null) {
      throw ("Error: El display de reservas no puede mostrar las reservas de un usuario y una cancha simultáneamente.");
    }

    if (widget.uuidUser != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<ReservasProvider>().loadReservasOfUser(widget.uuidUser!);
      });
    } else if (widget.idCancha != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<ReservasProvider>().loadReservasOfCancha(widget.idCancha!);
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<ReservasProvider>().loadReservas();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ctxColors = ColorScheme.of(context);
    final ctxTexts = TextTheme.of(context);

    final provider = context.watch<ReservasProvider>();

    return Container(
      padding: EdgeInsets.all(8.0),
      height: 250,
      decoration: BoxDecorations.regularContainer(context),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: ctxTexts.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<bool>(
                  value: _onlyActive,
                  dropdownColor: ctxColors.surfaceContainer,
                  borderRadius: BorderRadius.circular(8.0),
                  icon: const Icon(Icons.arrow_drop_down, size: 20),
                  items: const [
                    DropdownMenuItem<bool>(value: false, child: Text('Todas')),
                    DropdownMenuItem<bool>(value: true, child: Text('Activas')),
                  ],
                  onChanged: (value) {
                    if (value != null && value != _onlyActive) {
                      setState(() {
                        _onlyActive = value;
                      });
                    }

                    provider.filterReservas(filterFinished: _onlyActive);
                  },
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          _buildReservasList(provider, context),
        ],
      ),
    );
  }

  Widget _buildReservasList(ReservasProvider provider, BuildContext context) {
    final ctxColors = ColorScheme.of(context);
    final ctxTexts = TextTheme.of(context);

    if (provider.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (provider.error != null) {
      return Center(
        child: Text(
          "Error: ${provider.error}",
          style: ctxTexts.bodyLarge?.copyWith(
            color: ctxColors.error,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    if (provider.reservas.isEmpty) {
      return Center(
        child: Text(
          "¡No tienes reservas!",
          style: ctxTexts.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: provider.reservas.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, i) {
          final reserva = provider.reservas[i];
          final turno = reserva.turno;
          final cancha = turno.cancha;

          return ListTile(
            title: Text(
              "${cancha.complejo.nombreComplejo} - Cancha ${cancha.numeroCancha}",
            ),
            subtitle: Text(
              """${DateFormat('dd/MM/yyyy').format(turno.fechaInicioTurno)}, ${DateFormat('HH:mm').format(turno.fechaInicioTurno)} - ${DateFormat('HH:mm').format(turno.fechaFinTurno)}""",
            ),
            trailing: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CcaReservaDetailScreen(reserva: reserva),
                  ),
                );
              },
              icon: Icon(Icons.more_horiz),
            ),
          );
        },
      ),
    );
  }
}