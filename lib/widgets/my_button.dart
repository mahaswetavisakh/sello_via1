import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  String? textTitle;
  Function? onClick;
  Color? buttonColor;
  MyButton({this.textTitle,this.onClick,this.buttonColor});
  @override
  Widget build(BuildContext context) {
    print("buttonColor=$buttonColor");
    return  ElevatedButton(
      style:ElevatedButton.styleFrom(
          backgroundColor:buttonColor,
      ),
      onPressed:(){
        if(onClick!=null){
          onClick!();
        }
      },
      child: Text(textTitle!,
        style: TextStyle(
            color: Colors.white
        ),),
    );
  }

}