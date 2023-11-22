import 'package:flutter/material.dart';
import '../model/restaurant.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantDetailScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Average Cost for Two: \$${restaurant.averageCostForTwo.toStringAsFixed(2)}'),
                    Text('Rating: ${restaurant.averageRating.toStringAsFixed(1)}'),
                  ],
                ),
                Text('Phone Number: ${restaurant.phoneNumber}'),
                Text('Hours: ${restaurant.hours}'),
                Text('Address: ${restaurant.address}'),
                Text('Location: ${restaurant.city}'),

              ],
            ),
          ),
        ),
      ),
    );
  }
}