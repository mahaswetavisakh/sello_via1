import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../appConts/routes.dart';
import '../models/product_model.dart';

class ProductListItem extends StatelessWidget{

  ProductModel product;
  ProductListItem(this.product);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.product_detailsRoute,
                arguments: {
                  "productData":product
                }
              );


            },
            child: Container(
              width: 250,
              color: Colors.transparent,
              child: Stack(
                children: [
                  Container(
                    //height:300
                      child: Image.network(
                        product.images![0],
                        fit: BoxFit.cover,
                        height: 230,
                        width: 250,
                      )),
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
                          child:  Icon(
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
                        Text(
                         DateFormat("dd/MM/yyyy").format(DateTime.parse(product.date!)).toString(),
                          style: const TextStyle(
                            fontWeight:
                            FontWeight.w300,
                            fontSize: 14,
                            color:
                            Color(0xFF7C035A),
                          ),
                        ),
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
      ),
    );
  }

}