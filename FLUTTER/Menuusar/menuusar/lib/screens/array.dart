import 'package:flutter/material.dart';

class EjemploArray extends StatefulWidget {
  const EjemploArray({super.key});

  @override
  State<EjemploArray> createState() => _EjemploArrayState();
}

final List<String> ambientes = <String>['701', '702', '703'];

class _EjemploArrayState extends State<EjemploArray> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.list_alt_outlined),
        title: const Text('Listado de amibientes'),
      ),
      body: ListView.builder(
          itemCount: ambientes.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(ambientes[index]),
            );
          }
          ),
    );
  }
}
