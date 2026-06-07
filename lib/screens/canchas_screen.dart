import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reserva_cancha/components/buscador.dart';
import 'package:reserva_cancha/coreAdmin/dialogAgregar.dart';
import 'package:reserva_cancha/model/cancha.dart';
import 'package:reserva_cancha/providers/canchas_provider.dart';
import 'package:reserva_cancha/services/auth_service.dart';
import 'package:reserva_cancha/widgetAdmin/selector_cancha.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class canchasScreen extends StatefulWidget {
  const canchasScreen({super.key});

  @override
  State<canchasScreen> createState() => canchasScreenState();
}

class canchasScreenState extends State<canchasScreen> {

  @override
  void initState(){ //Iniciar datos una vez inciada la pagina

    super.initState();
    final idUsuario = AuthService().currentUserUuid.toString();
    Future.microtask((){ //Espera que cargue el dart
      context.read<CanchasProvider>().loadCanchasOfDuenio(idUsuario);
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<CanchasProvider>();

    return Scaffold(
      body: 
        Container(
          //color: Colors.white,
          child: Column(
            children: [
              //Buscador(onChanged: (query) => provider.filtrar(query)),
              Expanded(child: _buildBody(provider)),
            ],
          ),
        ),
      
    );


/*  return Scaffold(

      appBar: AppBar(
        title: const Text("Canchas"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          mostrarDialogAgregar(context);//pushPOP
        },
        child: const Icon (Icons.add),
        ),

        body: provider.isBusy
        ? const Center(
          child: CircularProgressIndicator(),
        )

        : ListView.builder(
          itemCount: provider.canchasList.length,
          itemBuilder: (context, index){
            final cancha = provider.canchasList[index];
            return ListTile(
              title: Text('\$${cancha.numeroCancha}'),
              subtitle: Text(cancha.tipoCancha),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: (){
                      title:"nashe";
                    },
                    )
                ],
              )
            );
          }
          )

    );
  
*/
}
  Widget _buildBody(CanchasProvider provider) {
    if (provider.isBusy) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.canchasList.isEmpty) {
      return const Center(child: Text("No se encontraron canchas"));
    }

    return ListView.builder(
      itemCount: provider.canchasList.length,
      itemBuilder: (BuildContext context, int index) =>
          selectorCancha(field: provider.canchasList[index]),
    );
  }
  
 }