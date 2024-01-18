import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sello_via/logics/authLogics.dart';

import '../models/product_model.dart';
import 'cloud_storage_logic.dart';

class ProductLogic extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<ProductModel> recentlyViewedProducts=[];
  final GetStorage _localDb = GetStorage();
  final AuthLogics _authLogics = Get.put(AuthLogics());

  Future createProduct(
      {String? productName,
      String? price,
      String? description,
      String? category,
      String? subCategory,
      List<XFile>? images}) async {
    List<String> imgUrls = [];
    if (productName!.isEmpty) {
      Get.snackbar("Failed", "Please enter your product name");
    } else if (price!.isEmpty) {
      Get.snackbar("Failed", "Please enter your product price");
    } else if (description!.isEmpty) {
      Get.snackbar("Failed", "Please enter your product description");
    } else if (category!.isEmpty) {
      Get.snackbar("Failed", "Please select category");
    } else if (subCategory!.isEmpty) {
      Get.snackbar("Failed", "Please select Subcategory");
    } else if (images!.isEmpty) {
      Get.snackbar("Failed", "Please select product images");
    } else {
      for (XFile image in images!) {
        String url = await CloudStorageLogic(
                fileName: image.name,
                folderName: "products",
                file: File(image.path))
            .uploadFile();

        imgUrls.add(url);
      }


      ProductModel product = ProductModel(
          id: "",
          name: productName,
          price: price,
          description: description,
          category: category,
          subcategory: subCategory,
          images: imgUrls,
          sellerId: _authLogics.user!.userUID,
          date: DateTime.now().millisecondsSinceEpoch.toString(),
          views: 0,
          status: "review");

      print("My Product==${product.toMap()}");
      DocumentReference documentReference =
          await _db.collection("products").add(product.toMap());

      await _db
          .collection("products")
          .doc(documentReference.id)
          .update({"id": documentReference.id});
    }
  }


  addProductToRecentlyViewed(ProductModel product) async {
    for (ProductModel value in recentlyViewedProducts.toList()) {
      if(value.id==product.id){
         recentlyViewedProducts.removeAt(recentlyViewedProducts.indexOf(product));
      }
    }
    recentlyViewedProducts.add(product);

    // add code for push recentlyViewedProducts variable to local db
    List data=recentlyViewedProducts.map((e) => e.toMap()).toList();
    await _localDb.write("viewedProducts", data);
    update();
  }

  getViewedProducts(){
   List data= _localDb.read("viewedProducts")??[];
   if(data.isNotEmpty){
     recentlyViewedProducts=data.map((e) => ProductModel.fromMap(e)).toList();
   }


  }
}
