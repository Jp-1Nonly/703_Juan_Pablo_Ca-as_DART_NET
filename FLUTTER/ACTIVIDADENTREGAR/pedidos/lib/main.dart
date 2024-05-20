import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,  // Deshabilita el banner de debug
      home: PedidosScreen(),
    );
  }
}

class PedidosScreen extends StatefulWidget {
  const PedidosScreen({super.key});

  @override
  _PedidosScreenState createState() => _PedidosScreenState();
}

class _PedidosScreenState extends State<PedidosScreen> {
  final List<String> productos = ['Camisa', 'Pisos', 'Locion Rayo Mcqueen'];
  final List<double> descuentos = [0.0, 0.10, 0.20, 0.30];
  String? productoSeleccionado;
  double? descuentoSeleccionado;
  int cantidad = 1;
  double precio = 0.0;
  double total = 0.0;

  void calcularTotal() {
    setState(() {
      double subtotal = cantidad * precio;
      total = subtotal - (subtotal * (descuentoSeleccionado ?? 0.0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        backgroundColor: Colors.blue, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              hint: const Text('Seleccionar Producto'),
              value: productoSeleccionado,
              onChanged: (String? newValue) {
                setState(() {
                  productoSeleccionado = newValue;
                });
              },
              items: productos.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            DropdownButton<double>(
              hint: const Text('Seleccionar Descuento'),
              value: descuentoSeleccionado,
              onChanged: (double? newValue) {
                setState(() {
                  descuentoSeleccionado = newValue;
                });
              },
              items: descuentos.map<DropdownMenuItem<double>>((double value) {
                return DropdownMenuItem<double>(
                  value: value,
                  child: Text('${(value * 100).toStringAsFixed(0)}%'),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Cantidad',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  cantidad = int.tryParse(value) ?? 1;
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Precio',
                border: OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                setState(() {
                  precio = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularTotal,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 20),
            Text(
              'Total: \$${total.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
