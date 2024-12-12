import "package:flutter/material.dart";
import 'package:flutter_application_1/RestuarantListFromInternet.dart';
import 'package:flutter_application_1/Restuarants.dart';
// import 'package:flutter_application_1/Restuarants.dart';
// List<Map<String, dynamic>> locations = [
//   {
//     'restaurant name': 'thaza',
//     'veg': false,
//     'rating': 3.5,
//     'categories': 'arabic chinese',
//     'address': 'kottukulangara, kayamkulam',
//     'km': 0.5,
//     'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRbb0ywZjFCbHgVt_0V3347tCV2VoHxbvqqg&s',
//     'deliverytime': 30,
//   },
//   {
//     'restaurant name': 'bharath cafe',
//     'veg': false,
//     'rating': 4.1,
//     'categories': 'arabic shakes',
//     'address': 'kareelakulangara',
//     'km': 1.8,
//     'image': 'https://images.yummy.ph/yummy/uploads/2022/05/chickenkabsa.jpg',
//     'deliverytime': 25,
//   },
//   {
//     'restaurant name': 'planet',
//     'veg': false,
//     'rating': 4.5,
//     'categories': 'chinese arabic snacks shakes',
//     'address': 'kareelakulangara',
//     'km': 2.8,
//     'image': 'https://www.shutterstock.com/image-photo/arabic-traditional-cuisine-middle-eastern-260nw-1120422506.jpg',
//     'deliverytime': 40,
//   },
//   {
//     'restaurant name': 'aryas',
//     'veg': true,
//     'rating': 3.8,
//     'categories': 'dosa meals veg',
//     'address': 'kayamkulam',
//     'km': 4.0,
//     'image': 'https://media.easemytrip.com/media/Blog/India/636977607425696252/636977607425696252QYiiUU.jpg',
//     'deliverytime': 35,
//   },
//   {
//     'restaurant name': 'aradhana pure veg',
//     'veg': true,
//     'rating': 3.6,
//     'categories': 'dosa shakes veg',
//     'address': 'kayamkulam',
//     'km': 4.5,
//     'image':'https://content.jdmagicbox.com/comp/def_content/pure_veg_restaurants/default-pure-veg-restaurants-5-250.jpg',
//     'deliverytime': 20,
//   },
// ];

class RestaurantList extends StatefulWidget {
  @override
  _RestaurantListState createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  late Future<RestuarantListFromInternet> listrestaurent;

  @override
  void initState() {
    super.initState();
    listrestaurent = fetchrestuarent();
  }

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<RestuarantListFromInternet>(
        future: listrestaurent,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: connection failed'));
          } else if (snapshot.hasData) {
            var data = snapshot.data!;
            int length = data.restaurants.length;

            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: RestaurantCard(location: data.restaurants[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=>Restuarants(details: data.restaurants[index],)
                      )
                    );
                  },
                );
              },
            );
          } else {
            return const Text('No data found');
          }
        },
      );
    
  }
}

class RestaurantCard extends StatelessWidget {
  final Restaurant location;

  const RestaurantCard({required this.location});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: SizedBox(
        height: 160,
        width: 400,
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: NetworkImage(location.image ?? ""),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              height: 160,
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (location.veg == true)
                    Row(
                      children: [
                        const Icon(Icons.eco_outlined, color: Color.fromARGB(255, 1, 114, 5)),
                        const SizedBox(width: 4),
                        const Text(
                          'Pure Veg',
                          style: TextStyle(
                            color: Color.fromARGB(255, 1, 114, 5),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        location.restaurantName ?? "",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  Row(
                    children: [
                      const Icon(Icons.stars, color: Color.fromARGB(255, 5, 94, 29)),
                      Text(
                        location.rating?.toString() ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        ' • ${location.deliverytime ?? ""} min',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    location.categories ?? "",
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '${location.deliverytime ?? ""} • ${location.km ?? ""} km',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}