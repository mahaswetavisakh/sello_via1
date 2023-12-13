import 'package:flutter/material.dart';
import 'package:sello_via/widgets/Custombuttons.dart';
import 'package:sello_via/widgets/navbar.dart';

class Payment extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: Bottomnav("Pay now"),
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
                  Text("Shure podcast microphone",style:
                  TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Text("Make: ",style:TextStyle(
                        color: Color(0xFF5E5E5E),
                        fontSize: 13,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w400,
                      ),),
                      Text("Shure",style:TextStyle(
                        color: Color(0xFF5E5E5E),
                        fontSize: 15,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w500,
                      ),),
                      Text("| Year: ",style:const  TextStyle(
                        color: Color(0xFF5E5E5E),
                        fontSize: 13,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w400,
                      ),),
                      Text("2020",style:const  TextStyle(
                        color: Color(0xFF5E5E5E),
                        fontSize: 15,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w500,
                      ),),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Payment details",style:
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
            SizedBox(
              height: 20,
            ),
            Text("Select Card",style:const  TextStyle(
              color: Color(0xFF1C1C1C),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text("Enter CVV:",style:TextStyle(
                  color: Color(0xFF1C1C1C),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
                Container(
                  padding: EdgeInsets.all(5),
                  height:30,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(

                    color: Color(0xFFE0E0E1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: Text("C V V"),
                )
              ],
            ),


          ],
        ),
      ),
    );
  }
}