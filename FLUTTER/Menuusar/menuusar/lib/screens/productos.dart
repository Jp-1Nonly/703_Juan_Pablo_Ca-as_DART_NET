import 'package:flutter/material.dart';

class Productos extends StatefulWidget {
  const Productos({super.key});

  @override
  State<Productos> createState() => _ProductosState();
}

class _ProductosState extends State<Productos> {
  final List<Map<String, String>> productos = [
    {
      "nombre": "Producto 1",
      "precio": "20.00",
      "descripcion": "Descripción del producto 1",
      "imagen": "https://via.placeholder.com/150"
    },
    {
      "nombre": "Producto 2",
      "precio": "30.00",
      "descripcion": "Descripción del producto 2",
      "imagen": "https://via.placeholder.com/150"
    },
    {
      "nombre": "Producto 3",
      "precio": "40.00",
      "descripcion": "Descripción del producto 3",
      "imagen": "https://via.placeholder.com/150"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Productos"),
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final producto = productos[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(producto["imagen"]!),
                  const SizedBox(height: 10),
                  Text(
                    producto["nombre"]!,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Precio: \$${producto["precio"]}",
                    style: const TextStyle(fontSize: 16, color: Colors.green),
                  ),
                  const SizedBox(height: 5),
                  Text(producto["descripcion"]!),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Acción para el botón
                    },
                    child: const Text("Comprar"),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
