import 'package:flutter/material.dart';
import 'package:flutter_application_1/RestuarantListFromInternet.dart';
import 'package:flutter_application_1/Restuarantlist.dart';

class Restuarants extends StatefulWidget {
  
  Restaurant details;

  Restuarants({super.key,required this.details});

  @override
  State<Restuarants> createState() => _RestuarantsState();
}

class _RestuarantsState extends State<Restuarants> {
  final RestaurantList restaurantdetail = new RestaurantList();
  

  @override
  Widget build(BuildContext context) {

    return Restaurantdetails(details: widget.details);
  }
}

class Restaurantdetails extends StatelessWidget {
  final Restaurant details;
  Restaurantdetails({required this.details});

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(400),
            child: Container(
              height: 450,
              width: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(details.image??""),
                      fit: BoxFit.fitHeight)),
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsetsDirectional.all(10),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
            )),
        bottomNavigationBar: Container(
          height: 500,
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45),
              topRight: Radius.circular(45),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 35, left: 25),
                    child: Text(
                      details.restaurantName??"",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 35, right: 15),
                    child: Container(
                      width: 60,
                      height: 28,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          color: Color.fromARGB(249, 8, 127, 88)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 17,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.all(1),
                              child: Text(
                                details.rating.toString(),
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(padding: EdgeInsets.only(left: 25,),child: Text(details.address??"",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                ),),),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                  ),
                  child: Text(details.categories??"",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w300
                  ),),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 140,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text('${details.km} km • ${details.deliverytime} min',),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
