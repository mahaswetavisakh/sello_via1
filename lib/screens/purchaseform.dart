import 'package:flutter/material.dart';
import 'package:sello_via/widgets/Custombuttons.dart';
import 'package:sello_via/widgets/navbar.dart';

class Purchaseform extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: Bottomnav("Proceed to payment"),
      body: Padding(
        padding: const EdgeInsets.only(left:30,right: 30,bottom: 40,top: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Topbarlogin(),
            const SizedBox(
              height: 30,
            ),
            PurchaseButtons("assets/img_3.png","Shure podcast microphone", "Shure","2020","24,999"),
            SizedBox(
              height: 30,
            ),
           
            Container(
              width: 300,
              height: 160,
              padding: EdgeInsets.all(20),

              decoration: ShapeDecoration(

                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text("Shipping address",style:
                     TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Text("Alice Eve\n""2074,Half and Half Drive\n""Hialeah, Florida-33012\n""Ph:+1 561-230-0033",
                            style:TextStyle(
                            color: Color(0xFF5E5E5E),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),),
                        ],
                      ),

                    ],

                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(

                        height: 25,
                        width:25,
                        decoration: ShapeDecoration(
                          color: Color(0xFFE5E3E3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Icon(Icons.edit_square,color: Colors.white,size: 16,),
                      ),
                    ],
                  ),
                ],
              ),

            ),



            SizedBox(
              height: 30,
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
                  Text("Invoice details",style:
                  TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text("Product cost:",style:TextStyle(
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
    );
  }
}