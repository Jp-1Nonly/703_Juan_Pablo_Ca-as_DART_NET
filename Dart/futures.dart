void main() async {
  int suma = await getSuma();
  double promedio = await getPromedio();
  
  print("La suma es: $suma");
  print("El promedio es: $promedio");
}

Future<int> getSuma() async {
  int suma = 0;
  for (int i = 0; i < 100000000; i++) {
    suma += i;
  }
  return suma;
}

Future<double> getPromedio() async {
  double promedio = 0;
  int i = 0;
  for (int i = 0; i < 100000000; i++) {
    promedio += i;
  }
  i++;
  promedio = promedio / i;
  return promedio;
}
