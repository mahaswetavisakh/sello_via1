import 'package:flutter/material.dart';
import 'package:sello_via/widgets/Customcontainer.dart';


class Home extends StatelessWidget{
  List<Itemdetails> details = [
    Itemdetails(

        image:"assets/watch.png",
        item:"Cordoba Watch",
        year:"2021",
        make:"Cordoba",
        price:"20,000"

    ),
    Itemdetails(
        image:"assets/guitar.png",
        item:"Cordoba Mini Guitar",
        year:"2023",
        make:"Cordoba",
        price:"25,000"
    ),

    Itemdetails(

        image:"assets/book.png",
        item:"Book",
        year:"2020",
        make:"Cordoba",
        price:"2,000"

    ),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 40, top: 50),
        child: ListView(

          children: [
        Row(
        children: [
        Stack(
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
            Positioned(
              bottom: 6,
              right: 0,
              child: Container(

                width: 15, // Adjust the size of the small circle as needed
                height: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFB9B9B8),

                  // Change the color of the small circle
                ),
                child: Icon(Icons.menu,size: 10,),
              ),
            ),

          ],
        ),

        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(alignment: Alignment.centerLeft,),
            Text("Alice Eve",style:
            TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 23),),
            Text("Welcome back!",style:TextStyle(fontWeight: FontWeight.w400,color: Colors.red,fontSize: 15),)
          ],
        ),
        SizedBox(
          width: 80,
        ),
        IconButton(onPressed: (){},
          icon:Icon (Icons.menu,size: 30),),

        ],
      ),
            SizedBox(
              height: 20,
            ),
           Search("Search"),
         SizedBox(
           height: 20,
         ),

        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(" New arrivals",style:
               TextStyle(
                   color: Colors.black,
                   fontSize: 20,
                 fontWeight: FontWeight.w500,
               ),),
               Text("View more",style:
               TextStyle(
                 color: Colors.black38,
                 fontSize: 12,
                 fontWeight: FontWeight.w500,
               ),),
             ],
         ),
            SizedBox(
          height: 20,
        ),
            SizedBox(
         height:300,
        child: ListView.builder(
      scrollDirection: Axis.horizontal,
    itemCount: details.length,
    itemBuilder: (BuildContext context, int index) {
    return Card(
      child: Column(
        children: [

          Container(
        width: 250,
        height: 230,
        color: Colors.transparent,
        child: Stack(
          children: [
            Container(
              //height:300
                child: Image.asset('${details[index].image}',fit: BoxFit.cover,height: 230,width:250,)),
            Positioned(
                bottom:15,
                right:15,
                child: Container(
                  height: 30,
                  width:30,
                  decoration: ShapeDecoration(
                    color: Color(0x7EE0E0DF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),

                  child: Icon(Icons.favorite_outline,color: Colors.red,),
                ))
          ],
        ),
          ),

          Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${details[index].item}',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87,
                ),),
                Row(
                  children: [
                    Text('${details[index].year}',style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: Color(0xFF7C035A),
                    ),),

                    Text(' | ${details[index].make}',style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: Color(0xFF7C035A),
                    ),),
                  ],
                )
              ],
            ),
             SizedBox(
               width: 30,
             ),
             Text('₹ ${details[index].price}',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),),
          ],
        ),
          ),
        ],
      ),
    );
    },
    ),
         ),
            SizedBox(
          height: 20,
        ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(" Recently viewed",style:
                  TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),),
                  Text("View more",style:
                  TextStyle(
                    color: Colors.black38,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),),
                ],
              ),
            SizedBox(
                height: 20,
              ),
            SizedBox(
                height:300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: details.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: [

                          Container(
                            width: 250,
                            height: 230,
                            color: Colors.transparent,
                            child: Stack(
                              children: [
                                Container(
                                  //height:300
                                    child: Image.asset('${details[index].image}',fit: BoxFit.cover,height: 230,width:250,)),
                                Positioned(
                                    bottom:15,
                                    right:15,
                                    child: Container(
                                      height: 30,
                                      width:30,
                                      decoration: ShapeDecoration(
                                        color: Color(0x7EE0E0DF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                      ),

                                      child: Icon(Icons.favorite_outline,color: Colors.red,),
                                    ),),
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${details[index].item}',style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),),
                                    Row(
                                      children: [
                                        Text('${details[index].year}',style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14,
                                          color: Color(0xFF7C035A),
                                        ),),

                                        Text(' | ${details[index].make}',style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14,
                                          color: Color(0xFF7C035A),
                                        ),),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text('₹ ${details[index].price}',style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black87,
                                ),),
                              ],
                            ),
                          ),
                        ],
                      ),
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
class Itemdetails {

  String? image;
  String? item;
  String? year;
  String? make;
  String? price;

  Itemdetails({this.image,this.item,this.year,this.make,this.price});
}