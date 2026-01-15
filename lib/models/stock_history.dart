class StockHistory {
  final int? id;
  final String productId;
  final int changeAmount;
  final int previousStock;
  final int newStock;
  final DateTime timestamp;

  StockHistory({
    this.id,
    required this.productId,
    required this.changeAmount,
    required this.previousStock,
    required this.newStock,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'changeAmount': changeAmount,
      'previousStock': previousStock,
      'newStock': newStock,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory StockHistory.fromMap(Map<String, dynamic> map) {
    return StockHistory(
      id: map['id'] as int?,
      productId: map['productId'] as String,
      changeAmount: map['changeAmount'] as int,
      previousStock: map['previousStock'] as int,
      newStock: map['newStock'] as int,
      timestamp: DateTime.parse(map['timestamp'] as String),
    );
  }

  String get changeText {
    if (changeAmount > 0) {
      return '+$changeAmount';
    }
    return '$changeAmount';
  }
}
