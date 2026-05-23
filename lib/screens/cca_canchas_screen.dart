import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reserva_cancha/components/buscador.dart';
import 'package:reserva_cancha/providers/canchas_provider.dart';
import 'package:reserva_cancha/widgets/selector_cancha.dart';

class CCACanchasScreen extends StatefulWidget {
  const CCACanchasScreen({super.key});

  @override
  State<CCACanchasScreen> createState() => _CCACanchasScreenState();
}

class _CCACanchasScreenState extends State<CCACanchasScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CanchasProvider>().loadAllCanchas();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CanchasProvider>();

    return Column(
      children: [
        Buscador(onChanged: (query) => provider.filtrar(query)),
        Expanded(child: _buildBody(provider)),
      ],
    );
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
