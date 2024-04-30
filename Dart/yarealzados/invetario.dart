import 'dart:io';

class Producto {
  late String nombre;
  late int stock;
  late double precioCompra;
  late double precioVenta;

  Producto(this.nombre, this.stock, this.precioCompra, this.precioVenta);

  void comprar(int cantidad) {
    if (cantidad > 0) {
      stock += cantidad;
      print('Se han comprado $cantidad unidades de $nombre.');
    } else {
      print('La cantidad de compra debe ser mayor que 0.');
    }
  }

  void vender(int cantidad) {
    if (cantidad > 0) {
      if (stock >= cantidad) {
        stock -= cantidad;
        print('Se han vendido $cantidad unidades de $nombre.');
      } else {
        print('No hay suficientes unidades de $nombre en stock.');
      }
    } else {
      print('La cantidad de venta debe ser mayor que 0.');
    }
  }

  void mostrarStock() {
    print('Stock de $nombre: $stock unidades.');
  }
}

void main() {
  print('Ingrese el nombre del producto:');
  String nombre = stdin.readLineSync()!;

  print('Ingrese el stock inicial del producto:');
  int stockInicial = int.parse(stdin.readLineSync()!);

  print('Ingrese el precio de compra del producto:');
  double precioCompra = double.parse(stdin.readLineSync()!);

  print('Ingrese el precio de venta del producto:');
  double precioVenta = double.parse(stdin.readLineSync()!);

  Producto miProducto = Producto(nombre, stockInicial, precioCompra, precioVenta);
  int opcion = 0;
  
  do {
    print('\nMenu:');
    print('1. Comprar producto');
    print('2. Vender producto');
    print('3. Mostrar stock');
    print('4. Salir');
    print('Ingrese su opción:');
    opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        print('Ingrese la cantidad de unidades a comprar:');
        int cantidadCompra = int.parse(stdin.readLineSync()!);
        miProducto.comprar(cantidadCompra);
        break;
      case 2:
        print('Ingrese la cantidad de unidades a vender:');
        int cantidadVenta = int.parse(stdin.readLineSync()!);
        miProducto.vender(cantidadVenta);
        break;
      case 3:
        miProducto.mostrarStock();
        break;
      case 4:
        print('Saliendo del programa...');
        break;
      default:
        print('Opción inválida. Por favor, ingrese un número del 1 al 4.');
    }
  } while (opcion != 4);
}
