import 'package:contador_clicks/screens/contadorclicks.dart';
import 'package:flutter/material.dart';

void main(){

  runApp(const App());

}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContadorClicks()
    );
  }
}