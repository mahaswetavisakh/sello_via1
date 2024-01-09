import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
//final String name;
//final String img;
//ChatRoom({required this.name,required this.img});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage("https://4ec5a3ca-a-258b6f3f-s-sites.googlegroups.com/a/goodmen.info/workcanada/assistants/female_generic_profile.png"),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Swetha",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                Text("online",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 12),),


              ],
            ),

          ],
        ),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_outlined,size: 26,))],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: ListView.builder(itemBuilder: (context,index){
            return Container();
          }))
        ],
      ),
    );
  }
}

