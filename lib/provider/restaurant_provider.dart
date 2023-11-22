import 'package:flutter/material.dart';

import '../model/restaurant.dart';

class RestaurantProvider extends ChangeNotifier {
  String? selectCity;
  int homeScreenUiState = 0;
  List<Restaurant> _restaurants = [];

  List<Restaurant> get restaurants => _restaurants;

  changeCity(String? cityId){
    selectCity = cityId;
    notifyListeners();
  }

  changeUI(int i){
    homeScreenUiState = i;
    notifyListeners();
  }

  void setRestaurants(List<Restaurant> restaurants) {
    _restaurants = restaurants;
    notifyListeners();
  }
}