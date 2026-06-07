import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reserva_cancha/coreAdmin/dialogAgregar.dart';
import 'package:reserva_cancha/coreAdmin/dialog_Reserva_Detalle.dart';
import 'package:reserva_cancha/model/cancha.dart';
import 'package:reserva_cancha/providers/reservas_provider.dart';
import 'package:reserva_cancha/providers/usuarios_provider.dart';
import 'package:reserva_cancha/services/auth_service.dart';

class ReservasScreen extends StatefulWidget {

  //final Cancha cancha;

  const ReservasScreen({super.key, /*required this.cancha*/});

  @override
  State<ReservasScreen> createState() => _ReservasScreenState();
}

class _ReservasScreenState extends State<ReservasScreen> {

  @override
  void initState(){
    super.initState();

    //int IdCancha = int.parse(widget.cancha.idCancha as String);

    int IdCancha = 1;
    Future.microtask(() {
      
      context.read<ReservasProvider>().loadReservasOfCancha(IdCancha);
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<ReservasProvider>();

     return Scaffold(

      appBar: AppBar(
        title: const Text("Reservas"),
      ),

      

      body: 
      /*Center(
        child: Text(
          provider.error ?? "sin error",
        ),*/
      //Text(provider.reservas.length.toString()),
      provider.isLoading
      ? const Center(
        child:CircularProgressIndicator(),
      )

      :ListView.builder(

        itemCount: provider.reservas.length,
        itemBuilder: (context, index) {
          final reserva = provider.reservas[index];
          return Card(
            child : ListTile(
              leading: const Icon (Icons.calendar_month),
              title: Text("Reserva de: ${reserva.usuario.nombreUsuario}"),
              subtitle: Text(
                "ID: ${reserva.idReserva}\n"
                "Fecha Alta: ${DateFormat('dd/MM/yyyy ').format(reserva.fechaAltaReserva)}\n"
                "Hora: ${reserva.turno.configuracionPrecios.horaInicio}"
              ),

              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Precio: \$${reserva.precioReserva}',
                  style:TextStyle(fontSize: 14)),
                  Text(reserva.estadoReserva == 1
                  ? "Activa"
                  : "Inactiva",
                  
                  style: TextStyle(
                    fontSize: 14,
                    color: reserva.estadoReserva == 1
                    ? Colors.green
                    : Colors.red,
                  ),
                  )
                ],
              ),

              onLongPress: (){
                mostrarDialogReservaDetalle(context,reserva);//Cancelar
              }
            ),
          );
        }
      )
    );
  }
     
  }