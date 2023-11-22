import 'package:flutter/material.dart';


import '../model/restaurant.dart';
import 'restaurant_detail_screen.dart';
class RestaurantListScreen extends StatelessWidget {
  List<Restaurant> restaurantsData = [];
  RestaurantListScreen({super.key, required this.restaurantsData});

  @override
  Widget build(BuildContext context) {
     return ListView.builder(
        shrinkWrap: true,
        itemCount: restaurantsData.length,
        itemBuilder: (context,index){
          Restaurant restaurant = restaurantsData[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(restaurant.name),
                subtitle: Text('Average Cost For Two Persons: ₹${restaurant.averageCostForTwo.toStringAsFixed(2)}  |  Rating: ${restaurant.averageRating.toStringAsFixed(1)}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RestaurantDetailScreen(restaurant: restaurant),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}