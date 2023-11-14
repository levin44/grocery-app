// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  String id;
  String productName;
  String desc;
  String price;
  String img;

  ProductModel(this.id, this.productName, this.desc, this.price, this.img);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'productName': productName,
      'desc': desc,
      'price': price,
      'img': img,
    };
  }

  //bind json data to usermodel
  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      map['id'] as String,
      map['productName'] as String,
      map['desc'] as String,
      map['price'] as String,
      map['img'] as String,
    );
  }
}
