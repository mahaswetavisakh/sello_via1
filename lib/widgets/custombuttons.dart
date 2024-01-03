import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




// Login Social media SignIn
class LoginWithSocial extends StatelessWidget{
String? ImagePath;
  LoginWithSocial(String path){
    ImagePath=path;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height:50,
      width: 100,
      padding: EdgeInsets.only(left:10,right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFE1E1E1),

      ),
      child:Image.asset(ImagePath!),
    );
  }
}

//Sidebar Custom widget buttons
class SidebarButtons extends StatelessWidget{
  String? maintext, childtext;
  SidebarButtons(String main, child){
    maintext=main;
    childtext=child;
  }
  @override
  Widget build(BuildContext context) {
   return Container(
     width: 315,
     height: 88,
     decoration: ShapeDecoration(
       color: Color(0xFFD4E4E6),
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(22),
       ),
     ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
           children: [
             Icon(Icons.manage_accounts_outlined, size: 50,color:Color(0xFF5E5E5E) ,),
             const SizedBox(width: 10,),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(maintext!,style:const  TextStyle(
                   color: Color(0xFF5E5E5E),
                   fontSize: 24,
                   fontFamily: 'Fira Sans',
                   fontWeight: FontWeight.w500,
                 ),),
                 Text(childtext!,style: const TextStyle(
                   color: Color(0xFF5E5E5E),
                   fontSize: 13,
                   fontFamily: 'Arial',
                   fontWeight: FontWeight.w400,
                 ),)
               ],
             )
           ],
         ),
      ),
      //doubt need little bit left
   );
  }
}

//Listing

class ListingButtons extends StatelessWidget{
  String? image, maintext, viewstext,pricetext,datetext;
  ListingButtons(String img, main, views,price,date){
    image=img;
    maintext=main;
    viewstext=views;
    pricetext=price;
    datetext=date;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
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
              height: 65,
              width: 65,

              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.asset(image!,fit: BoxFit.fill,),
              ),
            ),
            const SizedBox(width: 14,),
            Container(
              width: 165,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(maintext!,style:const  TextStyle(
                    color: Color(0xFF5E5E5E),
                    fontSize: 15,
                    fontFamily: 'Fira Sans',
                    fontWeight: FontWeight.w500,
                  ),),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Text("Views: ",style:TextStyle(
                        color: Color(0xCB5E5E5E),
                        fontSize: 15,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w500,
                      ),),
                      Text(viewstext!,style:const  TextStyle(
                        color: Color(0xCB5E5E5E),
                        fontSize: 15,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w500,
                      ),),
                    ],
                  ),

                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text("₹ ",style: const TextStyle(
                        color: Color(0xFF527B96),
                        fontSize: 13,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w500,
                      ),),
                      Text(pricetext!,style: const TextStyle(
                        color: Color(0xFF527B96),
                        fontSize: 13,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w500,
                      ),),
                      SizedBox(
                        width: 20,
                      ),
                      Text(datetext!,style: const TextStyle(
                        color: Color(0xCCC9197D),
                        fontSize: 13,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w500,
                      ),),
                    ],
                  ),



                ],
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Container(
                  height: 25,
                  width:25,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Icon(Icons.visibility_off_outlined,color: Colors.black,size: 16,),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
class ListingwithmailButtons extends StatelessWidget{
  String? image, maintext, viewstext,mailtext,pricetext,datetext;

  ListingwithmailButtons(String img, main, views,mail,price,date){
    image=img;
    maintext=main;
    viewstext=views;
    mailtext=mail;
    pricetext=price;
    datetext=date;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
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
              height: 65,
              width: 65,

              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.asset(image!,fit: BoxFit.fill,),
              ),
            ),
            const SizedBox(width: 14,),
            Container(
              width: 165,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(maintext!,style:const  TextStyle(
                    color: Color(0xFF5E5E5E),
                    fontSize: 15,
                    fontFamily: 'Fira Sans',
                    fontWeight: FontWeight.w500,
                  ),),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text("Views: ",style:const  TextStyle(
                        color: Color(0xCB5E5E5E),
                        fontSize: 15,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w500,
                      ),),
                      Text(viewstext!,style:const  TextStyle(
                        color: Color(0xCB5E5E5E),
                        fontSize: 15,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w500,
                      ),),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 20,
                        width:50,

                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.mail_outline_outlined,color: Colors.black,size: 15,),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(mailtext!),
                          ],
                        )

                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Text("₹",style: TextStyle(
                        color: Color(0xFF527B96),
                        fontSize: 13,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w500,
                      ),),
                      Text(pricetext!,style: const TextStyle(
                        color: Color(0xFF527B96),
                        fontSize: 13,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w500,
                      ),),
                      SizedBox(
                        width: 20,
                      ),
                      Text(datetext!,style: const TextStyle(
                        color: Color(0xCCC9197D),
                        fontSize: 13,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w500,
                      ),),
                    ],
                  ),



                ],
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Container(
                  height: 25,
                  width:25,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Icon(Icons.visibility_off_outlined,color: Colors.black,size: 16,),
                ),
              ],
            ),

          ],
        ),
      ),
      //doubt need little bit left
    );
  }
}
class ListingvisibleButtons extends StatelessWidget{
  String? image, maintext, viewstext,pricetext,datetext;
  ListingvisibleButtons(String img, main, views,price,date){
    image=img;
    maintext=main;
    viewstext=views;
    pricetext=price;
    datetext=date;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,

      decoration: ShapeDecoration(

        color: Color(0xFDC9C7C4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              height: 65,
              width: 65,

              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.asset(image!,fit: BoxFit.fill,),
              ),
            ),
            const SizedBox(width: 14,),
            Container(
              width: 165,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(maintext!,style:const  TextStyle(
                    color: Color(0xFF5E5E5E),
                    fontSize: 15,
                    fontFamily: 'Fira Sans',
                    fontWeight: FontWeight.w500,
                  ),),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Text("Views: ",style:TextStyle(
                        color: Color(0xCB5E5E5E),
                        fontSize: 15,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w500,
                      ),),
                      Text(viewstext!,style:const  TextStyle(
                        color: Color(0xCB5E5E5E),
                        fontSize: 15,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w500,
                      ),),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Hidden",style:const  TextStyle(
                        color: Color(0xCB5E5E5E),
                        fontSize: 15,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w500,
                      ),),
                    ],
                  ),

                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text("₹ ",style: const TextStyle(
                        color: Color(0xFF527B96),
                        fontSize: 13,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w500,
                      ),),
                      Text(pricetext!,style: const TextStyle(
                        color: Color(0xFF527B96),
                        fontSize: 13,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w500,
                      ),),
                      SizedBox(
                        width: 20,
                      ),
                      Text(datetext!,style: const TextStyle(
                        color: Color(0xCCC9197D),
                        fontSize: 13,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w500,
                      ),),
                    ],
                  ),



                ],
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Container(
                  height: 25,
                  width:25,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Icon(Icons.visibility_outlined,color: Colors.black,size: 16,),
                ),
              ],
            ),

          ],
        ),
      ),
      //doubt need little bit left
    );
  }
}
class ListingsoldButtons extends StatelessWidget{
  String? image, maintext, viewstext,pricetext,datetext;
  ListingsoldButtons(String img, main, views,price,date){
    image=img;
    maintext=main;
    viewstext=views;
    pricetext=price;
    datetext=date;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,

      decoration: ShapeDecoration(

        color: Color(0xFDBAE1C3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              height: 65,
              width: 65,

              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.asset(image!,fit: BoxFit.fill,),
              ),
            ),
            const SizedBox(width: 14,),
            Container(
              width: 165,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(maintext!,style:const  TextStyle(
                    color: Color(0xFF5E5E5E),
                    fontSize: 15,
                    fontFamily: 'Fira Sans',
                    fontWeight: FontWeight.w500,
                  ),),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Text("Views: ",style:TextStyle(
                        color: Color(0xCB5E5E5E),
                        fontSize: 15,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w500,
                      ),),
                      Text(viewstext!,style:const  TextStyle(
                        color: Color(0xCB5E5E5E),
                        fontSize: 15,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w500,
                      ),),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Sold",style:const  TextStyle(
                        color: Color(0xFF2E8835),
                        fontSize: 15,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w500,
                      ),),
                    ],
                  ),

                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Text("₹ ",style: TextStyle(
                        color: Color(0xFF2E8835),
                        fontSize: 13,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w500,
                      ),),
                      Text(pricetext!,style: const TextStyle(
                        color: Color(0xFF2E8835),
                        fontSize: 13,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w500,
                      ),),
                      SizedBox(
                        width: 20,
                      ),
                      Text(datetext!,style: const TextStyle(
                        color: Color(0xCC486B46),
                        fontSize: 13,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w500,
                      ),),
                    ],
                  ),



                ],
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Container(
                  height: 25,
                  width:25,
                  decoration: ShapeDecoration(
                    color: Color(0xFF2E8835),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Icon(Icons.done,color: Colors.white,size: 18,),
                ),
              ],
            ),

          ],
        ),
      ),
      //doubt need little bit left
    );
  }
}
class OrderButtons extends StatelessWidget{
  String? image, maintext, datetext,pricetext;
  OrderButtons(String img, main, date,price){
    image=img;
    maintext=main;
    datetext=date;
    pricetext=price;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
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
              child: Image.asset(image!, fit: BoxFit.fill),
            ),
          ),
          const SizedBox(width: 14),
        Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(maintext!, style: const TextStyle(
              color: Color(0xFF5E5E5E),
              fontSize: 15,
              fontFamily: 'Fira Sans',
              fontWeight: FontWeight.w500,
            )),
            const SizedBox(height: 4),
            Text(datetext!, style: const TextStyle(
              color: Color(0xCB5E5E5E),
              fontSize: 15,
              fontFamily: 'Fira Sans',
              fontWeight: FontWeight.w500,
            )),
            SizedBox(height: 4),
            Row(
              children: [
                const Text("₹", style: TextStyle(
                  color: Color(0xFF5E5E5E),
                  fontSize: 13,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.w500,
                )),
                Text(pricetext!, style: const TextStyle(
                  color: Color(0xFF5E5E5E),
                  fontSize: 13,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.w500,
                )),
              ],
            ),
          ],
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Container(

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
        ],
      )



      ],
    ),






    ],
            ),

        ),
      );


  }
}
class OrderratedButtons extends StatelessWidget{
  String? image, maintext, datetext,pricetext;
  OrderratedButtons(String img, main, date,price){
    image=img;
    maintext=main;
    datetext=date;
    pricetext=price;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
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
                    child: Image.asset(image!, fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(maintext!, style: const TextStyle(
                        color: Color(0xFF5E5E5E),
                        fontSize: 15,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w500,
                      )),
                      const SizedBox(height: 4),
                      Text(datetext!, style: const TextStyle(
                        color: Color(0xCB5E5E5E),
                        fontSize: 15,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w500,
                      )),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          const Text("₹", style: TextStyle(
                            color: Color(0xFF5E5E5E),
                            fontSize: 13,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w500,
                          )),
                          Text(pricetext!, style: const TextStyle(
                            color: Color(0xFF5E5E5E),
                            fontSize: 13,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w500,
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Row(

                      children: [
                        Text("You rated 5"),
                        Icon(Icons.star,color: Colors.amber,size: 18,),
                      ],
                    ),
                  ],
                ),



              ],
            ),
          ],
        ),

      ),
    );
  }
}
class OrderconfirmButtons extends StatelessWidget{
  String? image, maintext, trackingidtext,orderidtext;
  OrderconfirmButtons(String img, main, trackingid,orderid){
    image=img;
    maintext=main;
    trackingidtext=trackingid;
    orderidtext=orderid;

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,

      decoration: ShapeDecoration(

        color: Color(0xFDBAE1C3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              height: 65,
              width: 65,

              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.asset(image!,fit: BoxFit.fill,),
              ),
            ),
            const SizedBox(width: 14,),
            Container(
              width: 165,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(maintext!,style:const  TextStyle(
                    color: Color(0xFF2A2927),
                    fontSize: 15,
                    fontFamily: 'Fira Sans',
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(
                    height: 4,
                  ),

                  Row(
                    children: [
                      Text("Tracking ID: ",style:const  TextStyle(
                        color: Color(0xCB5E5E5E),
                        fontSize: 13,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w500,
                      ),),
                      Text(trackingidtext!,style:const  TextStyle(
                        color: Color(0xCB5E5E5E),
                        fontSize: 13,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w500,
                      ),),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Order ID: ",style:const  TextStyle(
                        color: Color(0xCB5E5E5E),
                        fontSize: 13,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w500,
                      ),),
                      Text(orderidtext!,style:const  TextStyle(
                        color: Color(0xCB5E5E5E),
                        fontSize: 13,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w500,
                      ),),
                    ],
                  ),



                ],
              ),
            ),



          ],
        ),
      ),
      //doubt need little bit left
    );
  }
}
class PurchaseButtons extends StatelessWidget{
  String? image, maintext, maketext,yeartext,pricetext;
  PurchaseButtons(String img, main, make,year,price){
    image=img;
    maintext=main;
    maketext=make;
    yeartext=year;
    pricetext=price;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 110,
      decoration: ShapeDecoration(
        color: Color(0xFFC0D7DA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,

              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.asset(image!,fit: BoxFit.fill,),
              ),
            ),
            const SizedBox(width: 14,),
            Container(
              width: 165,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(maintext!,style:const  TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Fira Sans',
                    fontWeight: FontWeight.w500,
                  ),),
                  SizedBox(
                    height: 4,
                  ),
                   Row(
                    children: [
                      Text("Make: ",style:TextStyle(
                        color: Color(0xFF5E5E5E),
                        fontSize: 13,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w400,
                      ),),
                      Text(maketext!,style:TextStyle(
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
                      Text(yeartext!,style:const  TextStyle(
                        color: Color(0xFF5E5E5E),
                        fontSize: 15,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w500,
                      ),),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text("₹",style: const TextStyle(
                        color: Color(0xFF527B96),
                        fontSize: 15,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w500,
                      ),),
                      Text(pricetext!,style: const TextStyle(
                        color: Color(0xFF527B96),
                        fontSize: 15,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w500,
                      ),)
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
