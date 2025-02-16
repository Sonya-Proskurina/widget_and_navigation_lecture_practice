class Product {
  final int id;
  final String name;
  final int price;

  String get assetName => '$id-0.jpg';
  String get assetPackage => 'shrine_images';

  const Product({
    required this.id,
    required this.name,
    required this.price,
  });

  @override
  String toString() => '$name (id=$id)';

  static const products = <Product>[
    Product(
      id: 0,
      name: 'Vagabond sack',
      price: 120,
    ),
    Product(
      id: 1,
      name: 'Stella sunglasses',
      price: 58,
    ),
    Product(
      id: 2,
      name: 'Whitney belt',
      price: 35,
    ),
    Product(
      id: 3,
      name: 'Garden strand',
      price: 98,
    ),
    Product(
      id: 4,
      name: 'Strut earrings',
      price: 34,
    ),
    Product(
      id: 5,
      name: 'Varsity socks',
      price: 12,
    ),
    Product(
      id: 6,
      name: 'Weave keyring',
      price: 16,
    ),
    Product(
      id: 7,
      name: 'Gatsby hat',
      price: 40,
    ),
    Product(
      id: 8,
      name: 'Shrug bag',
      price: 198,
    ),
    Product(
      id: 9,
      name: 'Gilt desk trio',
      price: 58,
    ),
    Product(
      id: 10,
      name: 'Copper wire rack',
      price: 18,
    ),
    Product(
      id: 11,
      name: 'Soothe ceramic set',
      price: 28,
    ),
    Product(
      id: 12,
      name: 'Hurrahs tea set',
      price: 34,
    ),
    Product(
      id: 13,
      name: 'Blue stone mug',
      price: 18,
    ),
    Product(
      id: 14,
      name: 'Rainwater tray',
      price: 27,
    ),
    Product(
      id: 15,
      name: 'Chambray napkins',
      price: 16,
    ),
    Product(
      id: 16,
      name: 'Succulent planters',
      price: 16,
    ),
    Product(
      id: 17,
      name: 'Quartet table',
      price: 175,
    ),
    Product(
      id: 18,
      name: 'Kitchen quattro',
      price: 129,
    ),
    Product(
      id: 19,
      name: 'Clay sweater',
      price: 48,
    ),
    Product(
      id: 20,
      name: 'Sea tunic',
      price: 45,
    ),
    Product(
      id: 21,
      name: 'Plaster tunic',
      price: 38,
    ),
    Product(
      id: 22,
      name: 'White pinstripe shirt',
      price: 70,
    ),
    Product(
      id: 23,
      name: 'Chambray shirt',
      price: 70,
    ),
    Product(
      id: 24,
      name: 'Seabreeze sweater',
      price: 60,
    ),
    Product(
      id: 25,
      name: 'Gentry jacket',
      price: 178,
    ),
    Product(
      id: 26,
      name: 'Navy trousers',
      price: 74,
    ),
    Product(
      id: 27,
      name: 'Walter henley (white)',
      price: 38,
    ),
    Product(
      id: 28,
      name: 'Surf and perf shirt',
      price: 48,
    ),
    Product(
      id: 29,
      name: 'Ginger scarf',
      price: 98,
    ),
    Product(
      id: 30,
      name: 'Ramona crossover',
      price: 68,
    ),
    Product(
      id: 31,
      name: 'Chambray shirt',
      price: 38,
    ),
    Product(
      id: 32,
      name: 'Classic white collar',
      price: 58,
    ),
    Product(
      id: 33,
      name: 'Cerise scallop tee',
      price: 42,
    ),
    Product(
      id: 34,
      name: 'Shoulder rolls tee',
      price: 27,
    ),
    Product(
      id: 35,
      name: 'Grey slouch tank',
      price: 24,
    ),
    Product(
      id: 36,
      name: 'Sunshirt dress',
      price: 58,
    ),
    Product(
      id: 37,
      name: 'Fine lines tee',
      price: 58,
    ),
  ];
}
