import 'package:flutter/material.dart';
import 'package:reserva_cancha/admin/canchas_screen.dart';
import 'package:reserva_cancha/admin/reservas_screen.dart';
import 'package:reserva_cancha/screens/cca_profile_screen.dart';
import 'package:reserva_cancha/screens/login_screen.dart';
import 'package:reserva_cancha/admin/widgetAdmin/dashboard_card.dart';

class dashboard extends StatelessWidget {
  const dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panel administrativo"),
        actions: [
          IconButton(
            onPressed: () => (Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CCAProfileScreen()),
            )),
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      drawer: Drawer(//menu desplegable
        child: ListView(
        children: [
          const DrawerHeader(
            child: Text("Admin")
        ),

        ListTile(
          leading: const Icon(Icons.calendar_month),
          title: const Text("Reservas"),
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (_) => const ReservasScreen()
              ),   
            );
          },
        ),

        ListTile(
          leading: const Icon(Icons.sports_soccer),
          title: const Text("Canchas"),
          onTap: (){
            Navigator.push(
              context,
               MaterialPageRoute(
                builder: (_) => const canchasScreen()
             ),
            );
          },
         ),
        ],
      ),
    ),

      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        children: [
          
          DashboardCard(
            titulo: "Reservas hoy", 
            valor: "5", 
            icono: Icons.calendar_month, 
            onTap: () { 
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (_) => const ReservasScreen(),
                  ),
                );
             },
            ),

            DashboardCard(
            titulo: "Canchas", 
            valor: "2", 
            icono: Icons.sports_soccer,
            onTap: () { 
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (_) => const canchasScreen(),
                  ),
                );
             },
            ),

            DashboardCard(
            titulo: "Clientes", 
            valor: "20", 
            icono: Icons.people,
            onTap: () { 
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (_) => const ReservasScreen(),
                  ),
                );
             },
            ),

            DashboardCard(
            titulo: "Ganancias", 
            valor: "100.000", 
            icono: Icons.attach_money,
            onTap: () { 
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (_) => const canchasScreen(),
                  ),
                );
             },
            ),
        ],
      )
      );
  }
}