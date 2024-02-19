import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sello_via/logics/authLogics.dart';

import 'package:sello_via/widgets/navbar.dart';

import '../appConts/routes.dart';
import '../logics/product_logic.dart';
import '../models/product_model.dart';

class Listing extends StatelessWidget {
  final AuthLogics _authLogics = Get.put(AuthLogics());
  final ProductLogic _productLogic = Get.put(ProductLogic());

  Future<void> _showDeleteConfirmationDialog(BuildContext context, String productId) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Product'),
          content: const Text('Are you sure you want to delete this product?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Call the deleteProduct method on confirmation
                _productLogic.deleteProduct(productId);
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

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
                  stream: FirebaseFirestore.instance
                      .collection("products")
                      .where("sellerId", isEqualTo: _authLogics.user!.userUID!)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                    if (snapshot.hasData) {
                      List<ProductModel> products = [];
                      for (QueryDocumentSnapshot value in snapshot.data!.docs) {
                        products.add(ProductModel.fromMap(value.data()));
                      }

                      return Expanded(
                        child: ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (BuildContext context, int index) {
                            ValueNotifier<bool> isVisible=ValueNotifier(products[index].status=="Visible"?true:false);
                           return  ValueListenableBuilder(
                             valueListenable: isVisible,
                             builder: (BuildContext context, bool value, Widget? child) {
                               return Stack(
                                 children: [
                                   InkWell(
                                     onTap: () {
                                       Navigator.pushNamed(
                                         context,
                                         Routes.product_detailsRoute,
                                         arguments:{
                                           "productData":products[index]
                                         }
                                       );
                                     },
                                     child: Container(
                                       margin: const EdgeInsets.all(10),
                                       width: 300,
                                       height: 100,
                                       decoration: ShapeDecoration(
                                         color:value
                                             ? const Color(0xFFD4E4E6)
                                             : Colors.grey,
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
                                                   products[index].images![0],
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
                                                     products[index].name!,
                                                     style: const TextStyle(
                                                       color: Color(0xFF5E5E5E),
                                                       fontSize: 15,
                                                       fontFamily: 'Fira Sans',
                                                       fontWeight: FontWeight.w500,
                                                     ),
                                                     overflow: TextOverflow.ellipsis,
                                                   ),
                                                   const SizedBox(
                                                     height: 4,
                                                   ),
                                                   Row(
                                                     children: [
                                                       Text(
                                                         "Views: ${products[index].views!}",
                                                         style: const TextStyle(
                                                           color: Color(0xCB5E5E5E),
                                                           fontSize: 15,
                                                           fontFamily: 'Fira Sans',
                                                           fontWeight: FontWeight.w500,
                                                         ),
                                                       ),
                                                       const SizedBox(
                                                         width: 10,
                                                       ),
                                                       Text(
                                                         products[index].status!,
                                                         style: const TextStyle(
                                                           color: Color(0xCB5E5E5E),
                                                           fontSize: 15,
                                                           fontFamily: 'Fira Sans',
                                                           fontWeight: FontWeight.w500,
                                                         ),
                                                       ),
                                                     ],
                                                   ),
                                                   const SizedBox(
                                                     height: 4,
                                                   ),
                                                   Row(
                                                     children: [
                                                       Text(
                                                         "₹ ${products[index].price!}",
                                                         style: const TextStyle(
                                                           color: Color(0xFF527B96),
                                                           fontSize: 13,
                                                           fontFamily: 'Arial',
                                                           fontWeight: FontWeight.w500,
                                                         ),
                                                       ),
                                                       const SizedBox(
                                                         width: 20,
                                                       ),
                                                       Text(
                                                         products[index].toDate(products[index].date!),
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
                                                 InkWell(
                                                   onTap: () {
                                                     _productLogic.addStatus(
                                                         products[index], !products[index].isVisible!);
                                                   },
                                                   child: Container(
                                                     height: 25,
                                                     width: 25,
                                                     decoration: ShapeDecoration(
                                                       color: Colors.white,
                                                       shape: RoundedRectangleBorder(
                                                         borderRadius: BorderRadius.circular(100),
                                                       ),
                                                     ),
                                                     child: Icon(
                                                       value
                                                           ? Icons.visibility
                                                           : Icons.visibility_off_outlined,
                                                       color: Colors.black,
                                                       size: 16,
                                                     ),
                                                   ),
                                                 ),


                                               ],
                                             ),
                                           ],
                                         ),
                                       ),
                                     ),
                                   ),
                                   // Edit and Delete Icons
                                   Positioned(
                                     top: 7,
                                     right: 15,
                                     child: Row(
                                       children: [
                                         InkWell(
                                           onTap: () {
                                             Navigator.pushNamed(
                                               context,
                                               Routes.edit_productRoute,
                                               arguments: products[index], // Pass the product details to the edit screen
                                             );
                                           },
                                           child: Container(
                                             height: 25,
                                             width: 25,
                                             decoration: ShapeDecoration(
                                               color: Colors.white,
                                               shape: RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(100),
                                               ),
                                             ),
                                             child: const Icon(
                                               Icons.edit,
                                               color: Colors.blue,
                                               size: 16,
                                             ),
                                           ),
                                         ),
                                         const SizedBox(
                                           width: 10,
                                         ),
                                         InkWell(
                                           onTap: () {
                                             // Show the delete confirmation dialog
                                             _showDeleteConfirmationDialog(context, products[index].id!);
                                           },
                                           child: Container(
                                             margin: const EdgeInsets.all(3),
                                             height: 25,
                                             width: 25,
                                             decoration: ShapeDecoration(
                                               color: Colors.white,
                                               shape: RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(100),
                                               ),
                                             ),
                                             child: const Icon(
                                               Icons.delete,
                                               color: Colors.red,
                                               size: 16,
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ],
                               );
                             },
                           );

                          },
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}