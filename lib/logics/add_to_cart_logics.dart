import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sello_via/logics/authLogics.dart';
import 'package:sello_via/models/product_model.dart';

class AddToCartLogics extends GetxController{



  AuthLogics _authLogics=Get.put(AuthLogics());
  FirebaseFirestore _db = FirebaseFirestore.instance;
  void addToCart(ProductModel product){
    _db.collection("addToCart").add(product.toMap()).then((value){
      _db.collection("addToCart").doc(value.id).update({
        "userId":_authLogics.user!.userUID,
      });
    });


  }


  Future<void> deleteProduct(String addToCartId) async {
    try {
      await _db.collection("addToCart").doc(addToCartId).delete();
      Get.snackbar("Success", "Product deleted successfully");
    } catch (e) {
      Get.snackbar("Error", "Failed to delete product");
    }
  }



}

