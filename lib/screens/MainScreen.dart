import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sello_via/screens/explore.dart';
import '../widgets/navbar.dart';
import 'AddProduct.dart';
import 'home.dart';
import 'likeditem.dart';
import 'messages.dart';

class MainScreen extends StatefulWidget{
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> _screens=[
    Home(),
    Explore(),
    AddProduct(),
    LikedItem(),
    Messages()
  ];

  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Bottomnavwithicons(
        onClick: (index){
          print(index);
          currentIndex=index;
          setState(() {

          });
        },
      ),
       body:_screens[currentIndex] ,
    );
  }
}