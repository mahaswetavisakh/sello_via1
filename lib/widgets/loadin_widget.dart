


import 'package:flutter/material.dart';

void showLoading(BuildContext context){
  showDialog(
      context: context,
      builder: (context){
        return Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,

            ),
            child: const Row(
              children: [

                CircularProgressIndicator(
                    valueColor:  AlwaysStoppedAnimation<Color>(Colors.red)
                ),

                SizedBox(
                  width: 15,
                ),
                Text("Loading...."
                  ,style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      decoration: TextDecoration.none
                  ),),
              ],
            ),
          ),
        );
      });
}