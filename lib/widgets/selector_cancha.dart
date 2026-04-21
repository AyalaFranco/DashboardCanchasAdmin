import 'package:flutter/material.dart';
import 'package:reserva_cancha/core/app_colors.dart';
import 'package:reserva_cancha/model/cancha.dart';
import 'package:reserva_cancha/screens/confirmation_screen.dart';

class selectorCancha extends StatelessWidget {
  final Cancha cancha;
  const selectorCancha({super.key, required this.cancha});

  @override
  Widget build(BuildContext context) {
    return Material( //Detectar accion de usuario
      color: const Color.fromARGB(255, 255, 255, 255),
      child: InkWell( //Animacion al tocar
        onTap: (){
        Navigator.push(context,
        MaterialPageRoute(builder: (context) =>ConfirmationScreen(field: cancha)));
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 6),//Ancho y largo 
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration( //Personalizar widget y caja
            color: const Color.fromARGB(255, 250, 207, 157),
            borderRadius: BorderRadius.circular(20),
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
                          style: TextStyle(
                            fontSize:16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      cancha.tipoCancha,
                      style: TextStyle(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 133, 133, 133),
                        fontStyle: FontStyle.italic,
                      ),
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
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
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
        )
      )
      
    );
  }
  
}
