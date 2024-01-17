import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/category_model.dart';

class CategoryLogics extends GetxController{

  List<CategoryModel> mainCategories=[];
  List<CategoryModel> subCategories=[];
  final FirebaseFirestore _db=FirebaseFirestore.instance;

  getCategoriesFromDb() async {
    QuerySnapshot querySnapshot=await _db.collection("categories").get();
    for(QueryDocumentSnapshot value in querySnapshot.docs ){
      CategoryModel category=CategoryModel.fromMap(value.data());
      if(category.categoryId!.isEmpty){
        mainCategories.add(category);
      }else{
        subCategories.add(category);
      }
    }

    log("Categories=${mainCategories.map((e) => print(e.name))}");
    log("SubCategories=${subCategories.map((e) => print(e.name))}");
  }


 List<CategoryModel> getSubcategory(CategoryModel categoryModel){
    List<CategoryModel> data=[];
    for(CategoryModel value in subCategories){
      if(value.categoryId==categoryModel.id){
        data.add(value);
      }
    }

    return data;
  }

 String? getCategoryNameFromCategoryId(String categoryId){
   print("Passed Value=${categoryId}  : ${mainCategories.length}");
    for (CategoryModel value in mainCategories) {

      if(value.id==categoryId){
        return value.name;
      }
    }
    return "";
  }

}