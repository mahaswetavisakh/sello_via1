import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/customButton.dart';
import '../widgets/customInput.dart';
import '../widgets/navbar.dart';

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  CollectionReference product=FirebaseFirestore.instance.collection("product");

  void addProduct(){
    final data={
      'name':_productName.text,
      'price': _productPrice.text,
      'description':_productDescription.text,
      'category': dropdownvalue,
      'subcategory':dropdownvalue1

    };
    product.add(data);
  }


  List<XFile>? _img=[];
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productPrice = TextEditingController();
  final TextEditingController _productDescription = TextEditingController();

  Future<void> createProduct(BuildContext context) async {
    if (_productName.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter your Product name")));
    } else if (_productPrice.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter your product price")));
    } else if (_productDescription.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please enter your product description")));
    } else {}
  }

  String dropdownvalue = "category1";
  List<String> items = ["category1", "category2", "category3"];
  String dropdownvalue1 = "subcategory1";
  List<String> items1 = ["subcategory1", "subcategory2", "subcategory3"];





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
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                      underline: SizedBox(), // This removes the underline
                      items: items.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                const Text("Product SubCategory:",
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
                    child:     DropdownButton(
                      value: dropdownvalue1,
                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                      items: items1.map((String items1) {
                        return DropdownMenuItem(
                          value: items1,
                          child: Text(items1),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue1 = newValue!;
                        });
                      },
                    ),
                  ),
                ),

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
                      // _img!.length = 4
                      //index=3
                      // print("index:-$index");
                      // print("Length:-${_img!.length}");
                      // print("IF:-${index==_img!.length}");
                      // print("===================================");
                      // if(index==_img!.length){
                      //   return IconButton(
                      //     icon: const Icon(Icons.camera_alt_outlined),
                      //     onPressed: () async {
                      //       ImagePicker picker = ImagePicker();
                      //       _img = await picker.pickMultiImage();
                      //       setState(() {});
                      //     },
                      //   );
                      // }else{
                      //   return Image.file(
                      //     File(_img![index].path),
                      //     height: 100,
                      //     width: 100,
                      //   );
                      // }
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  buttonText: "Add Product",
                  onTap: (){
                    addProduct();
                    createProduct(context);
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
