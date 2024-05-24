import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(UseApi());
}

class UseApi extends StatefulWidget {
  @override
  _UseApiState createState() => _UseApiState();
}

class _UseApiState extends State<UseApi> {
  String _classroomData = '';

  // Función para obtener los datos de la API
  void _fetchClassroomData() async {
    const String apiUrl = 'http://jp1nonly-001-site1.etempurl.com/sena/classroom';
    const String username = '11177848';
    const String password = '60-dayfreetrial';

    // Realizar la solicitud HTTP con autenticación básica
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Basic ' + base64Encode(utf8.encode('$username:$password')),
      },
    );

    // Verificar si la solicitud fue exitosa (código de estado 200)
    if (response.statusCode == 200) {
      // Decodificar la respuesta JSON y actualizar el estado
      setState(() {
        _classroomData = jsonDecode(response.body);
      });
    } else {
      // Si la solicitud falla, imprimir el código de estado
      print('Failed to load classroom data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Classroom Data'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _fetchClassroomData,
                child: Text('Obtener Datos del Aula'),
              ),
              SizedBox(height: 20),
              Text(
                _classroomData,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
