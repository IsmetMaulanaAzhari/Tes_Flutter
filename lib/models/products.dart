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
    // Parse price - handle both int, double, and string formats
    int parsedPrice = 0;
    final priceValue = json['price'];
    if (priceValue is int) {
      parsedPrice = priceValue;
    } else if (priceValue is double) {
      parsedPrice = priceValue.toInt();
    } else if (priceValue is String) {
      parsedPrice = double.tryParse(priceValue)?.toInt() ?? 0;
    }

    return Product(
      id: json['id'],
      name: json['name'] ?? '',
      price: parsedPrice,
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
