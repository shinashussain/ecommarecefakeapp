// ignore: depend_on_referenced_packages
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Restuarantlist.dart';

void main() {
  runApp(
    
    MaterialApp(
        title: 'Material Floating Search Bar Example',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 196, 106, 106),
          ),
        ),
        home: Homeapp()),
  );
}

class Homeapp extends StatelessWidget {
  const Homeapp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          title: TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.near_me,
              color: Colors.red,
              size: 25,
            ),
            label: const Text(
              'Location',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle,
                color: Colors.black54,
                size: 40,
              ),
            ),
          ],
          flexibleSpace: Align(
            alignment: const Alignment(0, .8),
            child: InkWell(
              onTap: () {
                showGeneralDialog(
                  context: context,
                  pageBuilder: (context, animation1, animation2) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          width:
                              MediaQuery.of(context).size.width, // Full width
                          height: 200, // Custom height
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: IconButton(
                                      icon: const Icon(Icons.arrow_back,
                                      color: Colors.black,),
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 90),
                                    child: Text(
                                      'Search for',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              SizedBox(
                                width: 350,
                                height: 50,
                                child: TextField(
                                  style: const TextStyle(
                                      color: Colors
                                          .black), // Ensure text color is black
                                  decoration: InputDecoration(
                                    filled: true, // Enables background color
                                    fillColor: Colors
                                        .white, // Set a background color for contrast
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical:
                                            15), // Add padding for the text
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.black12,
                                        width: 1,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: Colors.black12,
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: Colors.black12,
                                        width: 1,
                                      ),
                                    ),
                                    hintText: 'try any food',
                                    hintStyle: const TextStyle(
                                        color: Colors
                                            .grey), // Ensure hint text is visible
                                    suffixIcon: SizedBox(
                                      width: 70,
                                      height: 35,
                                      child: Row(
                                        children: [
                                          const VerticalDivider(
                                            thickness: 1,
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.mic,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {},
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Align(
                        alignment: Alignment(-.9, 0),
                        child: Text(
                          'search for',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment(-2, 0),
                      child: Icon(
                        Icons.search,
                        color: Colors.black45,
                        size: 25,
                      ),
                    ),
                    const Align(
                      alignment: Alignment(0, 0),
                      child: VerticalDivider(
                        width: 1,
                        color: Colors.black45,
                        thickness: 1,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.mic,
                        color: Colors.red,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        physics: const  BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            height: 150,
            width: 390,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
              color: Color.fromARGB(255, 246, 229, 226),
            ),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment(0, -1),
                  child: Image(
                    image: AssetImage(
                      'assets/food.jpg',
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 3),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.5,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Colors.white,
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'order now>>',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 110,
            child: CarouselSlider(
              items: [
                Container(
                  margin: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage('assets/breakfast.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                      alignment: const Alignment(-0.89, .93),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 25.5,
                          width: 82,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Colors.white,
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'order now',
                              style: TextStyle(
                                color: Color.fromARGB(255, 115, 80, 174),
                                fontSize: 15,
                                height: .5,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage('assets/meal.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                      alignment: const Alignment(-0.89, .93),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 25.5,
                          width: 82,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Colors.white,
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'order now',
                              style: TextStyle(
                                color: Color.fromARGB(255, 145, 60, 3),
                                fontSize: 15,
                                height: .5,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage('assets/sweet.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                      alignment: const Alignment(-0.89, .93),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 25.5,
                          width: 82,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Colors.white,
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'order now',
                              style: TextStyle(
                                color: Color.fromARGB(255, 176, 117, 44),
                                fontSize: 15,
                                height: .5,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage('assets/kfc.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                      alignment: const Alignment(-0.89, .93),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 25.5,
                          width: 82,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Color.fromARGB(255, 230, 0, 42),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'order now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                height: .5,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
              ],
              options: CarouselOptions(
                height: 200,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                
              },
              child: Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black54,
                    width: .8,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Row(children: [
                  Align(
                    alignment: const Alignment(-9, 1.5),
                    child: Image.asset('assets/train.png'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: SizedBox(
                      width: 80,
                      child: Text(
                        'FOOD               ON TRAIN',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.black54),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(left: 160),
                      child: Icon(
                        Icons.navigate_next,
                        size: 25,
                        color: Colors.black54,
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Row(
              children: [
                ButtonTheme(
                    //  minWidth: 10,
                    height: 4,
                    child: OutlinedButton(
                      child: const Row(
                        children: [
                          Text(
                            'Filter',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Align(
                              alignment: Alignment(5, 0),
                              child: Icon(
                                Icons.tune,
                                size: 20,
                                color: Colors.black87,
                              ))
                        ],
                      ),
                      onPressed: () {},
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: ButtonTheme(
                      height: 4,
                      child: OutlinedButton(
                        child: const Row(
                          children: [
                            Text(
                              'sort by',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.expand_more,
                                  size: 20,
                                  color: Colors.black87,
                                ))
                          ],
                        ),
                        onPressed: () {},
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'pure veg',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(5),
            child: Align(
              alignment: Alignment(-.9, 0),
              child: Text(
                'Restuarant to explore',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(child:  RestaurantList(),)
         
        ]
      )
    );
  }
}
