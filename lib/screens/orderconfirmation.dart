import 'package:flutter/material.dart';
import 'package:sello_via/widgets/Custombuttons.dart';
import 'package:sello_via/widgets/navbar.dart';

class Orderconfirmation extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
bottomNavigationBar: Bottomnav("Go to home"),
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
            Text("Order confirmed",style: TextStyle(  color: Colors.black,
              fontSize: 20,
              fontFamily: 'Fira Sans',
              fontWeight: FontWeight.w500,),),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(20),

              alignment: Alignment.center,
              decoration: ShapeDecoration(

                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 45,
                    width:45,
                    decoration: ShapeDecoration(
                      color: Color(0xFF2E8835),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Icon(Icons.done,color: Colors.white,size: 37,),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Text("Your payment for",style:TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'Fira Sans',
                    fontWeight: FontWeight.w500,
                  ),),
                  Text("₹ 344",style:const  TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'Fira Sans',
                    fontWeight: FontWeight.w500,
                  ),),
                  const Text("is succesfull",style:TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'Fira Sans',
                    fontWeight: FontWeight.w500,
                  ),),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OrderconfirmButtons("assets/img_3.png","Shure podcast microphone", "98577554","8665563666755"),

          ],
        ),
      ),
    );
  }
}