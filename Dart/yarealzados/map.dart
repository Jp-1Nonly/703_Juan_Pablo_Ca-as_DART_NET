void main() {
  
  List<Map<String, dynamic>> supplies = [
    {
      'id': 1,
      'name': "Harina",
      'extent': "Kl",
      'stock': 20,
      'status': "Activo"
    },
    {
      'id': 2,
      'name': "Azúcar",
      'extent': "Kl",
      'stock': 10,
      'status': "Activo"
    },
    {
      'id': 3,
      'name': "Sal",
      'extent': "Kl",
      'stock': 11,
      'status': "Activo"
    },
    {
      'id': 4,
      'name': "Levadura",
      'extent': "Kl",
      'stock': 5,
      'status': "Activo"
    },
    {
      'id': 5,
      'name': "Aceite",
      'extent': "Lt",
      'stock': 1,
      'status': "Activo"
    },
    {
      'id': 6,
      'name': "Maíz",
      'extent': "Kl",
      'stock': 8,
      'status': "Activo"
    },
    {
      'id': 7,
      'name': "Arroz",
      'extent': "Kl",
      'stock': 3,
      'status': "Activo"
    },
    {
      'id': 8,
      'name': "Carne",
      'extent': "Kl",
      'stock': 1,
      'status': "Activo"
    },
    {
      'id': 9,
      'name': "Pollo",
      'extent': "Kl",
      'stock': 12,
      'status': "Activo"
    },
    {
      'id': 10,
      'name': "Queso",
      'extent': "Lb",
      'stock': 1,
      'status': "Activo"
    },
  ];

  print(supplies[0]['name']); 

  for (var supply in supplies) {
    print('${supply['name']} - Stock: ${supply['stock']} - Eatado: ${supply['status']}');
  }

}
