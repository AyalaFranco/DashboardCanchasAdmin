import 'package:flutter/material.dart';
import 'package:reserva_cancha/components/buscador.dart';
import 'package:reserva_cancha/model/cancha.dart';
import 'package:reserva_cancha/widgets/selector_cancha.dart';

class CCACanchasScreen extends StatefulWidget {
  const CCACanchasScreen({super.key});

  @override
  State<CCACanchasScreen> createState() => _CCACanchasScreenState();
}

class _CCACanchasScreenState extends State<CCACanchasScreen> {
  final List<Cancha> todasLasCanchas = Cancha.demoCanchas;
  List<Cancha> canchasFiltradas = [];

  @override
  void initState() {
    super.initState();
    canchasFiltradas = Cancha.demoCanchas;
  }

  void _filtrar(String query) {
    setState(() {
      canchasFiltradas = todasLasCanchas
          .where(
            (cancha) =>
                cancha.nombre.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Buscador(onChanged: _filtrar),
        Expanded(
          child: ListView.builder(
            itemCount: canchasFiltradas.length,
            itemBuilder: (context, index) {
              return selectorCancha(field: canchasFiltradas[index]);
            },
          ),
        ),
      ],
    );
  }
}
