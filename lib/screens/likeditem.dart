import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sello_via/widgets/custom_container.dart';
import 'package:sello_via/widgets/navbar.dart';

import '../models/product_model.dart';

class LikedItem extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return  Scaffold(


      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Topbar("Liked items", showBackArrow: false),
              SizedBox(
                height: 5,
              ),

              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                   stream: FirebaseFirestore.instance
                    .collection("favorites")
                    .snapshots(),
    builder: (context,
    AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    if (snapshot.hasData) {
    List<ProductModel> favoritesProduct = [];
    for (QueryDocumentSnapshot value in snapshot.data!.docs) {
    favoritesProduct.add(ProductModel.fromMap(value.data()));
    }
                    return ListView.builder(

                      itemCount: favoritesProduct.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
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
                                      height: 75,
                                      width: 75,

                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(13),
                                        child: Image.network(
                                          favoritesProduct[index].images![0],
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 14,),
                                    Column(

                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [

                                        Text(
                                          favoritesProduct[index].name!.length > 15
                                              ? '${favoritesProduct[index].name!.substring(0, 15)}...'
                                              : favoritesProduct[index].name!,
                                          style: const TextStyle(
                                            color: Color(0xFF5E5E5E),
                                            fontSize: 15,
                                            fontFamily: 'Fira Sans',
                                            fontWeight: FontWeight.w500,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(favoritesProduct[index].toDate(favoritesProduct[index].date!),style:const  TextStyle(
                                          color: Color(0xCB5E5E5E),
                                          fontSize: 15,
                                          fontFamily: 'Fira Sans',
                                          fontWeight: FontWeight.w400,
                                        ),),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text("₹ ${favoritesProduct[index].price!}",style: const TextStyle(
                                          color: Color(0xFF5E5E5E),
                                          fontSize: 13,
                                          fontFamily: 'Arial',
                                          fontWeight: FontWeight.bold,
                                        ),),

                                      ],
                                    ),




                                  ],
                                ),
                              ),


                            ),
                            Positioned(
                              bottom:20,
                              right: 30,
                              child: Container(
                                height: 30,
                                width:30,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                child: Icon(Icons.favorite,color: Colors.red,),
                              ), ),
                          ],
                        );
                      },
                    );
                  }else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
