import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sello_via/appConts/routes.dart';
import 'package:sello_via/logics/authLogics.dart';


import '../models/category_model.dart';
import '../models/product_model.dart';
import '../widgets/customInput.dart';
import '../widgets/profilepic.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthLogics _authLogics = Get.put(AuthLogics());

  bool isFavorite = false;
  TextEditingController searchController = TextEditingController();
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
                  const ProfilepicWidget(),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                        ),
                        GetBuilder<AuthLogics>(builder: (logic) {
                          print("my name==${_authLogics.user!.userName!}");
                          return Text(
                            _authLogics.user!.userName!.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 23,
                            ),
                          );
                        }),
                        const Text(
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
              CustomInput(
                hint: "Search",
                controller: searchController,

                firstSuffixWidget: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {

                  },
                ),
              ),
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

                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("products")
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                          if (snapshot.hasData) {
                            List<ProductModel> products = [];
                            for (QueryDocumentSnapshot value
                                in snapshot.data!.docs) {
                              products.add(ProductModel.fromMap(value.data()));
                            }
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: products.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.product_detailsRoute,

                                          );


                                        },
                                        child: Container(
                                          width: 250,
                                          color: Colors.transparent,
                                          child: Stack(
                                            children: [
                                              Container(
                                                  //height:300
                                                  child: Image.network(
                                                products[index].images![0],
                                                fit: BoxFit.cover,
                                                height: 230,
                                                width: 250,
                                              )),
                                              Positioned(
                                                  bottom: 15,
                                                  right: 15,
                                                  child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          isFavorite = !isFavorite;
                                                        });
                                                      },
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: ShapeDecoration(
                                                        color: const Color(
                                                            0x7EE0E0DF),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(100),
                                                        ),
                                                      ),
                                                      child:  Icon(
                                                        isFavorite ? Icons.favorite : Icons.favorite_outline,
                                                        color: Colors.red,
                                                      ),

                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  products[index].name!,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Posted Date: ${products[index].date!.substring(0, 10)}',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFF7C035A),
                                                      ),
                                                    ),
                                                    const Text(
                                                      ' ',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFF7C035A),
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
                                              '₹ ${products[index].price}',
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
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }),
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
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("products")
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                          if (snapshot.hasData) {
                            List<ProductModel> products = [];
                            for (QueryDocumentSnapshot value
                            in snapshot.data!.docs) {
                              products.add(ProductModel.fromMap(value.data()));
                            }
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: products.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(context,
                                              Routes.product_detailsRoute);
                                        },
                                        child: Container(
                                          width: 250,
                                          color: Colors.transparent,
                                          child: Stack(
                                            children: [
                                              Container(
                                                //height:300
                                                  child: Image.network(
                                                    products[index].images![0],
                                                    fit: BoxFit.cover,
                                                    height: 230,
                                                    width: 250,
                                                  )),
                                              Positioned(
                                                  bottom: 15,
                                                  right: 15,
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        isFavorite = !isFavorite;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: ShapeDecoration(
                                                        color: const Color(
                                                            0x7EE0E0DF),
                                                        shape:
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(100),
                                                        ),
                                                      ),
                                                      child:  Icon(
                                                        isFavorite ? Icons.favorite : Icons.favorite_outline,
                                                        color: Colors.red,
                                                      ),

                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  products[index].name!,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Posted Date: ${products[index].date!.substring(0, 10)}',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                        FontWeight.w300,
                                                        fontSize: 14,
                                                        color:
                                                        Color(0xFF7C035A),
                                                      ),
                                                    ),
                                                    const Text(
                                                      ' ',
                                                      style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w300,
                                                        fontSize: 14,
                                                        color:
                                                        Color(0xFF7C035A),
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
                                              '₹ ${products[index].price}',
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
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }),
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


