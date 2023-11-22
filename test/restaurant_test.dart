// Import necessary packages and files
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant/model/restaurant.dart';

void main() {
  test('Restaurant.fromJson should correctly parse JSON', () {
    Map<String, dynamic> jsonData = {
      "id": "1",
      "rid": "11",
      "city": "Hyderabad",
      "name": "Bawarchi",
      "averageCostForTwo": 929.0,
      "averageRating": 4.5,
      "address": "123 Main St, Cityville",
      "hours": "9:00 AM - 10:00 PM",
      "phoneNumber": "123-456-7890"
    };

    Restaurant restaurant = Restaurant.fromJson(jsonData);

    expect(restaurant.id, "1");
    expect(restaurant.rid, "11");
    expect(restaurant.city, "Hyderabad");
    expect(restaurant.name, "Bawarchi");
    expect(restaurant.averageCostForTwo, 929.0);
    expect(restaurant.averageRating, 4.5);
    expect(restaurant.address, "123 Main St, Cityville");
    expect(restaurant.hours, "9:00 AM - 10:00 PM");
    expect(restaurant.phoneNumber, "123-456-7890");
  });
}
