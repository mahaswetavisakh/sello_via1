import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sello_via/models/product_model.dart';

import 'package:sello_via/widgets/navbar.dart';
import 'package:sello_via/widgets/product_list_item.dart';
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
  ValueNotifier<String> selectedCategory=ValueNotifier("");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Topbar("Explore", showBackArrow: false),
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
                autoFocus: false,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categoryLogics.mainCategories.length+1,
                  itemBuilder: (BuildContext context, int index) {
                    if(index==0){
                      return InkWell(
                        onTap: (){
                          selectedCategory.value="";
                        },
                        child: Row(
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
                                "All",
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
                        ),
                      );
                    }else{
                      return InkWell(
                        onTap: (){
                          selectedCategory.value=_categoryLogics.mainCategories[index].id!;
                        },
                        child: Row(
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
                        ),
                      );
                    }

                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ValueListenableBuilder(
                valueListenable: selectedCategory,
                builder: (BuildContext context, value, Widget? child) {
                  return StreamBuilder<QuerySnapshot>(
                      stream: selectedCategory.value==""?
                      FirebaseFirestore.instance
                          .collection("products")
                          .snapshots():
                      FirebaseFirestore.instance
                          .collection("products").where("category",
                          isEqualTo: selectedCategory.value)
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

                                return ProductListItem(products[index]);
                              },
                            ),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}




