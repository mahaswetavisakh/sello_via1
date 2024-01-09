import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sello_via/appConts/routes.dart';
import 'package:sello_via/screens/mainscreen.dart';
import 'package:sello_via/screens/splash_screen.dart';
import 'package:sello_via/screens/login.dart';
import 'package:sello_via/screens/Profilepage.dart';
import 'package:sello_via/screens/likeditem.dart';
import 'package:sello_via/screens/listing.dart';
import 'package:sello_via/screens/orders.dart';
import 'package:sello_via/screens/registerScreen.dart';
import 'package:sello_via/screens/sidebar.dart';

import 'logics/authLogics.dart';

void main()async{
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthLogics()); //changed
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
            Routes.orderRoute:(context)=>Orders(),
            Routes.listingRoute:(context)=>Listing(),
            Routes.likedItemRoute:(context)=>LikedItem(),
        },
//home:Myaccount(),
        debugShowCheckedModeBanner: false,

          )
  );
}