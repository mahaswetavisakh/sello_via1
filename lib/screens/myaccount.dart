import 'package:flutter/material.dart';

class Myaccount extends StatelessWidget{
  List<User> users = [
    User(
      heading:"Name",
      userdetails:"Alice",
    ),
    User(
      heading:"Name",
      userdetails:"Alice",
    ),
    User(
      heading:"Name",
      userdetails:"Alice",
    ),
    User(
      heading:"Name",
      userdetails:"Alice",
    ),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///Author:Mahasweta

      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40, top: 50),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [


            const Row(


              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 32,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("https://4ec5a3ca-a-258b6f3f-s-sites.googlegroups.com/a/goodmen.info/workcanada/assistants/female_generic_profile.png"),
                      radius: 28,
                    ),
                  )  ,
                ),

                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(alignment: Alignment.centerLeft,),
                    Text("Alice Eve",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 20),),
                    Text("alice.eve@gmail.com")
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Icon(Icons.close_rounded,size: 42,),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text("My account",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
            SizedBox(
              height: 10,
            ),
    Expanded(
    child: ListView.builder(
    itemCount: users.length,
    itemBuilder: (BuildContext context, int index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text("${users[index].heading}", style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              color: Color(0xEDE8E7E7),),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Alice", style: TextStyle(color: Colors.grey),),
                Icon(Icons.edit_square, color: Colors.grey,),
              ],
            ),
          ),
        ],
      );
    },),),


            Container(
              width: 140,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all()
              ),
              child: const Row(
                children: [
                  Padding(padding: EdgeInsets.only(left:2,right: 30,top:15,bottom:15) ),
                  Icon(Icons.settings_rounded),
                  SizedBox(width: 10,)  ,
                  Text("Settings",style: TextStyle(fontWeight: FontWeight.bold),) ,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  String? heading;
  String? userdetails;

  User({this.heading, this.userdetails});
}