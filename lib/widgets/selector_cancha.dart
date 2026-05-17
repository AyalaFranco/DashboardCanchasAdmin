import 'package:flutter/material.dart';
import 'package:reserva_cancha/core/app_colors.dart';
import 'package:reserva_cancha/core/box_decorations.dart';
import 'package:reserva_cancha/core/apptext_styles.dart';
import 'package:reserva_cancha/model/cancha.dart';
import 'package:reserva_cancha/screens/confirmation_screen.dart';

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
        //Animacion al tocar
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ConfirmationScreen(field: field),
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
                  child: Image.asset(
                    "assets/images/icons/${field.complejo.logoCancha ?? 'null.png'}",
                    width: 80,
                    height: 80,
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
                            field.complejo.nombreComplejo,
                            style: contextText.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(field.tipoCancha, style: contextText.bodySmall),
                      Text(field.complejo.direccion, style: contextText.bodySmall),
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
                                  text: '25000', //Hardcodeado, el precio estará en los turnos
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
