import 'package:flutter/material.dart';

import '../model/restaurant.dart';
class CitySelectionScreen extends StatelessWidget {
  List<City> cityListData = [];
  String? selectedCity;
  Function(String? val)? callBack;
  CitySelectionScreen({Key? key,required this.cityListData,this.selectedCity,this.callBack}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.all(8.0),
      child:  DropdownButton(
        value: selectedCity,
        isExpanded: true,
        underline: const SizedBox(),
        borderRadius: BorderRadius.circular(8.0),

         padding: const EdgeInsets.only(left: 8.0,right: 8.0),
        icon: const Icon(Icons.keyboard_arrow_down),
        hint: const Text("Select City"),
        items: cityListData.map((City items) {
          return DropdownMenuItem(
            value: items.id,
            child: Text(items.city),
          );
        }).toList(),
        onChanged: (String? newValue) {
          callBack!(newValue);
        },
      ),
    );
  }
}

