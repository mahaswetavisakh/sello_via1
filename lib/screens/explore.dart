import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sello_via/models/product_model.dart';

import 'package:sello_via/widgets/navbar.dart';
import '../appConts/routes.dart';
import '../logics/authLogics.dart';
import '../logics/category_logics.dart';
import '../main.dart';
import '../models/category_model.dart';
import '../models/userModel.dart';
import '../widgets/customInput.dart';

class Explore extends StatelessWidget {
  final CategoryLogics _categoryLogics=Get.put(CategoryLogics());
  final AuthLogics _authLogics = Get.put(AuthLogics());
  TextEditingController searchController = TextEditingController();
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Topbar("Explore"),
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
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("categories")
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                    if (snapshot.hasData) {
                      List<CategoryModel> categories = [];
                      for (QueryDocumentSnapshot value in snapshot.data!.docs) {
                        categories.add(CategoryModel.fromMap(value.data()));
                      }
                      return SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _categoryLogics.mainCategories.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                  height: 40,
                                  margin: const EdgeInsets.only(right: 10),
                                  alignment: Alignment.center,
                                  decoration: ShapeDecoration(
                                    color: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(23),
                                    ),
                                  ),
                                  child: Text(
                                    "${_categoryLogics.mainCategories[index].name ?? ''}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("products")
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                    if (snapshot.hasData) {
                      List<ProductModel> products = [];
                      for (QueryDocumentSnapshot value in snapshot.data!.docs) {
                        products.add(ProductModel.fromMap(value.data()));
                      }

                      return Expanded(
                        child: ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (BuildContext context, int index) {

                            return Card(
                              child: Column(
                                children: [
                                  InkWell(
                                  onTap: () {
                            Navigator.pushNamed(context, Routes.product_detailsRoute);
                            },
                                    child: Container(
                                      child: ListTile(
                                        ///TODO:USERNAME OF SELLER
                                        title: Text(
                                          _authLogics.user!.userName!.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        subtitle: Text(products[index].category!,

                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        leading: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              ''),///TODO: need the profile picture who listed the product
                                        ),
                                        trailing:
                                            const Icon(Icons.more_vert_outlined),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 300,
                                    color: Colors.transparent,
                                    child: Stack(
                                      children: [
                                        Image.network(products[index].images![0],
                                          fit: BoxFit.cover,
                                          height: 300,
                                          width: 300,
                                        ),
                                        Positioned(
                                            bottom: 15,
                                            right: 15,
                                            child:InkWell(
                                              ///todo: setstate error
                                              onTap: () {
                                                // setState(() {
                                                //   isFavorite = !isFavorite;
                                                // });
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
                                                fontSize: 20,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Make: ${products[index].category!}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.black26,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),

                                                Text(
                                                  '|Posted Date:${products[index].date!}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.black26,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Text(
                                          '₹ ${products[index].price}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}




