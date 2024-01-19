import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:sello_via/widgets/navbar.dart';

import '../models/product_model.dart';

class Listing extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Topbar("My Listings"),
              const SizedBox(
                height: 30,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("products").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {

                  if (snapshot.hasData) {
                    List<ProductModel> products = [];
                    for (QueryDocumentSnapshot value in snapshot.data!.docs) {
                      products.add(ProductModel.fromMap(value.data()));
                    }
                    return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        ProductModel product = products[index];
                        return Container(
                          width: 300,
                          height: 100,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD4E4E6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 65,
                                  width: 65,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(13),
                                    child: Image.network(
                                      product.images![0],  // Replace with the actual image property
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 14,),
                                Container(
                                  width: 165,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        product.name!,  // Replace with the actual property
                                        style: const TextStyle(
                                          color: Color(0xFF5E5E5E),
                                          fontSize: 15,
                                          fontFamily: 'Fira Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Text(
                                            "Views: ",
                                            style: TextStyle(
                                              color: Color(0xCB5E5E5E),
                                              fontSize: 15,
                                              fontFamily: 'Fira Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            product.views.toString(),  // Replace with the actual property
                                            style: const TextStyle(
                                              color: Color(0xCB5E5E5E),
                                              fontSize: 15,
                                              fontFamily: 'Fira Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Text(
                                            "₹ ",
                                            style: const TextStyle(
                                              color: Color(0xFF527B96),
                                              fontSize: 13,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            product.price!,  // Replace with the actual property
                                            style: const TextStyle(
                                              color: Color(0xFF527B96),
                                              fontSize: 13,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Text(
                                            product.date!,  // Replace with the actual property
                                            style: const TextStyle(
                                              color: Color(0xCCC9197D),
                                              fontSize: 13,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.visibility_off_outlined,
                                        color: Colors.black,
                                        size: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}