import 'dart:io';

void main() {
  
  // Definición de variables
  int numeroPersonas;
  String nombrePersona;
  String generoPersona;
  List<String> listaM = [];
  List<String> listaF = [];

  // Solicitar el número de personas
  print("Ingrese el número de personas: ");
  numeroPersonas = int.parse(stdin.readLineSync()!);

  // Ciclo para solicitar el nombre y género de cada persona
  for (int i = 0; i < numeroPersonas; i++) {
    print("Ingrese el nombre de la persona ${i + 1}: ");
    nombrePersona = stdin.readLineSync()!;

    print("Ingrese el género de la persona ${i + 1} (M/F): ");
    generoPersona = stdin.readLineSync()!.toUpperCase();

    // Almacenar en la lista correspondiente según el género
    if (generoPersona == "M") {
      listaM.add(nombrePersona);
    } else if (generoPersona == "F") {
      listaF.add(nombrePersona);
    } else {
      print("Género no válido. Ingrese M o F.");
    }
  }

  // Mostrar las listas de personas por género
  print("\nLista de personas de género M:");
  for (String nombre in listaM) {
    print(nombre);
  }

  print("\nLista de personas de género F:");
  for (String nombre in listaF) {
    print(nombre);
  }
}
