import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/product.dart';

class Vision extends StatefulWidget {
  const Vision({Key? key}) : super(key: key);

  @override
  State<Vision> createState() => _VisionState();
}

class _VisionState extends State<Vision> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts();
  }

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(
      Uri.parse('http://localhost:8080/proxy/http://jp1nonly-001-site1.etempurl.com/sena/classroom'),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Product.fromJson(data)).toList().cast<Product>();
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Center(
        child: FutureBuilder<List<Product>>(
          future: futureProducts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              return DataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Measure')),
                  DataColumn(label: Text('Stock')),
                ],
                rows: snapshot.data!.map((product) {
                  return DataRow(cells: [
                    DataCell(Text(product.id.toString())),
                    DataCell(Text(product.name)),
                    DataCell(Text(product.measure)),
                    DataCell(Text(product.stock.toString())),
                  ]);
                }).toList(),
              );
            } else {
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }
}
