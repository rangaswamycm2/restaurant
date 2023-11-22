import 'package:restaurant/model/restaurant.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    /// Initialize FFI
    sqfliteFfiInit();
    /// Change the default factory
    databaseFactory = databaseFactoryFfi;
  });
  test('DatabaseHelper should insert and retrieve restaurants correctly', () async {
    /// Ensure the database is initialized
    Restaurant restaurant = const Restaurant(
      id: "1",
      rid: "11",
      city: "Hyderabad",
      name: "Bawarchi",
      averageCostForTwo: 929.0,
      averageRating: 4.5,
      address: "123 Main St, Cityville",
      hours: "9:00 AM - 10:00 PM",
      phoneNumber: "123-456-7890",
    );

    String _tblRestaurant = "restaurant";
    var db = await openDatabase(inMemoryDatabasePath, version: 1,
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
        '''); });
    /// Insert some data

    await db.insert(_tblRestaurant, restaurant.toJson());
    /// Check content
    expect(await db.query(_tblRestaurant), [
      {
        'rid': '11',
        'id': '1',
        'city': 'Hyderabad',
        'name': 'Bawarchi',
        'averageCostForTwo': 929.0,
        'averageRating': 4.5,
        'address': '123 Main St, Cityville',
        'hours': '9:00 AM - 10:00 PM',
        'phoneNumber': '123-456-7890'
      }
    ]);

    await db.close();
  });

}
