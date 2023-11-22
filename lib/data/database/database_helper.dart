
import 'package:sqflite/sqflite.dart';

import '../../model/restaurant.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;
  static Database? get databaseName => _database;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  static const String _tblRestaurant = 'restaurant';

  static String get tblRestaurant => _tblRestaurant;

  Future <Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/restaurant.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblRestaurant (
            rid TEXT PRIMARY KEY,
            id TEXT,
            city TEXT,
            name TEXT,
            averageCostForTwo REAL,
            averageRating REAL,
            address TEXT,
            hours TEXT,
            phoneNumber TEXT
           )
        ''');
      },
      version: 1,
    );

    return db;
  }

  Future<Database?> get database async {
    if (_database == null) {
      _database = await _initializeDb();
    } else {
      null;
    }
    return _database;
  }

  Future<void> insertRestaurantList(List<Restaurant> restaurants) async {
    final db = await database;
    for(var restaurant in restaurants){
      await db!.insert(_tblRestaurant, restaurant.toJson());
    }
  }


  Future<List> getRestaurants() async {
    final db = await database;

    List<Map<String, dynamic>> results = await db!.query(
      _tblRestaurant,
    );
    return results;
  }


  Future<List> getRestaurantById(String id) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db!.query(
      _tblRestaurant,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results;
  }
}
