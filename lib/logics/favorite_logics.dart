import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sello_via/logics/authLogics.dart';
import 'package:sello_via/models/product_model.dart';

class FavoriteLogics extends GetxController{

  AuthLogics _authLogics=Get.put(AuthLogics());
  FirebaseFirestore _db = FirebaseFirestore.instance;
  void addToFavorite(ProductModel product){
    _db.collection("favorites").add(product.toMap()).then((value){
      _db.collection("favorites").doc(value.id).update({
        "userId":_authLogics.user!.userUID,
      });
    });


  }
}