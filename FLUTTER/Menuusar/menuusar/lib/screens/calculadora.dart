import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  double _num1 = 0;
  double _num2 = 0;
  double _resultado = 0;
  String _operacionSeleccionada = 'Sumar';
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  void _calcular() {
    setState(() {
      switch (_operacionSeleccionada) {
        case 'Sumar':
          _resultado = _num1 + _num2;
          break;
        case 'Restar':
          _resultado = _num1 - _num2;
          break;
        case 'Multiplicar':
          _resultado = _num1 * _num2;
          break;
        case 'Dividir':
          if (_num2 != 0) {
            _resultado = _num1 / _num2;
          } else {
            _resultado = double.infinity;
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator 3000'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número 1',
              ),
              onChanged: (value) {
                setState(() {
                  _num1 = double.tryParse(value) ?? 0;
                });
              },
            ),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número 2',
              ),
              onChanged: (value) {
                setState(() {
                  _num2 = double.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: _operacionSeleccionada,
              items: <String>['Sumar', 'Restar', 'Multiplicar', 'Dividir']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _operacionSeleccionada = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcular,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 20),
            Text(
              'Resultado: $_resultado',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
