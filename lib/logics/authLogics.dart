import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sello_via/appConts/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/userModel.dart';
import 'cloud_storage_logic.dart';

class AuthLogics{

  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _db=FirebaseFirestore.instance;
  UserModel? user;


  login({required String email,required String password,
    required BuildContext context}){
    _auth.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((UserCredential credential) {
      
      _db.collection("users").doc(credential.user!.uid).get()
          .then((value) async {
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

      await _db.collection("users").doc(_auth.currentUser!.uid).set(
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
    await _db.collection("users").doc(user!.userUID).update(user!.toMap());
     updateDataFromLocal();
  }

  Future updateUserPhoneNumber(String phoneNumber) async {
    user!.userPhoneNumber=phoneNumber;
    await _db.collection("users").doc(user!.userUID).update(user!.toMap());
    updateDataFromLocal();
  }

  Future updateUserAddress(String userAddress) async {
    user!.userAddress=userAddress;
    await _db.collection("users").doc(user!.userUID).update(user!.toMap());
    updateDataFromLocal();
  }

  Future updateUserProfile(String url) async {
    user!.userprofileUrl=url;
    _db.collection("users").doc(user!.userUID).update(user!.toMap());
    updateDataFromLocal();
  }

  updateDataFromLocal() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setString("user", jsonEncode(user!.toMap()));
  }
}