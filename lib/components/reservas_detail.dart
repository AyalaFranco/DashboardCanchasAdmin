import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reserva_cancha/components/info_text.dart';
import 'package:reserva_cancha/coreAdmin/box_decorations.dart';
import 'package:reserva_cancha/data/supabase_url_repository.dart';
import 'package:reserva_cancha/model/reserva.dart';
import 'package:reserva_cancha/model/url_repository.dart';
import 'package:reserva_cancha/providers/url_provider.dart';

class ReservaDetail extends StatelessWidget {
  final Reserva reserva;

  const ReservaDetail({super.key, required this.reserva});

  @override
  Widget build(BuildContext context) {
    final ctxColors = ColorScheme.of(context);
    final ctxTexts = TextTheme.of(context);
    final turno = reserva.turno;
    final cancha = turno.cancha;
    final provider = context.read<UrlProvider>();

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecorations.regularContainer(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: CachedNetworkImage(
                imageUrl: cancha.complejo.logoCancha != null
                    ? provider.complejoImageUrl(cancha.complejo.logoCancha!)
                    : "",
                width: 125,
                height: 125,
                fit: BoxFit.cover,
                errorWidget: (context, error, stackTrace) => Image.asset(
                  "assets/images/defaultLogo.png",
                  width: 125,
                  height: 125,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Center(
            child: Text(
              "${cancha.complejo.nombreComplejo} - Cancha ${cancha.numeroCancha}",
              style: ctxTexts.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(height: 24.0),
          InfoText(
            label: "Tipo Cancha",
            value: cancha.tipoCancha,
            icon: Icons.stadium,
          ),
          InfoText(
            label: "Suelo Cancha",
            value: cancha.sueloCancha,
            icon: Icons.grass,
          ),
          InfoText(
            label: "Direccion",
            value: cancha.complejo.direccion,
            icon: Icons.location_on,
          ),
          InfoText(
            label: "Teléfono",
            value: cancha.complejo.telefono,
            icon: Icons.phone,
          ),
          const Divider(height: 24.0),
          InfoText(
            label: "Usuario",
            value: reserva.usuario.correoUsuario,
            icon: Icons.account_circle,
          ),
          InfoText(
            label: "Fecha",
            value: DateFormat('dd/MM/yyyy').format(turno.fechaInicioTurno),
            icon: Icons.calendar_month,
          ),
          InfoText(
            label: "Horario",
            value:
                "${DateFormat('HH:mm').format(turno.fechaInicioTurno)} - ${DateFormat('HH:mm').format(turno.fechaFinTurno)}",
            icon: Icons.alarm,
          ),
          InfoText(
            label: "Duración",
            value:
                """${turno.fechaFinTurno.difference(turno.fechaInicioTurno).inMinutes.toString()} minutos""",
            icon: Icons.access_time_filled,
          ),
          const Divider(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: ",
                style: ctxTexts.headlineMedium?.copyWith(
                  color: ctxColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "ARS ${reserva.precioReserva}",
                style: ctxTexts.headlineMedium?.copyWith(
                  color: ctxColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}