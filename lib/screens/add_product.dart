import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sello_via/logics/category_logics.dart';
import 'package:sello_via/logics/cloud_storage_logic.dart';
import 'package:sello_via/logics/product_logic.dart';
import 'package:sello_via/models/category_model.dart';
import 'package:sello_via/test.dart';
import 'package:sello_via/widgets/loadin_widget.dart';
import '../appConts/routes.dart';
import '../widgets/custom_button.dart';
import '../widgets/customInput.dart';
import '../widgets/navbar.dart';

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  final CategoryLogics _categoryLogics=Get.put(CategoryLogics());
  final ProductLogic _productLogics=Get.put(ProductLogic());
  CategoryModel? _selectedCategory;
  CategoryModel? _selectedSubCategory;
  List<CategoryModel> subCategories=[];
  List<XFile>? _img=[];
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productPrice = TextEditingController();
  final TextEditingController _productDescription = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Topbar("Add Products"),
                const SizedBox(
                  height: 25,
                ),
                const Text("Product Name:",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                CustomInput(
                  hint: "Please Enter Your Product Name",
                  controller: _productName,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) {
                    FocusScope.of(context).nextFocus();
                  },
                ),

                const SizedBox(
                  height: 20,
                ),
                const Text("Product Price:",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                CustomInput(
                  hint: "Please Enter Your Product Price",
                  controller: _productPrice,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) {
                    FocusScope.of(context).nextFocus();
                  },
                ),

                const SizedBox(
                  height: 20,
                ),
                const Text("Product Description:",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),

                CustomInput(
                  hint: "Please Enter Your Product Description",
                  controller: _productDescription,
                  textInputAction: TextInputAction.done,
                  firstSuffixWidget: IconButton(
                    icon: Icon(Icons.edit), // Replace with your edit icon
                    onPressed: () {

                    },
                  ),
                  secondSuffixWidget: IconButton(
                    icon: Icon(Icons.delete), // Replace with your delete icon
                    onPressed: () {
                      
                    },
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                const Text("Product Category:",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
                      underline: SizedBox(), // This removes the underline
                      items: _categoryLogics.mainCategories.map((CategoryModel item) {
                    print("dsfsd==${_categoryLogics.mainCategories.length}");
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
                        setState(() {

                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                if(subCategories.isNotEmpty)...[
                  const Text("Product Sub Category:",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
                          setState(() {

                          });
                        },
                      ),
                    ),
                  ),
                ],


                const Text("Product Image:",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _img!.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == _img!.length) {
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
                                _img!.add(element);
                              });
                              setState(() {});
                            },
                          ),
                        );


                      }
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
                                image: FileImage(
                                  File(_img![index].path),
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


                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  buttonText: "Add Product",
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
                   Navigator.pop(context);
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
