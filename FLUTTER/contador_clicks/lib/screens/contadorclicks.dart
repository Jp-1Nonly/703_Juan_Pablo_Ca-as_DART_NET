import 'package:flutter/material.dart';

class ContadorClicks extends StatefulWidget {
  const ContadorClicks({super.key});

  @override
  State<ContadorClicks> createState() => _ContadorClicksState();
}

int contadorClicks = 0;

class _ContadorClicksState extends State<ContadorClicks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contador de clicks ",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: const Icon(Icons.account_circle, color: Colors.white),
      ),
      body: Text(
        'Numero de clicks: $contadorClicks ',
        style: TextStyle(fontSize: 25),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            child: const Icon(Icons.accessibility_new_outlined),
            onPressed: () {
              setState(() {
                contadorClicks++;
                print(contadorClicks);
              });
            },
          ),
          FloatingActionButton(
            child: const Icon(Icons.remove), // Botón para disminuir el contador
            onPressed: () {
              setState(() {
                contadorClicks--;
                print(contadorClicks);
              });
            },
          ),
        ],
      ),
    );
  }
}
