import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/controllers/file_upload_controller.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:logger/logger.dart';

class AdminController {
  //create a collection referance called products
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  //file upload controller
  final FileUploadController _fileUploadController = FileUploadController();

  //save extra product data in firestore
  Future<void> saveProductData(
      String productName, String productDes, String price, File file) async {
    // first upload the file and get a download url to product image
    final String downloadUrl =
        await _fileUploadController.uploadFile(file, "productImages");

    if (downloadUrl != "") {
      //getting a unique id
      String id = products.doc().id;

      return products
          .add({
            'id': id,
            'productName': productName,
            'desc': productDes,
            'price': price,
            'img': downloadUrl,
          })
          .then((value) => Logger().i("product added"))
          .catchError((error) => Logger().e("failed to add product: $error"));
    } else {
      Logger().e("download url is empty");
    }
  }

  //fetch product data from cloud firestore
  Future<List<ProductModel>> fetchProductList() async {
    try {
      //firebase query that find and fetch product list
      QuerySnapshot querySnapshot = await products.get();

      Logger().w(querySnapshot.docs.length);

      //product list
      List<ProductModel> productList = [];

      for (var e in querySnapshot.docs) {
        //mapping to product model
        ProductModel model =
            ProductModel.fromJson(e.data() as Map<String, dynamic>);

        //adding to the list
        productList.add(model);
      }

      return productList;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }
}
