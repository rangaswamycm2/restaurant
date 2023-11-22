import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

import '../../model/restaurant.dart';


class ApiServices{

  static Future<List<Restaurant>> getRestaurants() async {
    List<Restaurant> restaurantData = [];
    try {
      var res = await rootBundle.loadString("assets/restaurant.json");
      List resultData = jsonDecode(res);
      if(resultData.isNotEmpty){
        restaurantData = resultData.map((e) => Restaurant.fromJson(e)).toList();
      }
    }catch (e) {
      restaurantData = [];
    }
    return restaurantData;
  }

 static Future<List<City>> getCityList() async {
    List<City> cityData = [];
    try {
      var res = await rootBundle.loadString("assets/city.json");
       List resultData = jsonDecode(res);

       if(resultData.isNotEmpty){
         cityData = resultData.map((e) => City.fromJson(e)).toList();
       }
    }catch (e) {
      cityData = [];
    }

    return cityData;
  }

}

