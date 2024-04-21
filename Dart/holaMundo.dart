import 'dart:io';

void main() {
  int numero1 = 0;
  int numero2 = 0;

  print('Ingrese dos números separados por espacio: ');
  String input = stdin.readLineSync()!;
  List<String> numeros = input.split(' ');

  if (numeros.length >= 2) {
    numero1 = int.parse(numeros[0]);
    numero2 = int.parse(numeros[1]);

    if (numero1 > numero2) {
      print('El primer número es mayor.');
    } else if (numero2 > numero1) {
      print('El segundo número es mayor.');
    } else {
      print('Ambos números son iguales.');
    }

    if (numero1 > 0 && numero2 > 0) {
      print('Ambos números son positivos.');
    } else if (numero1 < 0 && numero2 < 0) {
      print('Ambos números son negativos.');
    } else {
      print('Uno de los números es positivo y el otro es negativo.');
    }

    // Cálculos adicionales solicitados
    int maximoValor = numero1 > numero2 ? numero1 : numero2;
    int minimoValor = numero1 < numero2 ? numero1 : numero2;
    int cantidadPositivos = (numero1 > 0 ? 1 : 0) + (numero2 > 0 ? 1 : 0);
    int cantidadNegativos = (numero1 < 0 ? 1 : 0) + (numero2 < 0 ? 1 : 0);
    double promedioPositivos = (numero1 + numero2 > 0 ? (numero1 + numero2) / cantidadPositivos : 0);
    double promedioNegativos = (numero1 + numero2 < 0 ? (numero1 + numero2) / cantidadNegativos : 0);

    print('Máximo valor: $maximoValor');
    print('Mínimo valor: $minimoValor');
    print('Cantidad de positivos: $cantidadPositivos');
    print('Cantidad de negativos: $cantidadNegativos');
    print('Promedio de positivos: $promedioPositivos');
    print('Promedio de negativos: $promedioNegativos');
  } else {
    print('Debe ingresar dos números separados por espacio.');
  }
}
