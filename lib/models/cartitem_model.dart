// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:grocery_app/models/product_model.dart';

class CartItemModel {
  String id;
  int amount;
  double subTotal;
  ProductModel productModel;

  CartItemModel({
    required this.id,
    required this.amount,
    required this.subTotal,
    required this.productModel,
  });

  //bind json data to usermodel
  factory CartItemModel.fromJson(Map<String, dynamic> map) {
    return CartItemModel(
      id: map['id'] as String,
      amount: map['amount'] as int,
      subTotal: map['subTotal'] as double,
      productModel:
          ProductModel.fromJson(map['productModel'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'amount': amount,
      'subTotal': subTotal,
      'productModel': productModel.toJson(),
    };
  }
}
