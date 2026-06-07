import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reserva_cancha/model/reserva.dart';
import 'package:reserva_cancha/providers/canchas_provider.dart';

void mostrarDialogReservaDetalle(BuildContext context, Reserva reserva){
    showDialog(
      context: context, 
      builder: (context){
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(25)
          ),
          elevation: 20,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text("Detalle Reserva",
                style: TextStyle(

                      fontSize: 24,

                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                  decoration: BoxDecoration(
                    color : reserva.estadoReserva == 1
                    ? Colors.green
                    : Colors.red,
                    borderRadius:
                          BorderRadius.circular(20),
                  ),
                  child: Text(
                    reserva.estadoReserva == 1
                    ? "Activa"
                    : "Finalizada",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Row(

                children: [

                  const Icon(
                    Icons.person,
                    size: 28,
                  ),

                  const SizedBox(width: 10),

                  Expanded(

                    child: Text(

                      reserva.usuario.nombreUsuario,

                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              Row(

                children: [

                  const Icon(
                    Icons.calendar_month,
                    size: 28,
                  ),

                  const SizedBox(width: 10),

                  Expanded(

                    child: Text(

                      DateFormat('dd/MM/yyyy ').format(reserva.fechaAltaReserva),

                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              Row(

                children: [

                  const Icon(
                    Icons.timer,
                    size: 28,
                  ),

                  const SizedBox(width: 10),

                  Expanded(

                    child: Text(

                      reserva.turno.configuracionPrecios.horaInicio.toString(),

                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),              
              
              const SizedBox(height: 18),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text("Total",
                    style: TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      '\$${reserva.precioReserva}',
                       style: const TextStyle(
                        fontSize: 28,
                        fontWeight:
                        FontWeight.bold,
                        color: Color.fromARGB(255, 103, 221, 107),
                    ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment:MainAxisAlignment.end,

                      children: [
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: const Text("Cerrar"),
                          ),

                          const SizedBox(height: 10),

                          ElevatedButton.icon(
                            onPressed: (){
                              //
                            },
                            icon: const Icon(
                            Icons.edit,
                             ),
                            label: const Text("Editar"),
                            )
                      ],
                    )
              ],
            ),
          ),
        );
      }
      );
  }

