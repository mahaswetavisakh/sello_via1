
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sello_via/logics/product_logic.dart';

import '../appConts/routes.dart';
import '../models/product_model.dart';
import '../logics/add_to_cart_logics.dart';


class Topbar extends StatelessWidget {
  String? title;
  bool showBackArrow;

  Topbar(String titletext, {this.showBackArrow = true}) {
    title = titletext;
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (showBackArrow)
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF5E5E5E),
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 18,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            const SizedBox(
              width: 15,
            ),
            Text(
              title!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ],
        ),

      ],
    );
  }
}

class Topbarlogin extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(),
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              size: 18,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ), // Name & Back Arrow

        const Text("SelloVia",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      ],
    );
  }
}

class Bottomnav extends StatelessWidget {
  String? navtext;

  Bottomnav(String nav) {
    navtext = nav;
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the next page
        if (navtext == "Proceed to payment") {
          Navigator.pushNamed(context, Routes.paymentRoute);

        } else if (navtext == "Pay now") {
          Navigator.pushNamed(context, Routes.orderconfirmationRoute);
        }
        else if (navtext == "Go to Home") {
          Navigator.pushNamed(context, Routes.homeRoute);
        }
      },
      child: Container(
        height: 70,
        alignment: Alignment.center,
        color: const Color(0xFFF5675B),
        child: Text(
          navtext!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontFamily: 'Fira Sans',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

//product detais bottom nav
class Bottomnavproduct extends StatelessWidget {

  final AddToCartLogics _addToCartLogics=Get.put(AddToCartLogics());
  ProductModel product;


  String? navtext1;
  String? navtext2;

  Bottomnavproduct(this.product, String nav1, String nav2) {
    navtext1 = nav1;
    navtext2 = nav2;
  }

  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            _addToCartLogics.addToCart(product);
            Navigator.pushNamed(context, Routes.add_to_cartRoute);
          },
          child: Container(
            height: 70,
            width: 180,
            alignment: Alignment.center,
            color: const Color(0xFF676563),
            child: Text(
              navtext1!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontFamily: 'Fira Sans',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {

            Navigator.pushNamed(context, Routes.purchaseformRoute);
          },
          child: Container(
            width: 180,
            height: 70,
            alignment: Alignment.center,
            color: const Color(0xFFF5675B),
            child: Text(
              navtext2!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontFamily: 'Fira Sans',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Bottomnavwithicons extends StatefulWidget {

  final Function(int)? onClick;
  Bottomnavwithicons({ this.onClick});
  @override
  State<Bottomnavwithicons> createState() => _BottomnavwithiconsState();
}

class _BottomnavwithiconsState extends State<Bottomnavwithicons> {
  int clickedItem = 1;

  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          //padding: EdgeInsets.all(10),
          height: 50,
          //width:300,
          decoration: ShapeDecoration(
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(27),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 40,
                padding: const EdgeInsets.only(left: 4, right: 4),
                decoration: BoxDecoration(
                  color: clickedItem == 1 ? const Color(0xFF1A81B9) : null,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: IconButton(
                  onPressed: () {
                    widget.onClick!(0);
                    clickedItem = 1;
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.house_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.only(left: 4, right: 4),
                decoration: BoxDecoration(
                  color: clickedItem == 2 ? const Color(0xFF1A81B9) : null,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: IconButton(
                  onPressed: () {
                    widget.onClick!(1);
                    clickedItem = 2;
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.explore_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.only(left: 4, right: 4),
                decoration: BoxDecoration(
                  color: clickedItem == 3 ? const Color(0xFF1A81B9) : null,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: IconButton(
                  onPressed: () {
                    widget.onClick!(3);
                    clickedItem = 3;
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.only(left: 4, right: 4),
                decoration: BoxDecoration(
                  color: clickedItem == 4 ? const Color(0xFF1A81B9) : null,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: IconButton(
                  onPressed: () {
                    widget.onClick!(4);
                    clickedItem = 4;
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.messenger_outline,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          //bottom:15,

          child: InkWell(
            onTap: (){
              widget.onClick!(2);
            },
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                border: Border.all(width: 3),
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
