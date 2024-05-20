// lib/models/product.dart
class Product {
  final int id;
  final String name;
  final String measure;
  final int stock;

  Product({required this.id, required this.name, required this.measure, required this.stock});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['nombre'],
      measure: json['medida'],
      stock: json['stock'],
    );
  }
}
