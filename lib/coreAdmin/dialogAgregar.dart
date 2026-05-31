import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reserva_cancha/model/cancha.dart';
import 'package:reserva_cancha/model/complejo.dart';
import 'package:reserva_cancha/providers/canchas_provider.dart';

final numeroCanchaController = TextEditingController();
final tipoCanchaController =TextEditingController();

void mostrarDialogAgregar(BuildContext context){
    showDialog(
      context: context, 
      builder: (_){
        return AlertDialog(
          title: const Text("Agregar cancha"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller:numeroCanchaController,
                decoration: const InputDecoration(labelText: "numeroCancha"),
              ),

              TextField(
                controller: tipoCanchaController,
                decoration: const InputDecoration(labelText: "tipo cancha"),
                keyboardType: TextInputType.number,
              )
            ],
          ),

          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text("Cancelar"),
              ),

              ElevatedButton(
                onPressed: () async {
                  final provider = context.read<CanchasProvider>();
                  //await provider.insertCanchas();
                  /*numeroCancha : int.parse(numeroCanchaController as String),
                  tipoCancha : tipoCanchaController.text, 
                  idCancha: 100, 
                  sueloCancha: '', 
                  imagenCancha: '', 
                  complejo: null, 
                  )
                  );*/


                  tipoCanchaController.clear();
                  numeroCanchaController.clear();

                  Navigator.pop(context);
                },

                child: const Text("Guardar"),
                )
          ],
        );
      }
      );
}