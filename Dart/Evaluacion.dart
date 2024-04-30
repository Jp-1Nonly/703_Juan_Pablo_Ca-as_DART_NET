import 'dart:io';

class Cuenta {
  String numeroCuenta;
  double saldo;

  Cuenta(this.numeroCuenta, this.saldo);
}

void main() {
  List<Cuenta> cuentas = [];

  while (true) {
    print("\n---------- Menú ----------\n");
    print("1 - Registrar Cuenta");
    print("2 - Consignar dinero");
    print("3 - Transferir dinero");
    print("4 - Retirar dinero");
    print("5 - Salir");

    stdout.write("\nSeleccione una opción: ");
    int opcion = int.parse(stdin.readLineSync()!);

    if (opcion == 1) {
      stdout.write("\nIngrese el número de cuenta: ");
      String numeroCuenta = stdin.readLineSync()!;
      if (cuentas.any((cuenta) => cuenta.numeroCuenta == numeroCuenta)) {
        print("\nLa cuenta ya está registrada.");
      } else {
        Cuenta nuevaCuenta = Cuenta(numeroCuenta, 0);
        cuentas.add(nuevaCuenta);
        print("\nCuenta registrada exitosamente");
      }
    } else if (opcion == 2) {
      stdout.write("\nIngrese el número de cuenta para consignar dinero: ");
      String numeroCuenta = stdin.readLineSync()!;
      var cuenta = cuentas.firstWhere(
          (cuenta) => cuenta.numeroCuenta == numeroCuenta,
          orElse: () => Cuenta("", 0));
      if (cuenta.numeroCuenta.isEmpty) {
        print("\nLa cuenta no existe");
      } else {
        stdout.write("\nIngrese la cantidad a consignar: ");
        double cantidad = double.parse(stdin.readLineSync()!);
        cuenta.saldo += cantidad;
        print("\nConsignación realizada exitosamente.");
        print("Nuevo saldo en la cuenta $numeroCuenta: ${cuenta.saldo}");
      }
    } else if (opcion == 3) {
      stdout.write("\nIngrese el numero de cuenta de origen: ");
      String numeroCuentaOrigen = stdin.readLineSync()!;
      var cuentaOrigen = cuentas.firstWhere(
          (cuenta) => cuenta.numeroCuenta == numeroCuentaOrigen,
          orElse: () => Cuenta("", 0));
      if (cuentaOrigen.numeroCuenta.isEmpty) {
        print("\nLa cuenta de origen no existe");
      } else {
        stdout.write("\nIngrese el numero de cuenta de destino: ");
        String numeroCuentaDestino = stdin.readLineSync()!;
        var cuentaDestino = cuentas.firstWhere(
            (cuenta) => cuenta.numeroCuenta == numeroCuentaDestino,
            orElse: () => Cuenta("", 0));
        if (cuentaDestino.numeroCuenta.isEmpty) {
          print("\nLa cuenta de destino no existe");
        } else {
          stdout.write("\nIngrese la cantidad a transferir: ");
          double cantidadTransferir = double.parse(stdin.readLineSync()!);
          if (cantidadTransferir > 0 &&
              cantidadTransferir <= cuentaOrigen.saldo) {
            cuentaOrigen.saldo -= cantidadTransferir;
            cuentaDestino.saldo += cantidadTransferir;
            print("\nTransferencia realizada exitosamente");
            print("Nuevo saldo en la cuenta $numeroCuentaOrigen: ${cuentaOrigen.saldo}");
            print("Nuevo saldo en la cuenta $numeroCuentaDestino: ${cuentaDestino.saldo}");
          } else {
            print("\nLa cantidad a transferir es invalida");
          }
        }
      }
    } else if (opcion == 4) {
      stdout.write("\nIngrese el numero de cuenta para retirar dinero: ");
      String numeroCuenta = stdin.readLineSync()!;
      var cuenta = cuentas.firstWhere(
          (cuenta) => cuenta.numeroCuenta == numeroCuenta,
          orElse: () => Cuenta("", 0));
      if (cuenta.numeroCuenta.isEmpty) {
        print("\nLa cuenta no existe.");
      } else {
        stdout.write("\nIngrese la cantidad a retirar: ");
        double cantidad = double.parse(stdin.readLineSync()!);
        if (cantidad > 0 && cantidad <= cuenta.saldo) {
          cuenta.saldo -= cantidad;
          print("\nRetiro realizado exitosamente");
          print("Nuevo saldo en la cuenta $numeroCuenta: ${cuenta.saldo}");
        } else {
          print("\nLa cantidad a retirar es inválida");
        }
      }
    } else if (opcion == 5) {
      print("\nFin del programa");
      break;
    } else {
      print("\nopcion no valida");
    }
  }
}
