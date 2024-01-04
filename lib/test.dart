import 'package:flutter/material.dart';
import 'package:get/get.dart';

int cartItemCount = 1;

class ProductLogics extends GetxController {
  List myProducts = ["Phone", "Laptop", "Wi-Fi"];
  List myCartProduct = [];

  void addProductToCart(String productName) {
    myCartProduct.add(productName);
    update();
  }
}


void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}


class Home extends StatelessWidget {
  ProductLogics logics = Get.put(ProductLogics());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          actions: [
            Stack(
              children: [
                const Icon(Icons.shopping_cart),
                Positioned(
                  top: -5,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: GetBuilder<ProductLogics>(
                        builder: (logic) {
                      return Text(logics.myCartProduct.length.toString(),
                        style: const TextStyle(
                            color: Colors.white
                        ),);
                    }),
                  ),
                )
              ],
            )

          ],
        ),
        body: Center(
          child: ListView.builder(
            itemCount: logics.myProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    Get.to(ProductDetail());
                  },
                  child: Text(logics.myProducts[index]));
            },
          ),
        )
    );
  }
}

class ProductDetail extends StatefulWidget {
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  ProductLogics logics = Get.put(ProductLogics());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Navigator.pop(context);
              Get.back();
            },
          ),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              logics.addProductToCart("Mobile");
            }, child: const Text("Add to cart"),
          ),
        )
    );
  }
}