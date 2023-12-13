import 'package:flutter/material.dart';
import 'package:sello_via/widgets/Customcontainer.dart';
import 'package:sello_via/widgets/navbar.dart';

class Messages extends StatefulWidget {
  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  List<User> users = [
    User(
        name: "DJI Mavic Mini2",
        name2: "Paul Molive",
        details: "Hello",
        date: "yesterday",
        time: "9:30 PM",
        image: "https://4ec5a3ca-a-258b6f3f-s-sites.googlegroups.com/a/goodmen.info/workcanada/assistants/female_generic_profile.png"
    ),
    User(
        name: "DJI Mavic Mini2",
        name2: "Paul Molive",
        details: "Hello",
        date: "02/12/2023",
        time: "8:30 PM",
        image: "https://4ec5a3ca-a-258b6f3f-s-sites.googlegroups.com/a/goodmen.info/workcanada/assistants/female_generic_profile.png"
    ),
    User(
        name: "DJI Mavic Mini2",
        name2: "Paul Molive",
        details: "Hello",
        date: "yesterday",
        time: "1:30 PM",
        image: "https://4ec5a3ca-a-258b6f3f-s-sites.googlegroups.com/a/goodmen.info/workcanada/assistants/female_generic_profile.png"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(left:20,right: 20,bottom: 40,top: 70),
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
                Expanded(
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
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
                                        backgroundImage: NetworkImage('${users[index].image}'),
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
                                              "${users[index].name}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0,
                                              ),
                                            ),

                                            Text(
                                              " | ${users[index].name2}",
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
                                          "${users[index].details}",
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
                                  Text( "${users[index].date}",style: TextStyle(color: Colors.black26),),
                                  Text( " ${users[index].time}",style: TextStyle(color: Colors.black26),),
                                ],
                              ), ),
                        ],
                      );
                    },
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  String? name;
  String? name2;
  String? details;
  String? date;
  String? time;
  String? image;
  User({this.name, this.name2,this.details, this.date,this.time, this.image});
}