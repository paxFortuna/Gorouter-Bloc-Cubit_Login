class Category {
  final String name;

  Category({required this.name});

  static List<Category> categories = [
    Category(name: 'Clothes'),
    Category(name: 'Food'),
  ];
}