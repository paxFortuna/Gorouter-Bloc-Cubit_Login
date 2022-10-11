class Product {
  final String name;
  final String category;
  final int quantity;

  Product({
    required this.name,
    required this.category,
    required this.quantity,
  });

  static List<Product> products = [
    Product(name: 'Milk', category: 'Food', quantity: 10),
    Product(name: 'Rice', category: 'Food', quantity: 5),
    Product(name: 'Pasta', category: 'Food', quantity: 20),
    Product(name: 'Steak', category: 'Food', quantity: 15),
    Product(name: 'T-Shirt', category: 'Clothes', quantity: 2),
    Product(name: 'Jeans', category: 'Clothes', quantity: 15),
    Product(name: 'Shirt', category: 'Clothes', quantity: 10),
    Product(name: 'Skirt', category: 'Clothes', quantity: 20),
  ];
}
