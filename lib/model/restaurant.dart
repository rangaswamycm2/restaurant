/*class Restaurant {
  final String name;
  final double averageCostForTwo;
  final double averageRating;
  final String address;
  final String hours;
  final String phoneNumber;

  Restaurant({
    required this.name,
    required this.averageCostForTwo,
    required this.averageRating,
    required this.address,
    required this.hours,
    required this.phoneNumber,
  });
}*/


class City {
  final String id;
  final String city;

  const City({required this.id, required this.city});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] as String,
      city: json['city'] as String,
    );
  }
}

class Restaurant {
  final String id;
  final String rid;
  final String city;
  final String address;
  final String name;
  final double averageCostForTwo;
  final double averageRating;
  final String hours;
  final String phoneNumber;

  const Restaurant({
    required this.id,
    required this.rid,
    required this.city,
    required this.address,
    required this.name,
    required this.averageCostForTwo,
    required this.averageRating,
    required this.hours,
    required this.phoneNumber,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] as String,
      rid: json['rid'] as String,
      city: json['city'] as String,
      address: json['address'] as String,
      name: json['name'] as String,
      averageCostForTwo: json['averageCostForTwo'] as double,
      averageRating: json['averageRating'] as double,
      hours: json['hours'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> resData = {
      "id" : id,
      "rid":  rid,
      "city" : city,
      "name": name,
      "averageCostForTwo": averageCostForTwo,
      "averageRating": averageRating,
      "address": address,
      "hours": hours,
      "phoneNumber": phoneNumber
    };
    return resData;
  }



}
