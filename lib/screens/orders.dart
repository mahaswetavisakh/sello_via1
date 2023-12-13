import 'package:flutter/material.dart';
import 'package:sello_via/widgets/Custombuttons.dart';
import 'package:sello_via/widgets/navbar.dart';

class Orders extends StatelessWidget{
  List<Order> orders = [
    Order(
      image: "assets/img.png",
      maintext: "Apple AirPods Pro",
      datetext: "09/06/2020",
      pricetext: "30,999",

    ),
    Order(
      image: "assets/img_1.png",
      maintext: "PlayStation Controller",
      datetext: "19/06/2020",
      pricetext: "35,999",

    ),
    Order(
      image: "assets/img_2.png",
      maintext: "Apple AirPods Pro",
      datetext: "23/06/2020",
      pricetext: "38,999",

    ),
    Order(
      image: "assets/img_3.png",
      maintext: "Wildcraft Ranger Tent",
      datetext: "09/06/2010",
      pricetext: "30,339",

    ),
    Order(
      image: "assets/img_3.png",
      maintext: "Wildcraft Ranger Tent",
      datetext: "09/06/2010",
      pricetext: "30,339",

    ),
    Order(
      image: "assets/img_3.png",
      maintext: "Wildcraft Ranger Tent",
      datetext: "09/06/2010",
      pricetext: "30,339",

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: Bottomnavwithicons(),

      body: Padding(
        padding: const EdgeInsets.only(left:20,right: 20,bottom: 40,top: 70),
        child: Column(
          children: [
            Topbar("My Orders"),
            SizedBox(
              height: 5,
            ),

            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        width: 300,
                        height: 100,
                        decoration: ShapeDecoration(
                          color: Color(0xFFD4E4E6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Container(
                                height: 75,
                                width: 75,

                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(13),
                                  child: Image.asset("${orders[index].image}",fit: BoxFit.fill,),
                                ),
                              ),
                              const SizedBox(width: 14,),
                              Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text("${orders[index].maintext}",style:const  TextStyle(
                                    color: Color(0xFF5E5E5E),
                                    fontSize: 15,
                                    fontFamily: 'Fira Sans',
                                    fontWeight: FontWeight.w500,
                                  ),),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text("${orders[index].datetext}",style:const  TextStyle(
                                    color: Color(0xCB5E5E5E),
                                    fontSize: 15,
                                    fontFamily: 'Fira Sans',
                                    fontWeight: FontWeight.w400,
                                  ),),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text("₹ ${orders[index].pricetext}",style: const TextStyle(
                                    color: Color(0xFF5E5E5E),
                                    fontSize: 13,
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.bold,
                                  ),),

                                ],
                              ),




                            ],
                          ),
                        ),


                      ),
                      Positioned(
                        bottom:20,
                        right: 20,
                        child: Container(

                          height: 25,
                          width: 75,
                          decoration: ShapeDecoration(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: Center(
                            child: Text("Rate now", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Order {

  String? image;
  String? maintext;
  String? datetext;
  String? pricetext;
  Order({this.image, this.maintext,this.datetext, this.pricetext});
}