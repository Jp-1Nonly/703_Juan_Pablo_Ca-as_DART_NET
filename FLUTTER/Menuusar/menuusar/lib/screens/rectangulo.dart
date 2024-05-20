import 'package:flutter/material.dart';

class Rectangulo extends StatefulWidget {
  const Rectangulo({super.key});

  @override
  State<Rectangulo> createState() => _RectanguloState();
}

class _RectanguloState extends State<Rectangulo> {
  TextEditingController largoController = TextEditingController();
  TextEditingController anchoController = TextEditingController();
  String resultado = '';

  void calcular() {
    double largo = double.tryParse(largoController.text) ?? 0;
    double ancho = double.tryParse(anchoController.text) ?? 0;
    double area = largo * ancho;
    double perimetro = 2 * (largo + ancho);
    setState(() {
      resultado = 'Área: $area\nPerímetro: $perimetro';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rectangulo"),
        leading: const Icon(Icons.rectangle_outlined),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 400,
          child: Column(
            children: [
              TextField(
                controller: largoController,
                decoration: const InputDecoration(
                  labelText: 'Largo',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: anchoController,
                decoration: const InputDecoration(
                  labelText: 'Ancho',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                ),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                onPressed: calcular,
                child: Text('Calcular'),
              ),
              SizedBox(height: 20),
              Text(
                resultado,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Rectangulo(),
  ));
}