import 'dart:convert';
import 'package:http/http.dart' as http;

Future<RestuarantListFromInternet> fetchrestuarent() async {
  final response = await http.get(Uri.parse('https://mocki.io/v1/6f20bf00-36d4-4d63-b9af-9ab0db573396'));
  if (response.statusCode == 200) {
    return RestuarantListFromInternet.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

class RestuarantListFromInternet {
  RestuarantListFromInternet({required this.restaurants});
  late List<Restaurant> restaurants;

  factory RestuarantListFromInternet.fromJson(Map<String, dynamic> json) {
    return RestuarantListFromInternet(
      restaurants: json["restaurants"] == null ? [] : List<Restaurant>.from(json["restaurants"]!.map((x) => Restaurant.fromJson(x))),
    );
  }
  
}

class Restaurant {
  Restaurant({
    required this.restaurantName,
    required this.veg,
    required this.rating,
    required this.categories,
    required this.address,
    required this.km,
    required this.image,
    required this.deliverytime,
  });

  String? restaurantName;
  bool? veg;
  var rating;
  String? categories;
  String? address;
  var km;
  String? image;
  int? deliverytime;

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      restaurantName: json["restaurantName"],
      veg: json["veg"],
      rating: json["rating"],
      categories: json["categories"],
      address: json["address"],
      km: json["km"],
      image: json["image"],
      deliverytime: json["deliverytime"],
    );
  }
}