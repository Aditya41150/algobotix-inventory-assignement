class Product {
  final String id;
  final String name;
  final String description;
  final int currentStock;
  final String? imagePath;
  final String addedBy;
  final DateTime timestamp;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.currentStock,
    this.imagePath,
    required this.addedBy,
    required this.timestamp,
  });

  // Validation for Product ID (exactly 5 alphanumeric characters)
  static bool isValidProductId(String id) {
    final regex = RegExp(r'^[a-zA-Z0-9]{5}$');
    return regex.hasMatch(id);
  }

  Product copy({
    String? id,
    String? name,
    String? description,
    int? currentStock,
    String? imagePath,
    String? addedBy,
    DateTime? timestamp,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      currentStock: currentStock ?? this.currentStock,
      imagePath: imagePath ?? this.imagePath,
      addedBy: addedBy ?? this.addedBy,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'currentStock': currentStock,
      'imagePath': imagePath,
      'addedBy': addedBy,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      currentStock: map['currentStock'] as int,
      imagePath: map['imagePath'] as String?,
      addedBy: map['addedBy'] as String,
      timestamp: DateTime.parse(map['timestamp'] as String),
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, stock: $currentStock)';
  }
}
