import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/api/service_api.dart';
import '../data/database/database_helper.dart';
import '../model/restaurant.dart';
import '../provider/restaurant_provider.dart';
import 'city_selection_screen.dart';
import 'restaurant_list_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  RestaurantProvider? resPro;
  DatabaseHelper dbData = DatabaseHelper();
  List cityList = [];
  List<City> cityListData = [];

  initMethods()async{
    await getCities(isUiUpdate: false);
    await getDataCityRestaurants();
  }


  getDataCityRestaurants()async{
    List restaurantData = await dbData.getRestaurants();
    if(restaurantData.isEmpty){
      List<Restaurant> restaurantDataList = await ApiServices.getRestaurants();
      resPro?.setRestaurants(restaurantDataList);
      dbData.insertRestaurantList(resPro!.restaurants);
    }
  }

  getCityRestaurantsById(id)async{
   List restaurantData = await dbData.getRestaurantById(id);
   List<Restaurant> restaurantDataList = restaurantData.map((e) => Restaurant.fromJson(e)).toList();
   resPro?.setRestaurants(restaurantDataList);
  }

  getCities({bool isUiUpdate = true})async{
    if(isUiUpdate){
      resPro?.changeUI(0);
    }

    try {
      cityListData = await ApiServices.getCityList();
      if(cityListData.isNotEmpty){
        resPro?.changeUI(1);
      }else{
        resPro?.changeUI(2);
      }
    } catch (e) {
      resPro?.changeUI(3);
    }
  }


  @override
  void initState() {
    resPro = Provider.of<RestaurantProvider>(context,listen: false);
    initMethods();
    super.initState();
  }

  Widget bodyUI(){
    if(resPro!.homeScreenUiState == 0){
      return const Center(child: CircularProgressIndicator());
    }
    else if(resPro!.homeScreenUiState==2){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("No Data"),
            const SizedBox(height: 10),
            CupertinoButton(
                color: Colors.blue,
                onPressed: (){
                  getCities();
                },
                child: const Text("Retry")
            ),
          ],
        ),
      );
    }
    else if(resPro!.homeScreenUiState==3){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Server Error Occured"),
            const SizedBox(height: 10),
            CupertinoButton(
                color: Colors.blue,
                onPressed: (){
                  getCities();
                },
                child: const Text("Retry")
            ),
          ],
        ),
      );
    }
    return Column(
      children: [
        CitySelectionScreen(cityListData:cityListData,callBack: (val){
          resPro!.selectCity = val;
          getCityRestaurantsById(resPro!.selectCity);
        },selectedCity:resPro!.selectCity,),
        if(resPro!.homeScreenUiState==1 && resPro?.selectCity !=null) Expanded(
          child:resPro!.restaurants.isNotEmpty? RestaurantListScreen(restaurantsData:resPro?.restaurants?? [],):const Center(
            child: Text("No Restaurant Found"),
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant App"),
        centerTitle: true,
      ),

      body:Consumer<RestaurantProvider>(
        builder: (context, value, child) => bodyUI(),
      ),
    );
  }
}
