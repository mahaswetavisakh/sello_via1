import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sello_via/logics/authLogics.dart';
import 'package:sello_via/widgets/custom_container.dart';
import 'package:sello_via/widgets/navbar.dart';

import '../models/product_model.dart';

class LikedItem extends StatelessWidget{

  final AuthLogics _authLogics=Get.put(AuthLogics());

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
                  stream: FirebaseFirestore.instance.
                  collection("favorites").where("userId",isEqualTo:_authLogics.user!.userUID! )
                      .snapshots(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      List<ProductModel> favoritesProducts = [];
                      for (QueryDocumentSnapshot value in snapshot.data!.docs) {
                        favoritesProducts.add(ProductModel.fromMap(value.data()));
                      }
                      return ListView.builder(
                        itemCount: favoritesProducts.length,
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
                                          child: Image.asset("${favoritesProducts[index].images![0]}",fit: BoxFit.fill,),
                                        ),
                                      ),
                                      const SizedBox(width: 14,),
                                      Column(

                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          Text(favoritesProducts[index].name!,style:const  TextStyle(
                                            color: Color(0xFF5E5E5E),
                                            fontSize: 15,
                                            fontFamily: 'Fira Sans',
                                            fontWeight: FontWeight.w500,
                                          ),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(favoritesProducts[index].date!,style:const  TextStyle(
                                            color: Color(0xCB5E5E5E),
                                            fontSize: 15,
                                            fontFamily: 'Fira Sans',
                                            fontWeight: FontWeight.w400,
                                          ),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(favoritesProducts[index].price!,style: const TextStyle(
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

                    }else{
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class Favorate {


  String? image;
  String? maintext;
  String? datetext;
  String? pricetext;
  Favorate({this.image, this.maintext,this.datetext, this.pricetext});
}