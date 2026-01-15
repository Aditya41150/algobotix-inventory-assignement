import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../models/stock_history.dart';
import '../database/database_helper.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  // Load all products from database
  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();

    _products = await DatabaseHelper.instance.readAllProducts();

    _isLoading = false;
    notifyListeners();
  }

  // Add a new product
  Future<bool> addProduct(Product product) async {
    try {
      // Check if product ID already exists
      final existing = await DatabaseHelper.instance.readProduct(product.id);
      if (existing != null) {
        return false; // Product ID already exists
      }

      await DatabaseHelper.instance.createProduct(product);
      await loadProducts();
      return true;
    } catch (e) {
      debugPrint('Error adding product: $e');
      return false;
    }
  }

  // Update an existing product
  Future<void> updateProduct(Product product) async {
    await DatabaseHelper.instance.updateProduct(product);
    await loadProducts();
  }

  // Delete a product
  Future<void> deleteProduct(String id) async {
    await DatabaseHelper.instance.deleteProduct(id);
    await loadProducts();
  }

  // Search products by ID
  Future<List<Product>> searchProducts(String query) async {
    if (query.isEmpty) {
      return _products;
    }
    return await DatabaseHelper.instance.searchProducts(query);
  }

  // Update stock and record history
  Future<void> updateStock(String productId, int changeAmount) async {
    final product = await DatabaseHelper.instance.readProduct(productId);
    if (product == null) return;

    final newStock = product.currentStock + changeAmount;
    if (newStock < 0) return; // Prevent negative stock

    // Record stock history
    final history = StockHistory(
      productId: productId,
      changeAmount: changeAmount,
      previousStock: product.currentStock,
      newStock: newStock,
      timestamp: DateTime.now(),
    );
    await DatabaseHelper.instance.addStockHistory(history);

    // Update product stock
    final updatedProduct = product.copy(currentStock: newStock);
    await updateProduct(updatedProduct);
  }

  // Get stock history for a product
  Future<List<StockHistory>> getStockHistory(String productId) async {
    return await DatabaseHelper.instance.getStockHistory(productId);
  }

  // Get product by ID
  Future<Product?> getProduct(String id) async {
    return await DatabaseHelper.instance.readProduct(id);
  }
}
