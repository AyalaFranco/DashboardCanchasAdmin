import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reserva_cancha/providers/reservas_provider.dart';

class ReservasScreen extends StatefulWidget {
  const ReservasScreen({super.key});

  @override
  State<ReservasScreen> createState() => _ReservasScreenState();
}

class _ReservasScreenState extends State<ReservasScreen> {

  @override
  void initState(){

    super.initState();

    Future.microtask(() {
      
      context.read<ReservasProvider>().loadCanchas();
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
      Text(provider.reservas.length.toString()),
      /*provider.isLoading
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
              title: Text(reserva.idUsuario.toString()),
              subtitle: Text(
                "${reserva.idReserva}"
                "${reserva.fechaAltaReserva}"
                "${reserva.precioReserva}"
              ),

              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('\$${reserva.precioReserva}'),
                  Text('\$${reserva.estadoReserva}'),
                ],
              ),

              onLongPress: (){
                provider.error;
              }
            ),
          );
        }
      )
    );
  }*/
     );
  }
}