import 'package:intl/intl.dart';

class ProductModel{
  String? id;
  String?  name;
  String? price;
  String? description;
  String? category;
  String? subcategory;
  List? images;
  String? status;
  String? sellerId;
  String? date;
  int? views;
  bool? isVisible;

  ProductModel({this.name,this.id,this.images,
    this.sellerId,this.category,this.price,
  this.date,this.description,this.status,this.subcategory,this.views,this.isVisible = true,});

  factory ProductModel.fromMap(data){
    return ProductModel(
      name: data['name'],
      id: data['id'],
      images: data['images'],
      sellerId: data['sellerId'],
      category: data['category'],
      price: data['price'],
      date: data['date'],
      description: data['description'],
      status: data['status'],
      subcategory: data['subcategory'],
      views: data['views'],
      isVisible: data['isVisible'] ?? true,
    );
  }

 String toDate(String milliSecond){
    var dt = DateTime.fromMillisecondsSinceEpoch(int.parse(milliSecond));
    var date = DateFormat('MM/dd/yyyy').format(dt);
    return date;
  }

  toMap(){
    return {
      'name':name,
      'price': price,
      'description':description,
      'category': category,
      'subcategory':subcategory,
      "images":images,
      "status":status,
      "views":views,
      "sellerId":sellerId,
      "date":date,
      "id":id,
      "isVisible":isVisible,
    };
  }
}
