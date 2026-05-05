import 'package:flutter/material.dart';
import 'package:reserva_cancha/components/buscador.dart';
import 'package:reserva_cancha/core/app_colors.dart';
import 'package:reserva_cancha/core/apptext_styles.dart';
import 'package:reserva_cancha/model/cancha.dart';
import 'package:reserva_cancha/services/auth_service.dart';
import 'package:reserva_cancha/widgets/selector_cancha.dart';

class CCAHomeScreen extends StatefulWidget {
  const CCAHomeScreen({super.key});

  @override
  State<CCAHomeScreen> createState() => _CCAHomeScreenState();
}

class _CCAHomeScreenState extends State<CCAHomeScreen> {
  
  

  final List<Cancha> todasLasCanchas=Cancha.demoCanchas;
  List<Cancha> canchasFiltradas=[];
  
  @override
  void initState() {
    super.initState();
    canchasFiltradas = Cancha.demoCanchas;
  }

  void _filtrar(String query){
    setState(() {
      canchasFiltradas=todasLasCanchas.where((cancha)=>cancha.nombre.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {

     final auth = AuthService();
     final contextColors= ColorScheme.of(context);
     final contextText= TextTheme.of(context);
    return Scaffold(
      backgroundColor: contextColors.surface,
      appBar: AppBar(
        title: Center(child: Text("Canchas Comarca Andina", style: contextText.bodyLarge?.copyWith(
          fontSize: 25,
          
        ))),
        actions: [
        IconButton(
          onPressed: () => auth.signOut(), //Salir sesion
          icon: const Icon(Icons.logout)),
        ],
      ),
      body: Column(
        children: [
          Buscador(onChanged: _filtrar),

          Expanded(
            child: ListView.builder(
              itemCount: canchasFiltradas.length,
              itemBuilder: (context,index){
                return selectorCancha(field: canchasFiltradas[index]);
              }
              
            )
            ,
            
          ),
        ],
      ),

    );
  }
}
