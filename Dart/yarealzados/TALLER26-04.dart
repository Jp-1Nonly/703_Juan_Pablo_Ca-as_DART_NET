import 'dart:io';
import 'dart:math';

class Aprendiz {
  String documento;
  String nombreCompleto;
  int inasistencias;

  Aprendiz(this.documento, this.nombreCompleto, this.inasistencias);
}

class Venta {
  String codigo;
  String nombre;
  double precio;
  int cantidad;

  Venta(this.codigo, this.nombre, this.precio, this.cantidad);

  double calcularValorPagar() {
    if (precio <= 0 || cantidad <= 0) {
      throw Exception("El precio y la cantidad deben ser mayores que 0.");
    }

    double valorBruto = precio * cantidad;

    if (cantidad > 10) {
      valorBruto *= 0.9; // Aplicar descuento del 10%
    }

    double valorIVA = valorBruto * 0.19;
    double valorDescuento = precio * cantidad - valorBruto;

    return valorBruto + valorIVA - valorDescuento;
  }
}

void main() {
  List<Aprendiz> aprendices = [];

  while (true) {
    print("\nMenú:");
    print("1. Registrar inasistencias");
    print("2. Listar todas las inasistencias");
    print("3. Listar los aprendices con inasistencias superiores a 3");
    print("4. Consultar el total de inasistencias por aprendiz");
    print("5. Valor a Pagar");
    print("6. Número de suerte");
    print("7. Salir");

    stdout.write("Seleccione una opción: ");
    String opcion = stdin.readLineSync()!;

    switch (opcion) {
      case '1':
        registrarInasistencias(aprendices);
        break;
      case '2':
        listarTodasInasistencias(aprendices);
        break;
      case '3':
        listarInasistenciasSuperioresA3(aprendices);
        break;
      case '4':
        consultarTotalInasistenciasPorAprendiz(aprendices);
        break;
      case '5':
        valorAPagar(aprendices);
        break;
      case '6':
        numeroDeSuerte();
        break;
      case '7':
        return;
      default:
        print("Opción no válida. Por favor, seleccione una opción válida.");
    }
  }
}

void registrarInasistencias(List<Aprendiz> aprendices) {
  stdout.write("Ingrese el documento del aprendiz: ");
  String documento = stdin.readLineSync()!;
  stdout.write("Ingrese el nombre completo del aprendiz: ");
  String nombreCompleto = stdin.readLineSync()!;
  stdout.write("Ingrese la cantidad de inasistencias: ");
  int inasistencias = int.parse(stdin.readLineSync()!);

  if (inasistencias < 1 || inasistencias > 100) {
    print("La cantidad de inasistencias debe estar entre 1 y 100.");
    return;
  }

  bool encontrado = false;
  for (var aprendiz in aprendices) {
    if (aprendiz.documento == documento) {
      aprendiz.inasistencias = inasistencias;
      encontrado = true;
      break;
    }
  }

  if (!encontrado) {
    aprendices.add(Aprendiz(documento, nombreCompleto, inasistencias));
  }

  print("Inasistencias registradas correctamente.");
}

void listarTodasInasistencias(List<Aprendiz> aprendices) {
  print("Inasistencias de todos los aprendices:");
  for (var aprendiz in aprendices) {
    print("Documento: ${aprendiz.documento}, Nombre: ${aprendiz.nombreCompleto}, Inasistencias: ${aprendiz.inasistencias}");
  }
}

void listarInasistenciasSuperioresA3(List<Aprendiz> aprendices) {
  print("Aprendices con inasistencias superiores a 3:");
  for (var aprendiz in aprendices) {
    if (aprendiz.inasistencias > 3) {
      print("Documento: ${aprendiz.documento}, Nombre: ${aprendiz.nombreCompleto}, Inasistencias: ${aprendiz.inasistencias}");
    }
  }
}

void consultarTotalInasistenciasPorAprendiz(List<Aprendiz> aprendices) {
  stdout.write("Ingrese el documento del aprendiz: ");
  String documento = stdin.readLineSync()!;

  for (var aprendiz in aprendices) {
    if (aprendiz.documento == documento) {
      print("Total de inasistencias para ${aprendiz.nombreCompleto}: ${aprendiz.inasistencias}");
      return;
    }
  }

  print("El aprendiz con el documento $documento no fue encontrado.");
}

void valorAPagar(List<Aprendiz> aprendices) {
  stdout.write("Ingrese el código del producto: ");
  String codigo = stdin.readLineSync()!;
  stdout.write("Ingrese el nombre del producto: ");
  String nombre = stdin.readLineSync()!;
  stdout.write("Ingrese el precio del producto: ");
  double precio = double.parse(stdin.readLineSync()!);
  stdout.write("Ingrese la cantidad del producto: ");
  int cantidad = int.parse(stdin.readLineSync()!);

  try {
    
    int totalInasistencias = aprendices.fold(0, (sum, aprendiz) => sum + aprendiz.inasistencias);
    double descuento = totalInasistencias > 3 ? 0.1 : 0.0;

    Venta venta = Venta(codigo, nombre, precio, cantidad);
    double valorPagar = venta.calcularValorPagar() * (1 - descuento);
    print("El valor a pagar es: \$${valorPagar.toStringAsFixed(2)}");
  } catch (e) {
    print("Error: ${e.toString()}");
  }
}

void numeroDeSuerte() {
  int numero = Random().nextInt(1000);
  print("Número de la suerte: ${numero.toString().padLeft(3, '0')}");
}
