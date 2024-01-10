class CategoryModel{
 final String? name;
 final String? image;
 final String? id;
 final String? categoryId;
 CategoryModel({this.name,this.id,this.image,this.categoryId});

 factory CategoryModel.fromMap(data){
  return CategoryModel(
   name:data['name'] ,
   id: data['id'],
   image: data['image'],
   categoryId: data['category_id']
  );
 }
}