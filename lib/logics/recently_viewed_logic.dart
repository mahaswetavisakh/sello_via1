import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sello_via/logics/authLogics.dart';
import 'package:sello_via/models/product_model.dart';

class Recently_viewed_Logics extends GetxController{

  AuthLogics _authLogics=Get.put(AuthLogics());
  FirebaseFirestore _db = FirebaseFirestore.instance;
  void recently_Viewed(ProductModel product){

    _db.collection("recentlyviewed").add(product.toMap()).then((value){
      _db.collection("recentlyviewed").doc(value.id).update({
        "userId":_authLogics.user!.userUID,
      });
    });


  }

}