import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../appConts/const.dart';

class CustomButton extends StatelessWidget{
  CustomButton({this.buttonText,this.onTap});
  final String? buttonText;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return   Container(
      height:50,
      width: 500,
      padding: const EdgeInsets.only(left:10,right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient:  Const.ButtonColour,

      ),

      child: TextButton(
        onPressed:(){
          onTap!();
        },
        child:  Text(buttonText!,style: TextStyle(color: Colors.white, fontSize: 17,),),
      ),
    );
  }

}