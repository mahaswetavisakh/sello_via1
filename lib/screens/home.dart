import 'package:flutter/material.dart';
import 'package:sello_via/appConts/routes.dart';
import 'package:sello_via/widgets/Customcontainer.dart';

import '../widgets/profilepic.dart';

class Home extends StatelessWidget {
  List<Itemdetails> details = [
    Itemdetails(
        image: "assets/watch.png",
        item: "Cordoba Watch",
        year: "2021",
        make: "Cordoba",
        price: "20,000"),
    Itemdetails(
        image: "assets/guitar.png",
        item: "Cordoba Mini Guitar",
        year: "2023",
        make: "Cordoba",
        price: "25,000"),
    Itemdetails(
        image: "assets/book.png",
        item: "Book",
        year: "2020",
        make: "Cordoba",
        price: "2,000"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              Row(
                children: [
                  ProfilepicWidget(),
                  const SizedBox(
                    width: 20,
                  ),
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                        ),
                        Text(
                          "Alice Eve",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 23,
                          ),
                        ),
                        Text(
                          "Welcome back!",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.sidebarRoute);
                    },
                    icon: const Icon(Icons.menu, size: 30),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Search("Search"),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " New arrivals",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "View more",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: details.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Column(
                            children: [
                              Container(
                                width: 250,
                                color: Colors.transparent,
                                child: Stack(
                                  children: [
                                    Container(
                                        //height:300
                                        child: Image.asset(
                                      '${details[index].image}',
                                      fit: BoxFit.cover,
                                      height: 230,
                                      width: 250,
                                    )),
                                    Positioned(
                                        bottom: 15,
                                        right: 15,
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: ShapeDecoration(
                                            color: const Color(0x7EE0E0DF),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.favorite_outline,
                                            color: Colors.red,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${details[index].item}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '${details[index].year}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 14,
                                                color: Color(0xFF7C035A),
                                              ),
                                            ),
                                            Text(
                                              ' | ${details[index].make}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 14,
                                                color: Color(0xFF7C035A),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      '₹ ${details[index].price}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " Recently viewed",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "View more",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: details.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Column(
                            children: [
                              Container(
                                width: 250,
                                height: 230,
                                color: Colors.transparent,
                                child: Stack(
                                  children: [
                                    Container(
                                        //height:300
                                        child: Image.asset(
                                      '${details[index].image}',
                                      fit: BoxFit.cover,
                                      height: 230,
                                      width: 250,
                                    )),
                                    Positioned(
                                      bottom: 15,
                                      right: 15,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: ShapeDecoration(
                                          color: const Color(0x7EE0E0DF),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.favorite_outline,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${details[index].item}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '${details[index].year}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 14,
                                                color: Color(0xFF7C035A),
                                              ),
                                            ),
                                            Text(
                                              ' | ${details[index].make}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 14,
                                                color: Color(0xFF7C035A),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      '₹ ${details[index].price}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Itemdetails {
  String? image;
  String? item;
  String? year;
  String? make;
  String? price;

  Itemdetails({this.image, this.item, this.year, this.make, this.price});
}
