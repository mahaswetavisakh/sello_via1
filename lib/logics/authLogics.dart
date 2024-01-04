import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sello_via/appConts/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../appConts/collectionName.dart';
import '../models/userModel.dart';
import 'cloud_storage_logic.dart';

class AuthLogics extends GetxController{

  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore database=FirebaseFirestore.instance;
  UserModel? user;



  Future<void> logOut() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    await preferences.remove("user");
  }
  login({required String email,required String password,
    required BuildContext context}){
    _auth.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((UserCredential credential) {
      
      database.collection("users").doc(credential.user!.uid).get()
          .then((value) async {
            // TODO: add condition for value is no null
            print("DATA Of USER==${value.data()}");
            user=UserModel.getDataFromMap(value.data());
            SharedPreferences preferences=await SharedPreferences.getInstance();
            preferences.setString("user", jsonEncode(user!.toMap()));
      });
       Navigator.pushNamed(context, Routes.homeRoute);
    }).onError((FirebaseAuthException error, stackTrace) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message!))
      );
    });
  }

  register({required String email,required String password,required String name,required BuildContext context}){
    _auth.createUserWithEmailAndPassword(
        email:email,
        password: password
    ).then((UserCredential userCredential) async {


      user=UserModel(
        userName: name,
        userEmail: email,
        userPassword: password,
        userUID: userCredential.user!.uid
      );

      SharedPreferences preferences=await SharedPreferences.getInstance();
      preferences.setString("user", jsonEncode(user!.toMap()));

      await database.collection(CollectionNames.userCollectionName).doc(_auth.currentUser!.uid).set(
          user!.toMap()
      );

      Navigator.pushNamed(context, Routes.homeRoute);
    }).onError((FirebaseAuthException error, stackTrace) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message!))
      );
    });
  }



 Future getUserData() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    String? userStringData= preferences.getString("user");
    print("userStringData==${userStringData}");
    var userMapData=jsonDecode(userStringData!);
    user=UserModel.getDataFromMap(userMapData);
  }


  Future updateUserName(String name) async {
     user!.userName=name;
    await database.collection(CollectionNames.userCollectionName).doc(user!.userUID).update(user!.toMap());
     updateDataFromLocal();
  }

  Future updateUserPhoneNumber(String phoneNumber) async {
    user!.userPhoneNumber=phoneNumber;
    await database.collection("users").doc(user!.userUID).update(user!.toMap());
    updateDataFromLocal();
  }

  Future updateUserAddress(String userAddress) async {
    user!.userAddress=userAddress;
    await database.collection(CollectionNames.userCollectionName).doc(user!.userUID).update(user!.toMap());
    updateDataFromLocal();
  }

  Future updateUserProfile(String url) async {
    user!.userprofileUrl=url;
    database.collection("users").doc(user!.userUID).update(user!.toMap());
    updateDataFromLocal();
    print("UserData==${user!.userprofileUrl}");
    update();
  }

  updateDataFromLocal() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setString("user", jsonEncode(user!.toMap()));
  }
}