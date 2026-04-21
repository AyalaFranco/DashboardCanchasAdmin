import 'package:flutter/material.dart';
import 'package:reserva_cancha/components/buscador.dart';
import 'package:reserva_cancha/core/app_colors.dart';
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
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.black,

        title: Center(child: Text("Canchas Comarca Andina", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
      ),
      body: ListView(
        children: [
          Buscador(),
          selectorCancha(),
          selectorCancha(),
          selectorCancha(),
          selectorCancha(),
          selectorCancha(),
          selectorCancha(),
          selectorCancha(),
        ],
      ),
    );
  }
}
