import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Number Generator',
      home: RandomNumberScreen(),
    );
  }
}

class RandomNumberScreen extends StatefulWidget {
  const RandomNumberScreen({super.key});

  @override
  _RandomNumberScreenState createState() => _RandomNumberScreenState();
}

class _RandomNumberScreenState extends State<RandomNumberScreen> {
  int randomNumber = 0;

  void generateRandomNumber() {
    setState(() {
      randomNumber = Random().nextInt(1000);
    });
  }

  String formatNumber(int number) {
    String formattedNumber = number.toString();
    if (number < 100) {
      formattedNumber = formattedNumber.padLeft(3, '0');
    }
    return formattedNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gnerador de numeros'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Numero generado:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              formatNumber(randomNumber),
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: generateRandomNumber,
              child: const Text('Generar numero aleatorio'),
            ),
          ],
        ),
      ),
    );
  }
}
