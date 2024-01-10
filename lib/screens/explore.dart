import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sello_via/models/product_model.dart';
import 'package:sello_via/widgets/custom_container.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Topbar("Explore"),
              const SizedBox(
                height: 20,
              ),
              Search("Search"),
              const SizedBox(
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
              padding: const EdgeInsets.only(left:20,right: 20,top:10,bottom:10),
              height:40,
              width: 80,
              margin: const EdgeInsets.only(right:10),
              alignment: Alignment.center,
              decoration: ShapeDecoration(

                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23),
                ),
              ),
              child: Text("${listing[index].item}",style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500
              ),),
            ),
            const SizedBox(
              width: 20,

            ),

        ],
    );
    },),),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("products").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                  if(snapshot.hasData){

                    List<ProductModel> products=[];
                    for(QueryDocumentSnapshot value in snapshot.data!.docs){
                      products.add(ProductModel.fromMap(value.data()));
                    }

                    return Expanded(
                      child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(products[index].name!,style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  subtitle: Text(snapshot.data!.docs[index].get("category"),style: const TextStyle(
                                      fontWeight: FontWeight.w500
                                  ),),
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        '${details[index].profile}'
                                    ),
                                  ),
                                  trailing: const Icon(Icons.more_vert_outlined),
                                ),
                                Container(
                                  width: 300,
                                  height: 300,
                                  color: Colors.transparent,
                                  child: Stack(
                                    children: [
                                      Image.network(snapshot.data!.docs[index].get("images")[0],fit: BoxFit.cover,height: 300,width:300,),

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

                                            child: const Icon(Icons.favorite_outline,color: Colors.red,),
                                          ))
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('${details[index].item}',style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black87,
                                          ),),
                                          Row(
                                            children: [
                                              Text('Make: ${details[index].make}',style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.black26,
                                              ),),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text('| Year: ${details[index].year}',style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.black26,
                                              ),),
                                            ],
                                          )
                                        ],
                                      ),
                                      Text('₹ ${products[index].price}',style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black87,
                                      ),),
                                      const SizedBox(
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
                    );
                  }else{
                    return const CircularProgressIndicator();
                  }

                }
              ),

            ],
          ),
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
