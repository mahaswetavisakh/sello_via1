import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/navbar.dart';

class AddtoCart extends StatefulWidget {
  const AddtoCart({super.key});

  @override
  State<AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: Bottomnav("Pay now"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Topbar("My Orders"),
              const SizedBox(
                height: 30,
              ),



              Container(
                width: 320,
                height: 110,
                decoration: ShapeDecoration(
                  color: Color(0xFFD4E4E6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: Padding(
                  padding:  EdgeInsets.all(15.0),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 78,
                            width: 78,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(13),
                              child: Image.asset("", fit: BoxFit.fill),
                            ),
                          ),
                          const SizedBox(width: 14),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("maintext!", style: TextStyle(
                                  color: Color(0xFF5E5E5E),
                                  fontSize: 15,
                                  fontFamily: 'Fira Sans',
                                  fontWeight: FontWeight.w500,
                                )),

                                SizedBox(height: 4),
                                Text("₹ pricetext!", style: TextStyle(
                                  color: Color(0xFF5E5E5E),
                                  fontSize: 13,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.w500,
                                )),
                                SizedBox(
                                  height: 8,
                                ),

                                Row(
                                  children: [
                                    Icon(Icons.delete,size: 15,color: Color(0xFF5E5E5E) ,),
                                    Text("Delete",style: TextStyle(
                                      color: Color(0xFF5E5E5E),
                                      fontSize: 13,
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.w500),),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                              GestureDetector(
                                onTap: decrementQuantity,
                                child: Container(

                                  height: 30,
                                  width: 30,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF85A0A2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text("-", style: TextStyle(color: Color(0xFF343C3D))),
                                  ),
                                ),
                              ),
                              Container(

                                height: 30,
                                width: 30,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFD4E4E6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: Text(quantity.toString(), style: TextStyle(color: Color(0xFF343C3D))),
                                ),
                              ),
                              GestureDetector(
                                onTap: incrementQuantity,
                                child: Container(

                                  height: 30,
                                  width: 30,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF85A0A2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text("+", style: TextStyle(color: Color(
                                        0xFF343C3D))),
                                  ),
                                ),
                              ),
                            ],
                          )



                        ],
                      ),






                    ],
                  ),

                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(20),

                decoration: ShapeDecoration(

                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Price details(5 Item)",style:
                    TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text("Total Product price:",style:TextStyle(
                          color: Color(0xFF5E5E5E),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),),
                        Text("₹ 24,999",style:TextStyle(
                          color: Color(0xFF5E5E5E),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Shipping fee:",style:TextStyle(
                          color: Color(0xFF5E5E5E),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),),
                        Text("₹ 150",style:const  TextStyle(
                          color: Color(0xFF5E5E5E),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total:",style:const  TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text("₹ 25,149",style:const  TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),

                  ],
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}

