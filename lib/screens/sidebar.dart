import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sello_via/logics/authLogics.dart';
import 'package:sello_via/widgets/Custombuttons.dart';

import '../appConts/routes.dart';

class SideBar extends StatelessWidget{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Account> account = [

    Account(
      icon:Icons.person_2_outlined,
      maintext: "My Account",
      childtext: "Edit your details,account settings",
    ),
    Account(
      icon:Icons.local_mall_outlined,
      maintext: "My Orders",
      childtext: "View all your orders",
    ),
    Account(
      icon:Icons.list_outlined,
      maintext: "My Listings",
      childtext: "View your product listing for sale",
    ),
    Account(
      icon:Icons.favorite_outline,
      maintext: "Liked Items",
      childtext: "See the products you have wishlisted",
    ),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
      Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/bottom-img.png'),
          Positioned(
            bottom:15,
            child: Text("SelloVia Version 1.0",style: TextStyle(color: Colors.white),),),
        ],
      ),
      body: ListView(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("SelloVia", style: TextStyle(fontWeight: FontWeight.bold,fontSize:25)),

                ],
              ),
            ),
          ),

          SizedBox(
            height:430,
            child: ListView.builder(

              itemCount: account.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Navigator.pushNamed(context, Routes.profileRoute);
                        break;
                      case 1:
                        Navigator.pushNamed(context, Routes.orderRoute);
                        break;
                      case 2:
                        Navigator.pushNamed(context, Routes.listingRoute);
                        break;
                      case 3:
                        Navigator.pushNamed(context, Routes.likedItemRoute);
                        break;
                      default:
                        break;
                    }// Add other conditions for different sections if needed
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20,right: 20,bottom:9),
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
                          Icon(account[index].icon, size: 50,color:Color(0xFF5E5E5E) ,),
                          const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${account[index].maintext}",style:const  TextStyle(
                                color: Color(0xFF5E5E5E),
                                fontSize: 18,
                                fontFamily: 'Fira Sans',
                                fontWeight: FontWeight.w500,
                              ),),
                              Text("${account[index].childtext}",style: const TextStyle(
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

                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 145,
                    height: 44,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: Color(0xFF3C3C3C)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child:const Center(
                      child: Text('Feedback',
                        style: TextStyle(
                          color: Color(0xFF3C3C3C),
                          fontSize: 18,
                          fontFamily: 'Fira Sans',
                          fontWeight: FontWeight.w500,
                        ),),
                    ),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: (){

                        _auth.signOut();
                        AuthLogics auth=Get.put(AuthLogics());
                        auth.logOut();
                        Navigator.pushNamed(context, Routes.loginRoute);

                    },
                    child: Container(
                      width: 145,
                      height: 44,
                      decoration: ShapeDecoration(
                        color: Color(0xFF3C3C3C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Center(
                        child: Text('Sign out',
                          style: TextStyle(
                            color: Color(0xFFF5F5F5),
                            fontSize: 18,
                            fontFamily: 'Fira Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),),
                      ),
                    ),
                  )

                ],
          ),

        ],
      ),
    );
  }
}
class Account {



  String? maintext;
  String? childtext;
  IconData? icon;

  Account({this.maintext,this.childtext, this.icon, });
}