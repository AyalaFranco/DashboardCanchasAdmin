import 'package:flutter/material.dart';
import 'package:reserva_cancha/core/app_colors.dart';
import 'package:reserva_cancha/core/text_styles.dart';
import 'package:reserva_cancha/model/cancha.dart';
import 'package:reserva_cancha/screens/confirmation_screen.dart';
import 'package:reserva_cancha/core/app_colors.dart';
class selectorCancha extends StatelessWidget {
  final Cancha cancha;
  const selectorCancha({super.key, required this.cancha});

  @override
  Widget build(BuildContext context) {
    return Material( //Detectar accion de usuario
      color: AppColors.background,
      child: InkWell( //Animacion al tocar
        onTap: (){
        Navigator.push(context,
        MaterialPageRoute(builder: (context) =>ConfirmationScreen(field: cancha)));
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 6),//Ancho y largo 
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration( //Personalizar widget y caja
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                ClipOval(child: Image.asset("assets/images/icons/${cancha.logoCancha}", width: 80, height: 80,)),
                const SizedBox(width:14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, //Alinea todos los widgets                  
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text( //Titulo
                            cancha.nombre,
                            style: TextStyles.bodyText,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        cancha.tipoCancha,
                        style: TextStyles.secondaryText
                      ),
                      Text(cancha.ubicacion, style: TextStyle(fontSize: 12,
                          color: const Color.fromARGB(255, 133, 133, 133),
                          fontStyle: FontStyle.italic,)),
                         const SizedBox(height: 6),
                         
                          Row( //Otro texto
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText( //Usar diferentes estilos en textos
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                  text: cancha.precio.toString(),
                                  style: TextStyles.terciaryText,
                                ),
                                TextSpan(
                                  text: "/hora",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey
                                  )
                                ),
                               
                                ]
                                ),
                              )
                            ],
                          )
                        
                      
                    ],
                  )
                )
              ],
            ),
          ),
        )
      )
      
    );
  }
  
}
