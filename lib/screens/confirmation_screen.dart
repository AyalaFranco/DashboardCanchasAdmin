import 'package:flutter/material.dart';
import 'package:reserva_cancha/core/app_colors.dart';
import 'package:reserva_cancha/core/box_decorations.dart';
import 'package:reserva_cancha/core/text_styles.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  int? _selectedHour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirmación Reserva"),
        backgroundColor: AppColors.backgraound,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/fleming.jpeg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withValues(alpha: 0.5),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Fleming Futbol Club",
                  style: TextStyle(fontSize: 38, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecorations.containerName,
              width: double.infinity,
              child: Column(
                children: [
                  Text("Elegí una fecha", style: TextStyles.bodyText),
                  CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 30)),
                    onDateChanged: (_) {},
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              width: 200,
              height: 200,
              padding: EdgeInsets.all(8),
              decoration: BoxDecorations.containerName,
              child: Column(
                children: [
                  Text("Elegí un horario", style: TextStyles.bodyText),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, i) => ElevatedButton(
                        onPressed: () => setState(() => _selectedHour = i),
                        child: Text("${i.toString().padLeft(2, '0')}hs"),
                      ),
                      separatorBuilder: (_, _) => SizedBox(width: 8),
                      itemCount: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
