import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/product.dart';
import '../models/stock_history.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('inventory.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'TEXT PRIMARY KEY';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';
    
    await db.execute('''
      CREATE TABLE products (
        id $idType,
        name $textType,
        description $textType,
        currentStock $integerType,
        imagePath TEXT,
        addedBy $textType,
        timestamp $textType
      )
    ''');

    await db.execute('''
      CREATE TABLE stock_history (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        productId $textType,
        changeAmount $integerType,
        previousStock $integerType,
        newStock $integerType,
        timestamp $textType,
        FOREIGN KEY (productId) REFERENCES products (id) ON DELETE CASCADE
      )
    ''');
  }

  // Product CRUD operations
  Future<Product> createProduct(Product product) async {
    final db = await instance.database;
    await db.insert('products', product.toMap());
    return product;
  }

  Future<Product?> readProduct(String id) async {
    final db = await instance.database;
    final maps = await db.query(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Product.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Product>> readAllProducts() async {
    final db = await instance.database;
    const orderBy = 'timestamp DESC';
    final result = await db.query('products', orderBy: orderBy);
    return result.map((json) => Product.fromMap(json)).toList();
  }

  Future<int> updateProduct(Product product) async {
    final db = await instance.database;
    return db.update(
      'products',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<int> deleteProduct(String id) async {
    final db = await instance.database;
    return await db.delete(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Product>> searchProducts(String query) async {
    final db = await instance.database;
    final result = await db.query(
      'products',
      where: 'id LIKE ?',
      whereArgs: ['%$query%'],
    );
    return result.map((json) => Product.fromMap(json)).toList();
  }

  // Stock history operations
  Future<void> addStockHistory(StockHistory history) async {
    final db = await instance.database;
    await db.insert('stock_history', history.toMap());
  }

  Future<List<StockHistory>> getStockHistory(String productId) async {
    final db = await instance.database;
    final result = await db.query(
      'stock_history',
      where: 'productId = ?',
      whereArgs: [productId],
      orderBy: 'timestamp DESC',
    );
    return result.map((json) => StockHistory.fromMap(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
