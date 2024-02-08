import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sello_via/logics/category_logics.dart';
import 'package:sello_via/logics/cloud_storage_logic.dart';
import 'package:sello_via/logics/product_logic.dart';
import 'package:sello_via/models/category_model.dart';
import 'package:sello_via/models/product_model.dart';

import 'package:sello_via/widgets/loading_widget.dart';
import '../appConts/routes.dart';
import '../widgets/custom_button.dart';
import '../widgets/customInput.dart';
import '../widgets/navbar.dart';

class EditProduct extends StatefulWidget {
  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {

  // Create instances of required logic classes
  final CategoryLogics _categoryLogics=Get.put(CategoryLogics());
  final ProductLogic _productLogics=Get.put(ProductLogic());

  // State variables
  CategoryModel? _selectedCategory;
  CategoryModel? _selectedSubCategory;
  List<CategoryModel> subCategories=[];
  List<XFile>? _img=[];
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productPrice = TextEditingController();
  final TextEditingController _productDescription = TextEditingController();
  ProductModel? args;

  void updateProduct() async {
    showLoading(context);
    _productLogics.updateProduct();
    ///todo Pass the necessary parameters for updating the product
    Navigator.pop(context);
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Product updated successfully"),
        duration: Duration(seconds: 2), // Adjust the duration as needed
      ));
    });
  }


  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as ProductModel;
    _productName.text=args!.name!;
    _productPrice.text=args!.price!;
    _productDescription.text=args!.description!;
    _selectedCategory = _categoryLogics.mainCategories.firstWhere((category) => category.id == args!.category);
    _selectedSubCategory = _categoryLogics.getSubcategory(_selectedCategory!).firstWhere((subcategory) => subcategory.id == args!.subcategory);


    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Topbar Widget
                Topbar("Edit Products"),

                // Spacing
                const SizedBox(height: 25),

                // Product Name Input
                const Text("Product Name:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                CustomInput(
                  hint: "Please Enter Your Product Name",
                  controller: _productName,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) {
                    FocusScope.of(context).nextFocus();
                  },
                ),

                const SizedBox(height: 20),

                // Product Price Input
                const Text("Product Price:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                CustomInput(
                  hint: "Please Enter Your Product Price",
                  controller: _productPrice,
                  inputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) {
                    FocusScope.of(context).nextFocus();
                  },
                ),

                const SizedBox(height: 20),

                // Product Description Input
                const Text("Product Description:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                CustomInput(
                  hint: "Please Enter Your Product Description",
                  controller: _productDescription,
                  textInputAction: TextInputAction.done,
                ),

                const SizedBox(height: 20),

                // Product Category Dropdown
                const Text("Product Category:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Container(
                  height: 50,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFE1E1E1),
                  ),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: _selectedCategory,
                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                      underline: SizedBox(),
                      items: _categoryLogics.mainCategories.map((CategoryModel item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item.name!),
                        );
                      }).toList(),
                      onChanged: (CategoryModel? newValue) {
                        _selectedCategory=newValue;
                        subCategories.clear();
                        _selectedSubCategory=null;
                        subCategories=  _categoryLogics.getSubcategory(_selectedCategory!);
                        setState(() {});
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Product Sub Category Dropdown (if applicable)
                if(subCategories.isNotEmpty)...[
                  const Text("Product Sub Category:",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Container(
                    height: 50,
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFE1E1E1),
                    ),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: _selectedSubCategory,
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        underline: SizedBox(), // This removes the underline
                        items: subCategories.map((CategoryModel item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item.name!),
                          );
                        }).toList(),
                        onChanged: (CategoryModel? newValue) {
                          _selectedSubCategory=newValue;
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 20),

                // Product Images Section
                const Text("Product Image:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(height: 10),

                // Image Selection Section
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:args!.images!.length+1,
                    itemBuilder: (BuildContext context, int index) {
                      print("lenght==${args!.images!.length}");
                      print("index==${index}");
                      if (index+1 == args!.images!.length+1) {
                        return Container(
                          height:50,
                          width: 100,
                          padding: EdgeInsets.only(left:10,right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFFE1E1E1),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt_outlined),
                            onPressed: () async {
                              ImagePicker picker = ImagePicker();
                              List<XFile> data = await picker.pickMultiImage();
                              data.forEach((element) {
                                // _img!.add(element);
                                args!.images!.add(element.path);
                              });
                              setState(() {});
                            },
                          ),
                        );
                      }

                      if( args!.images![index].toString().isURL){
                        return Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(5),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                  NetworkImage(
                                   args!.images![index].toString()
                                  ))),
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              _img!.remove(_img![index]);
                              setState(() {});
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white70),
                              child: const Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      }else{
                        return Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(5),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                  FileImage(
                                    File(args!.images![index].toString()),
                                  ))),
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              _img!.remove(_img![index]);
                              setState(() {});
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white70),
                              child: const Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      }

                    },
                  ),
                ),
                const SizedBox(height: 10),

                // Add Product Button
                CustomButton(
                  buttonText: "Update Product",
                  onTap: () async {
                    showLoading(context);
                    await _productLogics.createProduct(
                        productName: _productName.text,
                        price: _productPrice.text,
                        description: _productDescription.text,
                        category: _selectedCategory!.id,
                        subCategory: _selectedSubCategory!.id,
                        images: _img
                    );
                    Navigator.pushNamed(context, Routes.listingRoute);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}