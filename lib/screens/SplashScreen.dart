import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sello_via/screens/Login.dart';
import 'package:sello_via/screens/Profilepage.dart';

import '../appConts/const.dart';
import '../appConts/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    print("Waiting for Navigation");
    Future.delayed(const Duration(seconds: 3)).then((value) {
      print("Navigate to Login Screen");
      if(_auth.currentUser==null){
        Navigator.pushNamed(context, Routes.loginRoute);

      }else{
        Navigator.pushNamed(context, Routes.profileRoute);
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Const.ScreenBg,
        child:  const Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 80,
            child: Text(
              "SelloVia",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}