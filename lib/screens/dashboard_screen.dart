import 'package:flutter/material.dart';
import 'package:reserva_cancha/coreAdmin/dialogAgregar.dart';
import 'package:reserva_cancha/coreAdmin/dialog_premium.dart';
import 'package:reserva_cancha/screens/canchas_screen.dart';
import 'package:reserva_cancha/screens/reservas_screen.dart';
import 'package:reserva_cancha/screens/cca_profile_screen.dart';
import 'package:reserva_cancha/screens/login_screen.dart';
import 'package:reserva_cancha/widgetAdmin/dashboard_card.dart';

class dashboard extends StatelessWidget {
  const dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    bool premium = false;
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

         ListTile(
          leading: const Icon(Icons.people),
          title: const Text("Clientes"),
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
        crossAxisCount:
        MediaQuery.of(context).size.width > 900 //Si es mas de 900px anchar a 4 culumns
        ? 4
        : 2,
        
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

            InkWell(
              onTap: () {
                if(!premium){
                  mostrarDialogPremium(context);
                  return;
                }

                Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (_) => const ReservasScreen(),
                  ),
                );
             },

              child: Opacity(
                opacity: premium ? 1 : 0.5,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        premium ? Icons.bar_chart : Icons.lock,
                        color : const Color.fromARGB(255, 0, 0, 0),
                        size: 50
                      ),
                      SizedBox(height: 10),
                      Text(premium ? "Estadisticas" : "Premium"),
                    ],
                  ),
                )
                ),
            )
        ],
      )
      );
  }
}