import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sello_via/logics/product_logic.dart';

import '../appConts/routes.dart';
import '../models/product_model.dart';

class ProductListItem extends StatelessWidget {
  final ProductLogic _productLogic = Get.put(ProductLogic());
  ProductModel product;

  ProductListItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
          children: [
          InkWell(
          onTap: ()
      {
      Navigator.pushNamed(
      context,
      Routes.product_detailsRoute,
      arguments: {
      "productData":product
      }
      );

      _productLogic.addProductToRecentlyViewed(product);

      },
      child: Container(
          width: 250,
          color: Colors.transparent,
          child: Stack(
              children: [
          Container(
          //height:300

          child:
          CachedNetworkImage(
          imageUrl: product.images![0],
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
               fit: BoxFit.cover,
               height: 230,
               width: 250,
    ),
    ),
    Positioned(
    bottom: 15,
    right: 15,
    child: InkWell(
    onTap: () {

    },
    child: Container(
    height: 30,
    width: 30,
    decoration: ShapeDecoration(
    color: const Color(
    0x7EE0E0DF),
    shape:
    RoundedRectangleBorder(
    borderRadius:
    BorderRadius
        .circular(100),
    ),
    ),
    child: Icon(
    Icons.favorite_outline,
    color: Colors.red,
    ),

    ),
    ))
    ],
    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
    mainAxisAlignment:
    MainAxisAlignment.spaceBetween,
    children: [
    Column(
    mainAxisAlignment:
    MainAxisAlignment.start,
    crossAxisAlignment:
    CrossAxisAlignment.start,
    children: [
    Text(
    product.name!,
    style: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Colors.black87,
    ),
    ),
    Row(
    children: [
    // Text(
    //   DateFormat("dd/MM/yyyy").format(
    //       DateTime.fromMillisecondsSinceEpoch(int.parse(product.date!))
    //   ),
    //   style: const TextStyle(
    //     fontWeight:
    //     FontWeight.w300,
    //     fontSize: 14,
    //     color:
    //     Color(0xFF7C035A),
    //   ),
    // ),
    const Text(
    ' ',
    style: TextStyle(
    fontWeight:
    FontWeight.w300,
    fontSize: 14,
    color:
    Color(0xFF7C035A),
    ),
    ),
    ],
    )
    ],
    ),
    const SizedBox(
    width: 30,
    ),
    Text(
    '₹ ${product.price}',
    style: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.black87,
    ),
    ),
    ],
    ),
    ),
    ],
    )
    ,
    );
  }

}