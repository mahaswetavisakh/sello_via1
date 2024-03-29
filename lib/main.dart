import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sello_via/appConts/routes.dart';
import 'package:sello_via/screens/add_to_cart.dart';
import 'package:sello_via/screens/edit_product.dart';
import 'package:sello_via/screens/explore.dart';
import 'package:sello_via/screens/mainscreen.dart';
import 'package:sello_via/screens/message_room.dart';
import 'package:sello_via/screens/orderconfirmation.dart';
import 'package:sello_via/screens/payment.dart';
import 'package:sello_via/screens/product_detais.dart';
import 'package:sello_via/screens/purchaseform.dart';
import 'package:sello_via/screens/splash_screen.dart';
import 'package:sello_via/screens/login.dart';
import 'package:sello_via/screens/profile_page.dart';
import 'package:sello_via/screens/likeditem.dart';
import 'package:sello_via/screens/listing.dart';
import 'package:sello_via/screens/orders.dart';
import 'package:sello_via/screens/register_screen.dart';
import 'package:sello_via/screens/sidebar.dart';


import 'logics/authLogics.dart';
import 'logics/category_logics.dart';

void main()async{
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthLogics()); //changed
  runApp(
      GetMaterialApp(
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
            Routes.product_detailsRoute:(context)=>Productdetails(),
            Routes.add_to_cartRoute:(context)=>AddtoCart(),
            Routes.purchaseformRoute:(context)=>Purchaseform(),
            Routes.paymentRoute:(context)=>Payment(),
            Routes.orderconfirmationRoute:(context)=>Orderconfirmation(),
            Routes.message_roomRoute:(context)=>MessageRoom(),
            Routes.edit_productRoute:(context)=>EditProduct(),
            Routes.exploreRoute:(context)=>Explore(),

        },

        debugShowCheckedModeBanner: false,
        onInit: (){
            AuthLogics _auth=Get.put(AuthLogics());
            CategoryLogics categoryLogics=Get.put(CategoryLogics());
            categoryLogics.getCategoriesFromDb();
            _auth.getUserData();
        },

          )
  );
}