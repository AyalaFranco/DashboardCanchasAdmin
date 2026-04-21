import 'package:flutter/material.dart';

class Buscador extends StatelessWidget {
  final Function(String) onChanged;
  const Buscador({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: Column(
        children: [
          TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: "Busca tu cancha",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey)
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey)
              )
              
            ),
          ),
        ],
      ),
    );
  }
}
