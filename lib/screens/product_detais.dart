import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sello_via/widgets/custombuttons.dart';
import 'package:sello_via/widgets/navbar.dart';

import '../appConts/routes.dart';
import '../models/product_model.dart';

class Productdetails extends StatelessWidget{
  bool isFavorite = false;
  List<Itemdetails> details = [
    Itemdetails(

        image:"assets/watch.png",
        item:"Cordoba Watch",
        year:"2021",
        make:"Cordoba",
        price:"20,000"

    ),
    Itemdetails(
        image:"assets/guitar.png",
        item:"Cordoba Mini Guitar",
        year:"2023",
        make:"Cordoba",
        price:"25,000"
    ),

    Itemdetails(

        image:"assets/book.png",
        item:"Book",
        year:"2020",
        make:"Cordoba",
        price:"2,000"

    ),
  ];
  ProductModel? productData;
  @override
  Widget build(BuildContext context) {
   Map argument= ModalRoute.of(context)!.settings.arguments as Map;
   print("arg==$argument");
   productData=argument['productData'];
    return  Scaffold(
      bottomNavigationBar: Bottomnavproduct("Add to Cart","Buy now"),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:30,right: 30,bottom: 40,top: 50),
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
                     Text("Shure podcast micro-\nphone",style: TextStyle(
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

                       child: Icon(Icons.messenger_outline,color: Colors.white,),
                     ),
                   ],
                 ),
                 SizedBox(
                   height: 5,
                 ),
                 Text("₹ 23,000",style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 19,
                     color: Color(0xFF0D7688)

                 ),),
                 SizedBox(
                   height: 5,
                 ),
                 Text("The Shure SM7B reigns as king of studio recording for good reason: vocal recording and reproduction is clear and crisp, especially when recording in a more..."),
                 SizedBox(
                   height: 5,
                 ),
                 Row(
                   children: [
                     Text("Make: "),
                     Text("Shure",style: TextStyle(
                       fontWeight: FontWeight.bold
                     ),),
                     Text(" | Year:"),
                     Text("2020",style: TextStyle(
                         fontWeight: FontWeight.bold
                     ),),
                   ],
                 ),
                 SizedBox(
                   height: 5,
                 ),
                 Row(
                   children: [
                     Text("Within Warranty"),
                     Icon(Icons.done,color: Colors.green,),
                     Text(" . ",style: TextStyle(
                         fontWeight: FontWeight.bold
                     ),),
                     Text("Orginal Packing"),
                     Icon(Icons.close_outlined,color: Colors.red,)
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
                           return const CircularProgressIndicator();
                         }
                       }),
                 ),

               ],  ),



              ],
            ),
          ),
        ],
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

  Itemdetails({this.image,this.item,this.year,this.make,this.price});
}