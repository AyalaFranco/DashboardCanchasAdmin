import 'package:flutter/material.dart';

class canchasScreen extends StatefulWidget {
  const canchasScreen({super.key});

  @override
  State<canchasScreen> createState() => _canchasScreenState();
}

class _canchasScreenState extends State<canchasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Canchas"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          title: const Text("na");
        },
        child: const Icon (Icons.add),
        ),

    );
  }
}