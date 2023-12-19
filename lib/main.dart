import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sello_via/appConts/routes.dart';
import 'package:sello_via/screens/MainScreen.dart';
import 'package:sello_via/screens/SplashScreen.dart';
import 'package:sello_via/screens/Login.dart';
import 'package:sello_via/screens/Profilepage.dart';
import 'package:sello_via/screens/listing.dart';
import 'package:sello_via/screens/registerScreen.dart';
import 'package:sello_via/screens/sidebar.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MaterialApp(
          initialRoute:Routes.splashRoute,
          routes: {
            Routes.splashRoute:(context)=>SplashScreen(),
            Routes.loginRoute:(context)=>LogInscreen(),
            Routes.profileRoute:(context)=>Profilepage(),
            Routes.registerRoute:(context)=>RegisterScreen(),
            Routes.homeRoute:(context)=>MainScreen(),
            Routes.sidebarRoute:(context)=>SideBar(),
        },
//home:Listing(),
        debugShowCheckedModeBanner: false,

          )
  );
}