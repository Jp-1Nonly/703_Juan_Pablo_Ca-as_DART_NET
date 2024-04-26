import 'dart:convert';

void main() {
  final Aprendiz aprendiz1 = new Aprendiz("12334", "Jp", 3.5);
  print(aprendiz1);
  print(aprendiz1.getAprueba());
  aprendiz1.setDocumento = "313";
  print(aprendiz1);
  print(aprendiz1.getDocumento());
}

class Aprendiz {
  String documento;
  String nombres;
  double promedio;

  Aprendiz(String this.documento, String this.nombres, double this.promedio);

  set setDocumento(String documento) {
    this.documento = documento;
  }

  set setNombres(String nombres) {
    this.nombres = nombres;
  }

  set setPromedio(double promedio) {
    this.promedio = promedio;
  }

  String getDocumento() {
    return this.documento;
  }

  String getNombres() {
    return this.nombres;
  }

  double getPromedio() {
    return this.promedio;
  }

  String getAprueba() {
    if (this.promedio > 3.499) {
      return "Aprueba";
    } else {
      return "No Aprueba";
    }
  }

  @override
  String toString() {
    return "${this.documento}, ${this.nombres}";
  }
}
