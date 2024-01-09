import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sello_via/logics/chat_logic.dart';
import 'package:sello_via/widgets/custom_container.dart';
import 'package:sello_via/widgets/navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends StatefulWidget {
  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
 // AuthServices authServices=AuthServices();
  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  ChatLogic _chatLogic=ChatLogic();
  List<DocumentSnapshot> chats = [

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.all(15),
          child: Stack(
            children: [
              Column(
                children: [
                  Topbar("Messages"),
                  const SizedBox(
                    height: 20,
                  ),
                  Search("Search in messages"),
                  const SizedBox(
                    height: 10,
                  ),
                 StreamBuilder<QuerySnapshot>
                   (stream: firebaseFirestore.collection('chats').orderBy('time',descending: true).snapshots(),
                     builder: (context,snapshot){
                     if(snapshot.hasError){
                       return Center(
                         child: Text('Unable to load chats'),

                       );
                     }else if (snapshot.hasData
                     && snapshot.data!.docs.isNotEmpty
                     ){
                       chats=snapshot.data!.docs;
                       return Stack(
                         children: [
                           InkWell(
                             onTap:(){

                             },

                             child: Container(
                               height:90,
                               margin: EdgeInsets.all(5),
                               padding: EdgeInsets.all(15),
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(13),
                                 color: Colors.white,
                               ),

                               child: Row(
                                 children: [
                                   Stack(
                                     children: [
                                       CircleAvatar(
                                         backgroundImage: NetworkImage('gfgfg'),
                                         radius: 25,
                                       ),
                                       Positioned(
                                         bottom: 6,
                                         right: 0,
                                         child: Container(
                                           width: 10, // Adjust the size of the small circle as needed
                                           height: 10,
                                           decoration: BoxDecoration(
                                             shape: BoxShape.circle,
                                             color: Colors.green, // Change the color of the small circle
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),

                                   SizedBox(width: 8.0),
                                   Expanded(
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Row(
                                           children: [
                                             Text(
                                               "hgthgfhf",
                                               style: TextStyle(
                                                 fontWeight: FontWeight.bold,
                                                 fontSize: 15.0,
                                               ),
                                             ),

                                             Text(
                                               " | gfhg",
                                               style: const TextStyle(
                                                 fontWeight: FontWeight.bold,
                                                 color: Colors.grey,
                                                 fontSize: 15.0,
                                               ),
                                             ),
                                           ],
                                         ),
                                         SizedBox(
                                           height: 5,
                                         ),

                                         Text(
                                           "ghfhghjgjh",
                                           style: TextStyle(
                                             fontSize: 13.0,
                                             color: Colors.grey,
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),

                                 ],
                               ),
                             ),
                           ),
                           Positioned(
                             bottom:20,
                             right:20,
                             child:Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               crossAxisAlignment: CrossAxisAlignment.end,
                               children: [
                                 Text( "76767",style: TextStyle(color: Colors.black26),),
                                 Text( " 7.30pm",style: TextStyle(color: Colors.black26),),
                               ],
                             ), ),
                         ],
                       );
                     }
                      else {
                       return Center(
                         child: CircularProgressIndicator(
                           color: Color(0xff37007C),
                         ),
                       );
                     }

                 })

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
