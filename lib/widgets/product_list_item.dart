import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sello_via/logics/product_logic.dart';

import '../appConts/routes.dart';
import '../logics/favorite_logics.dart';
import '../logics/recently_viewed_logic.dart';
import '../models/product_model.dart';

class ProductListItem extends StatelessWidget {
  final ProductLogic _productLogic = Get.put(ProductLogic());
  final Recently_viewed_Logics _recently_viewed_Logics = Get.put(Recently_viewed_Logics());
  final FavoriteLogics _favoriteLogics = Get.put(FavoriteLogics());
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
                    "productData": product
                  }
              );

              _productLogic.addView(product);
              _recently_viewed_Logics.recently_Viewed(product);
            },
            child: Container(
              width: 250,
              color: Colors.transparent,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: product.images![0],
                    placeholder: (context, url) =>
                        Image.asset("assets/anim_imageloading.gif"),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                    height: 230,
                    width: 250,
                  ),
                  Positioned(
                      bottom: 15,
                      right: 15,
                      child: InkWell(
                        onTap: (){
                          _favoriteLogics.addToFavorite(product);
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
                          child: const Icon(
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
            child: SizedBox(
              width: 250,
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          product.toDate(product.date!),
                          style: const TextStyle(
                            fontWeight:
                            FontWeight.w300,
                            fontSize: 14,
                            color:
                            Color(0xFF7C035A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Flexible(
                    child: Text(
                      '₹ ${product.price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
      ,
    );
  }

}