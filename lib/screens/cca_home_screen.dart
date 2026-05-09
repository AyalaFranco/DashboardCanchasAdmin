import 'package:flutter/material.dart';
import 'package:reserva_cancha/screens/cca_canchas_screen.dart';
import 'package:reserva_cancha/screens/cca_match_screen.dart';
import 'package:reserva_cancha/screens/cca_profile_screen.dart';
import 'package:reserva_cancha/screens/cca_tourney_screen.dart';

class CCAHomeScreen extends StatefulWidget {
  const CCAHomeScreen({super.key});

  @override
  State<CCAHomeScreen> createState() => _CCAHomeScreenState();
}

class _CCAHomeScreenState extends State<CCAHomeScreen> {
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorScheme.of(context).surface,
      appBar: AppBar(
        title: Center(child: Text("Canchas Comarca Andina")),
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
      body: IndexedStack(
        index: currIndex,
        children: [
          CCACanchasScreen(),
          CCAMatchScreen(),
          CCATourneyScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currIndex,
        onDestinationSelected: (index) => setState(() => currIndex = index),
        destinations: [
          NavigationDestination(icon: Icon(Icons.stadium), label: "Canchas"),
          NavigationDestination(
            icon: Icon(Icons.sports_soccer),
            label: "Sumo Uno",
          ),
          NavigationDestination(
            icon: Icon(Icons.emoji_events),
            label: "Torneos",
          ),
        ],
      ),
    );
  }
}