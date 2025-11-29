class Product {
  final int? id;
  final String name;
  final int price;
  final String? description;
  final String? imageUrl;

  Product({
    this.id,
    required this.name,
    required this.price,
    this.description,
    this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'] ?? '',
      price: (json['price'] is String) 
          ? int.tryParse(json['price']) ?? 0 
          : json['price'] ?? 0,
      description: json['description'],
      imageUrl: json['image_url'] ?? json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'image_url': imageUrl,
    };
  }

  Product copyWith({
    int? id,
    String? name,
    int? price,
    String? description,
    String? imageUrl,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, price: $price, description: $description, imageUrl: $imageUrl}';
  }
}
