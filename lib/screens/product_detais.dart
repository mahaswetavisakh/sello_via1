import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sello_via/widgets/custom_container.dart';
import 'package:sello_via/widgets/navbar.dart';

import '../appConts/routes.dart';
import '../models/product_model.dart';

class Productdetails extends StatelessWidget{
  bool isFavorite = false;

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
                   SizedBox(
                     height: 20,
                   ),
                   Container(
                     width: 300,
                     height: 230,
                     color: Colors.transparent,
                     child: Image.network(productData!.images![0],fit: BoxFit.cover,height: 230,width:300,) ,
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(productData!.name!,style: TextStyle(
                         fontSize: 22,
                         fontWeight: FontWeight.bold,
                       ),),
                       Container(
                         height: 40,
                         width:40,
                         decoration: ShapeDecoration(
                           color: Color(0xFFF5675B),
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(100),
                           ),
                         ),

                         child:  IconButton(
                           icon: Icon(Icons.messenger_outline, color: Colors.white),
                           onPressed: () {
                             Navigator.pushNamed(context, Routes.message_roomRoute);
                           },
                         ),
                       ),
                     ],
                   ),
                   SizedBox(
                     height: 5,
                   ),
                   Text(productData!.price!,style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 19,
                       color: Color(0xFF0D7688)

                   ),),
                   SizedBox(
                     height: 5,
                   ),
                   Text(productData!.description!),
                   SizedBox(
                     height: 5,
                   ),
                   Row(
                     children: [

                       Text(productData!.category!,style: TextStyle(
                         fontWeight: FontWeight.bold
                       ),),
                       Text(" | "),
                       Text(DateFormat("dd/MM/yyyy").format(DateTime.parse(productData!.date!)).toString(),style: TextStyle(
                           fontWeight: FontWeight.bold
                       ),),
                     ],
                   ),
                   SizedBox(
                     height: 5,
                   ),



                   Container(
                     width: 160,
                     height: 35,
                     decoration: ShapeDecoration(
                       shape: RoundedRectangleBorder(
                         side: BorderSide(width: 2, color: Color(0xFF3C3C3C)),
                         borderRadius: BorderRadius.circular(12),
                       ),
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Image.asset("assets/Google.png",height:17),
                         SizedBox(
                           width: 10,
                         ),
                         Text('Search Details',
                           style: TextStyle(
                             color: Color(0xFF3C3C3C),
                             fontSize: 15,
                             fontFamily: 'Fira Sans',
                             fontWeight: FontWeight.bold,
                           ),),
                       ],
                     ),
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Text("Similar products",style: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                   ),),
                   SizedBox(
                     height: 5,
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
                             return Center(child: const CircularProgressIndicator());
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

