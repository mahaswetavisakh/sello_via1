import 'package:flutter/material.dart';
import 'package:sello_via/widgets/Customcontainer.dart';
import 'package:sello_via/widgets/navbar.dart';
import '../main.dart';

class Explore extends StatelessWidget{
  List<Listingitem> listing = [
    Listingitem(
      item:"Books"
    ),
    Listingitem(
        item:"Game"
    ),

    Listingitem(
        item:"Music"
    ),
    Listingitem(
        item:"Dress"
    ),
    Listingitem(
        item:"Watches"
    ),
    Listingitem(
        item:"TV"
    ),
    ];
  List<Itemdetails> details = [
    Itemdetails(
      profile:"https://4ec5a3ca-a-258b6f3f-s-sites.googlegroups.com/a/goodmen.info/workcanada/assistants/female_generic_profile.png",
        title:"Cliff Hanger",
        subtitle:"EI Dorado",
        image:"assets/watch.png",
        item:"Cordoba Watch",
      make:"Cordoba",
      year:"2021",
      price:"20,000"

    ),
    Itemdetails(
        profile:"https://4ec5a3ca-a-258b6f3f-s-sites.googlegroups.com/a/goodmen.info/workcanada/assistants/female_generic_profile.png",
        title:"Cliff Hanger",
        subtitle:"EI ",
        image:"assets/guitar.png",
        item:"Cordoba Mini Guitar",
        make:"Cordoba",
        year:"2023",
        price:"25,000"

    ),

    Itemdetails(
        profile:"https://4ec5a3ca-a-258b6f3f-s-sites.googlegroups.com/a/goodmen.info/workcanada/assistants/female_generic_profile.png",
        title:"Cliff Hanger",
        subtitle:"EI Dorado",
        image:"assets/book.png",
        item:"Book",
        make:"Cordoba",
        year:"2020",
        price:"2,000"

    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left:20,right: 20,bottom: 40,top: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Topbar("Explore"),
            SizedBox(
              height: 20,
            ),
            Search("Search"),
            SizedBox(
              height: 20,
            ),
    SizedBox(
      height: 40,

    child: ListView.builder(

     scrollDirection: Axis.horizontal,
    itemCount: listing.length,
    itemBuilder: (BuildContext context, int index) {
    return Column(


        children: [
          Container(
            padding: EdgeInsets.only(left:20,right: 20,top:10,bottom:10),
            height:40,
            width: 80,
            margin: EdgeInsets.only(right:10),
            alignment: Alignment.center,
            decoration: ShapeDecoration(

              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(23),
              ),
            ),
            child: Text("${listing[index].item}",style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500
            ),),
          ),
          SizedBox(
            width: 20,

          ),

      ],
    );
    },),),
            Expanded(
              child: ListView.builder(

                itemCount: details.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('${details[index].title}',style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),
                          subtitle: Text('${details[index].subtitle}',style: TextStyle(
                            fontWeight: FontWeight.w500
                          ),),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                '${details[index].profile}'
                            ),
                          ),
                          trailing: Icon(Icons.more_vert_outlined),
                        ),
                        Container(
                          width: 300,
                          height: 300,
                          color: Colors.transparent,
                          child: Stack(
                            children: [
                              Image.asset('${details[index].image}',fit: BoxFit.cover,height: 300,width:300,),

                              Positioned(
                                  bottom:15,
                                  right:15,
                                  child: Container(
                                    height: 30,
                                    width:30,
                                    decoration: ShapeDecoration(
                                      color: Colors.black12,
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
                                    fontSize: 20,
                                    color: Colors.black87,
                                  ),),
                                  Row(
                                    children: [
                                      Text('Make: ${details[index].make}',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black26,
                                      ),),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('| Year: ${details[index].year}',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black26,
                                      ),),
                                    ],
                                  )
                                ],
                              ),
                              Text('₹ ${details[index].price}',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black87,
                              ),),
                              SizedBox(
                                height: 20,
                              )
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
      ),
    );
  }
}
class Listingitem {
  String? item;

  Listingitem({this.item });
}
class Itemdetails {
  String? profile;
  String? title;
  String? subtitle;
  String? image;
  String? item;
  String? make;
  String? year;
  String? price;

  Itemdetails({this.profile, this.title,
    this.subtitle,this.image,this.item,this.make,this.year,this.price});
}
