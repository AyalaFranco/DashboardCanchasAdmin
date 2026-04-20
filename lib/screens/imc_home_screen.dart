import 'package:flutter/material.dart';
import 'package:reserva_cancha/components/buscador.dart';
import 'package:reserva_cancha/widgets/selector_cancha.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ImcHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
            title : Text("Reserva de Cancha")
          ),
      body: Column(
        children: [
          Buscador(),
          selectorCancha()
        ],
      ),
    );
  }
}