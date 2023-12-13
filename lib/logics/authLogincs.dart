import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sello_via/appConts/routes.dart';

class AuthLogics{

  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _db=FirebaseFirestore.instance;


  login({required String email,required String password,required BuildContext context}){
    _auth.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((UserCredential credential) {
      Navigator.pushNamed(context, Routes.profileRoute);
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
      await userCredential.user!.updateDisplayName(name);
      updateUser(
        name: name,
        email: email,
        password: password,
        profileUrl: "",
        phoneNumber: "",
        address: ""
      );
      Navigator.pushNamed(context, Routes.profileRoute);
    }).onError((FirebaseAuthException error, stackTrace) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message!))
      );
    });
  }

  updateUser({
     String? name,
    String? profileUrl,
     String? email,
     String? phoneNumber,
     String? address,
     String? password,
    bool isUpdate=false
  }) async {

    if(isUpdate){
      await _db.collection("users").doc(_auth.currentUser!.uid).update(
          {
            "name":name,
            "profileUrl":profileUrl,
            "phoneNumber":phoneNumber,
            "address":address,
          }
      );
    }else{
      await _db.collection("users").doc(_auth.currentUser!.uid).set(
          {
            "uid":_auth.currentUser!.uid,
            "name":name,
            "profileUrl":profileUrl,
            "email":email,
            "phoneNumber":phoneNumber,
            "address":address,
            "password":password,
          }
      );
    }

  }
}