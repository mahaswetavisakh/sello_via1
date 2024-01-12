import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sello_via/appConts/routes.dart';
import 'package:sello_via/logics/authLogics.dart';


import '../models/category_model.dart';
import '../models/product_model.dart';
import '../widgets/customInput.dart';
import '../widgets/product_list_item.dart';
import '../widgets/profilepic.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthLogics _authLogics = Get.put(AuthLogics());


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
                  icon: const Icon(Icons.search),
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
                                return ProductListItem(products[index]);
                              },
                            );
                          } else {
                            return const Center(child: CircularProgressIndicator());
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
                                return ProductListItem(products[index]);
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


