
import 'package:flutter/material.dart';

void mostrarDialogPremium(BuildContext context) {
  showDialog(
  context: context,
  builder: (context) {
    return AlertDialog(
      title: const Text("Contenido premium"),

      content: const Text("Para desbloquear esta funcion debes pagar el usuario premium"),

      actions: [
        TextButton(
          onPressed:() {
          Navigator.pop(context);         
        }, 
        child: const Text("Cancelar"),
        ),

        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          child: const Text("Desbloquear")
          )
      ],
    );
  }
  );
}