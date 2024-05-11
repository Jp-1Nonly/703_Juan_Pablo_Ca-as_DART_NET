import 'package:flutter/material.dart';

void main() {
  //ejecutar la aplicaion
  runApp(const Ejemplo2());
}

class Ejemplo2 extends StatelessWidget {
  const Ejemplo2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Text("Ejemplo 2 🤠", style: TextStyle(color: Colors.black),));
  }
}
