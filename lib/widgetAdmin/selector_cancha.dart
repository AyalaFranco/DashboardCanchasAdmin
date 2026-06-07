


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reserva_cancha/coreAdmin/box_decorations.dart';
import 'package:reserva_cancha/model/cancha.dart';
import 'package:reserva_cancha/screens/cca_reserva_detail_screen.dart';
import 'package:reserva_cancha/screens/reservas_screen.dart';

class selectorCancha extends StatelessWidget {
  final Cancha field;
  const selectorCancha({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    final contextColors = ColorScheme.of(context);
    final contextText = TextTheme.of(context);
    return Material(
      //Detectar accion de usuario
      color: contextColors.surface,
      child: InkWell(
       onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReservasScreen(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 6), //Ancho y largo
            padding: EdgeInsets.all(14),
            decoration: BoxDecorations.regularContainer(context),
            child: Row(
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: field.complejo.logoCancha ?? "",
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorWidget: (context, error, stackTrace) => Image.asset(
                      "assets/images/defaultLogo.png",
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, //Alinea todos los widgets
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            //Titulo
                            field.complejo.nombreComplejo + " " +field.numeroCancha.toString(),
                            style: contextText.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(field.tipoCancha, style: contextText.bodySmall),
                      Text(
                        field.complejo.direccion,
                        style: contextText.bodySmall,
                      ),
                      const SizedBox(height: 6),

                      Row(
                        //Otro texto
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            //Usar diferentes estilos en textos
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      '25000', //Hardcodeado, el precio estará en los turnos
                                  style: contextText.bodySmall,
                                ),
                                TextSpan(
                                  text: "/hora",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
