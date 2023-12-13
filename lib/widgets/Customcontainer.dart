
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//Search container
class Search extends StatelessWidget{
  String? title;
  Search(String titletext) {
    title = titletext;
  }
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:20,right: 20,top:10,bottom:10),
      height:40,
      width: 310,

      decoration: ShapeDecoration(

        color: Color(0xFFE0E0E1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title!,  style:
          TextStyle(fontWeight: FontWeight.w500,color: Color(0xFF5E5E5E),fontSize:15)),

          Icon(Icons.search,size: 20,color: Color(0xFF5E5E5E),),
        ],
      )
    );
  }
}

