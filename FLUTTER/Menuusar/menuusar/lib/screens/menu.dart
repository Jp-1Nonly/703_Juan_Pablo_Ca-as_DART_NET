
import 'package:flutter/material.dart';
import 'package:menuusar/screens/array.dart';
import 'package:menuusar/screens/calculadora.dart';
import 'package:menuusar/screens/mision.dart';
import 'package:menuusar/screens/productos.dart';
import 'package:menuusar/screens/rectangulo.dart';
import 'package:menuusar/screens/vision.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu_book),
        title: const Text("Ejemplo menu"),  
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.access_alarm_outlined),
            title: const Text("Mision"),
            trailing: const Icon(Icons.navigate_next_rounded),
            onTap: () {
              final route =
                  MaterialPageRoute(builder: (context) => const Mision());
              Navigator.push(context, route);
            },
          ),
           ListTile(
            leading: const Icon(Icons.access_alarm_outlined),
            title: const Text("Vision"),
            trailing: const Icon(Icons.navigate_next_rounded),
            onTap: () {
              final route =
                  MaterialPageRoute(builder: (context) => const Vision());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            leading: const Icon(Icons.car_rental),
            title: const Text("Productos"),
            subtitle: const Text("Demasiados productos"),
            trailing: const Icon(Icons.navigate_next_rounded),
            onTap: () {
              final route =
                  MaterialPageRoute(builder: (context) => const Productos());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            leading: const Icon(Icons.rectangle_sharp),
            title: const Text("Area y perimetro "),
            subtitle: const Text("Super calculo"),
            trailing: const Icon(Icons.navigate_next_rounded),
            onTap: () {
              final route =
                  MaterialPageRoute(builder: (context) => const Rectangulo());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text("Calculator 300 "),
            subtitle: const Text("Calculadora super rapida"),
            trailing: const Icon(Icons.navigate_next_rounded),
            onTap: () {
              final route =
                  MaterialPageRoute(builder: (context) => const Calculadora());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            leading: const Icon(Icons.list_alt_outlined),
            title: const Text("Listado "),
            subtitle: const Text("Smbientes"),
            trailing: const Icon(Icons.navigate_next_rounded),
            onTap: () {
              final route =
                  MaterialPageRoute(builder: (context) => const EjemploArray());
              Navigator.push(context, route);
            },
          )
        ],
      ),
    );
  }
}
