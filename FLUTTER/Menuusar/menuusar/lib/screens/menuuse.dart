import 'package:flutter/material.dart';
import 'package:menuusar/screens/api_service.dart';
import 'package:menuusar/screens/array.dart';
import 'package:menuusar/screens/calculadora.dart';
import 'package:menuusar/screens/conocimientos.dart';
import 'package:menuusar/screens/idiomas.dart';
import 'package:menuusar/screens/infoacademica.dart';
import 'package:menuusar/screens/personainfo.dart';
import 'package:menuusar/screens/productos.dart';
import 'package:menuusar/screens/proyectosuse.dart';

void main() {
  runApp(Menuuse());
}

class Menuuse extends StatelessWidget {
  const Menuuse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Diseñado por JP'),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: SizedBox(
                  height: 15, 
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 16,
                          bottom: 60), 
                      child: Text(
                        'Super menú',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text("Información personal"),
                hoverColor: Colors.yellow,
                trailing: const Icon(Icons.navigate_next_rounded),
                onTap: () {
                  final route = MaterialPageRoute(
                    builder: (context) => PersonalInfoPage(),
                  );
                  Navigator.push(context, route);
                },
              ),
              ListTile(
                leading: const Icon(Icons.school_outlined),
                title: const Text("Información académica"),
                hoverColor: Colors.green,
                trailing: const Icon(Icons.navigate_next_rounded),
                onTap: () {
                  final route = MaterialPageRoute(
                    builder: (context) => InformacionAcademica(),
                  );
                  Navigator.push(context, route);
                },
              ),
              ListTile(
                leading: const Icon(Icons.computer_outlined),
                title: const Text("Conocimientos técnicos"),
                hoverColor: Colors.red,
                trailing: const Icon(Icons.navigate_next_rounded),
                onTap: () {
                  final route = MaterialPageRoute(
                    builder: (context) => Conocimientos(),
                  );
                  Navigator.push(context, route);
                },
              ),
              ListTile(
                leading: const Icon(Icons.language_outlined),
                title: const Text("Idiomas"),
                hoverColor: const Color.fromARGB(255, 54, 238, 244),
                trailing: const Icon(Icons.navigate_next_rounded),
                onTap: () {
                  final route = MaterialPageRoute(
                    builder: (context) => IdiomasUse(),
                  );
                  Navigator.push(context, route);
                },
              ),
              ListTile(
                leading: const Icon(Icons.build_outlined),
                title: const Text("Proyectos"),
                hoverColor: Colors.black,
                trailing: const Icon(Icons.navigate_next_rounded),
                onTap: () {
                  final route = MaterialPageRoute(
                    builder: (context) => Proyectosuse(),
                  );
                  Navigator.push(context, route);
                },
              ),     
            ],
          ),
        ),
        body: const Center(
          child: Text('Prueba 1'),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  // Aquí puedes agregar la funcionalidad para el botón de la casa
                },
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  // Aquí puedes agregar la funcionalidad para el botón del carrito
                },
              ),
              IconButton(
                icon: const Icon(Icons.list),
                onPressed: () {
                  // Aquí puedes agregar la funcionalidad para el botón de la lista
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
