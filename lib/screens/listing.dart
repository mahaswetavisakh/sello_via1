import 'package:flutter/material.dart';
import 'package:sello_via/widgets/Custombuttons.dart';
import 'package:sello_via/widgets/navbar.dart';

class Listing extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: Bottomnavwithicons(),

      body: Padding(
        padding: const EdgeInsets.only(left:20,right: 20,bottom: 40,top: 70),
        child: Column(
          children: [
            Topbar("My Listings"),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Wrap(
                direction: Axis.vertical,
                spacing: 10,
                children: [
                  ListingwithmailButtons("assets/img.png","My Listing", "2.2K","5","67", "19/05/2009"),
                  ListingwithmailButtons("assets/img.png","My Listing", "2.2K","5","67", "19/05/2009"),
                  ListingButtons("assets/img_3.png","My Listing", "09/12/2010","67", "19/05/2009"),
                  ListingvisibleButtons("assets/img_3.png","My Listing", "3.5K","67", "19/05/2009"),
                  ListingsoldButtons("assets/img_3.png","My Listing", "3.5K","67", "19/05/2009"),
                  //My Listing

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}