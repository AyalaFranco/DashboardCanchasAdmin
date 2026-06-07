import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icono;
  final VoidCallback onTap;

  const DashboardCard({
    super.key,
    required this.titulo,
    required this.valor,
    required this.icono,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icono, size: 40),
              const SizedBox(height: 10),

              Text(
                valor,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(titulo),
            ],
          ),
        ),
      ),
    );
  }
}
