import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reserva_cancha/coreAdmin/dialogAgregar.dart';
import 'package:reserva_cancha/model/cancha.dart';
import 'package:reserva_cancha/providers/canchas_provider.dart';

class canchasScreen extends StatefulWidget {
  const canchasScreen({super.key});

  @override
  State<canchasScreen> createState() => canchasScreenState();
}

class canchasScreenState extends State<canchasScreen> {

  @override
  void initState(){ //Iniciar datos una vez inciada la pagina

    super.initState();

    Future.microtask((){ //Espera que cargue el dart
      context.read<CanchasProvider>().loadAllCanchas();
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<CanchasProvider>();

    return Scaffold(

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
  }
 }