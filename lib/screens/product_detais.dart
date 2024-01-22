import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:sello_via/logics/category_logics.dart';
import 'package:sello_via/widgets/custom_container.dart';
import 'package:sello_via/widgets/navbar.dart';
import 'package:sello_via/widgets/product_list_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../appConts/routes.dart';
import '../models/product_model.dart';

class Productdetails extends StatelessWidget{
  bool isFavorite = false;
  final CategoryLogics _categoryLogics=Get.put(CategoryLogics());

  ProductModel? productData;
  @override
  Widget build(BuildContext context) {
   Map argument= ModalRoute.of(context)!.settings.arguments as Map;
   print("arg==$argument");
   productData=argument['productData'];
    return  Scaffold(
      bottomNavigationBar: Bottomnavproduct("Add to Cart","Buy now"),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Topbarlogin(),
               Column(

               //mainAxisSize: MainAxisSize.min,
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,

                 children: [
                   const SizedBox(
                     height: 20,
                   ),
                   CarouselSlider(
                     options: CarouselOptions(
                       height: 230,
                       enableInfiniteScroll: false, // Set to true for infinite scrolling
                     ),
                     items: productData!.images!.map((image) {
                       return Builder(
                         builder: (BuildContext context) {
                           return Container(
                             width: MediaQuery.of(context).size.width,
                             margin: EdgeInsets.symmetric(horizontal: 5.0),
                             decoration: BoxDecoration(
                               color: Colors.transparent,
                             ),
                             child: Image.network(image, fit: BoxFit.cover),
                           );
                         },
                       );
                     }).toList(),
                   ),
                   const SizedBox(
                     height: 20,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         width: MediaQuery.of(context).size.width - 100, // Adjust the width as needed
                         child: Text(
                           productData!.name!,
                           overflow: TextOverflow.ellipsis,
                           maxLines: 1,
                           style: const TextStyle(
                             fontSize: 22,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                       ),
                       Container(
                         height: 40,
                         width:40,
                         decoration: ShapeDecoration(
                           color: const Color(0xFFF5675B),
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(100),
                           ),
                         ),

                         child:  IconButton(
                           icon: const Icon(Icons.messenger_outline, color: Colors.white),
                           onPressed: () {
                             Navigator.pushNamed(context, Routes.message_roomRoute);
                           },
                         ),
                       ),
                     ],
                   ),
                   const SizedBox(
                     height: 5,
                   ),
                   Text('₹ ${productData!.price!}',style: const TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 19,
                       color: Color(0xFF0D7688)

                   ),),
                   const SizedBox(
                     height: 5,
                   ),
                ReadMoreText(
                  productData!.description!,
                  trimLines: 2,
                  colorClickableText: Colors.red,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),

                   const SizedBox(
                     height: 5,
                   ),
                   Row(
                     children: [

                       Text(_categoryLogics.getCategoryNameFromCategoryId(productData!.category!)!,style: const TextStyle(
                         fontWeight: FontWeight.bold
                       ),),
                       const Text(" | "),
                       // Text(DateFormat("dd/MM/yyyy").format(DateTime.parse(productData!.date!)).toString(),style: const TextStyle(
                       //     fontWeight: FontWeight.bold
                       // ),),
                     ],
                   ),
                   const SizedBox(
                     height: 5,
                   ),



                   Container(
                     width: 160,
                     height: 35,
                     decoration: ShapeDecoration(
                       shape: RoundedRectangleBorder(
                         side: const BorderSide(width: 2, color: Color(0xFF3C3C3C)),
                         borderRadius: BorderRadius.circular(12),
                       ),
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Image.asset("assets/Google.png",height:17),
                         const SizedBox(
                           width: 10,
                         ),
                         const Text('Search Details',
                           style: TextStyle(
                             color: Color(0xFF3C3C3C),
                             fontSize: 15,
                             fontFamily: 'Fira Sans',
                             fontWeight: FontWeight.bold,
                           ),),
                       ],
                     ),
                   ),
                   const SizedBox(
                     height: 10,
                   ),
                   const Text("Similar products",style: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                   ),),
                   const SizedBox(
                     height: 5,
                   ),
                   SizedBox(
                     height: MediaQuery.of(context).size.height * 0.4,
                     child: StreamBuilder<QuerySnapshot>(
                         stream: FirebaseFirestore.instance
                             .collection("products").where("subcategory",isEqualTo: productData!.subcategory!).
                         where("category",isEqualTo: productData!.category!)
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

                 ],  ),



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

