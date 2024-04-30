void main() {
  Vehiculo vehiculo1 = Vehiculo("JPC 313", "NEGRO", 2025);
  print(vehiculo1);

  Carro carro1 = Carro("awe324", "negro", 2024, 4);
  print(carro1);
}

class Vehiculo {
  String? placa;
  String? color;
  int? modelo;

  Vehiculo(this.placa, this.color, this.modelo);

  setPlaca(String placa) {
    this.placa = placa;
  }

  String? getPlaca() {
    return placa;
  }

  setColor(String color) {
    this.color = color;
  }

  String? getColor() {
    return color;
  }

  setModelo(int modelo) {
    this.modelo = modelo;
  }

  int? getModelo() {
    return modelo;
  }
}

class Carro extends Vehiculo {
  int _numeroPuertas;

  Carro(String placa, String color, int modelo, this._numeroPuertas)
      : super(placa, color, modelo);

  set numeroPuertas(int numeroPuertas) {
    if (numeroPuertas < 0 || numeroPuertas > 6) {
      print("Número de puertas incorrecto");
    } else {
      _numeroPuertas = numeroPuertas;
    }
  }

  @override
  String toString() {
    return "\nLos datos del vehículo son:\n \nPlaca: ${this.placa} \nModelo: ${this.modelo} \nColor: ${this.color} \nNumero de puertas: ${this._numeroPuertas}\n";
  }
}

