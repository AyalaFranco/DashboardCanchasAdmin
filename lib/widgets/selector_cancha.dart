import 'package:flutter/material.dart';
import 'package:reserva_cancha/core/app_colors.dart';

class selectorCancha extends StatelessWidget {
  const selectorCancha({super.key});

  @override
  Widget build(BuildContext context) {
    return Material( //Detectar accion de usuario
      color: Colors.blueAccent,
      child: InkWell( //Animacion al tocar
        onTap: (){},
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 6),//Ancho y largo 
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration( //Personalizar widget y caja
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, //Alinea todos los widgets                  
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text( //Titulo
                          "Cancha",
                          style: TextStyle(
                            fontSize:15,
                            fontWeight: FontWeight.bold,
                            color: Colors.green
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Cancha sintetica",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                        SizedBox(height: 6),
                        Row( //Otro texto
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText( //Usar diferentes estilos en textos
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                text: "Disponible",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                              TextSpan(
                                text: "hora",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey
                                )
                              )
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
        )
      )
    );
  }
}