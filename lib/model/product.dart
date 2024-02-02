class Product {
  String id;
  String name;
  double price;
  String url;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.url
  });

  Map<String, dynamic> toJson() {
    return {
      "id" : id,
      "name" : name,
      "price" : price,
      "url" : url
    };
  }

  factory Product.fromMap(Map <String, dynamic> data) {
    return Product(
      id: data['id'] as String, 
      name: data['name'] ?? 'nome', 
      price: data['price'] ?? 10, 
      url: data['url']
    );
  }

}