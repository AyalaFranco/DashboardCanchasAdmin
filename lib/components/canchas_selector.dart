import 'package:flutter/material.dart';
import 'package:reserva_cancha/core/app_colors.dart';
import 'package:reserva_cancha/core/text_styles.dart';

class CanchasSelector extends StatefulWidget {
  const CanchasSelector({super.key});

  @override
  State<CanchasSelector> createState() => _CanchasSelectorState();
}

class _CanchasSelectorState extends State<CanchasSelector> {

  String? selectedCancha; //Seleciona la cancha
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedCancha = "1";
                });
              },
            child: Container(
              decoration: BoxDecoration(
                color: selectedCancha == "1" 
                ? AppColors.Button2
                : AppColors.Button,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset("assets/images/futbol.png" , height: 100),
                    Text("Cancha".toUpperCase(), style: TextStyles.bodyText)
                  ],
                ),
              ),
            ),
          )
          )
        ],
      ),
    ) ;
  }
}