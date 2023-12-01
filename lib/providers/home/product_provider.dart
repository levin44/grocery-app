import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/controllers/admin_controller.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/utils/helper/alert_helper.dart';

import 'package:logger/logger.dart';

class ProductProvider extends ChangeNotifier {
  final AdminController _adminController = AdminController();

  //loader state
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  //set loader state
  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  // usermodel object to store user object
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  //start fetch user data
  Future<void> startFetchProductList() async {
    try {
      //start the loader
      setLoading(true);

      await _adminController.fetchProductList().then((value) {
        _products = value;
        notifyListeners();

        //stop the loader
        setLoading(false);
      });
    } catch (e) {
      Logger().e(e);

      //stop the loader
      setLoading(false);
    }
  }

//====================product details section
//=====to store the selected product model
  late ProductModel _productModel;

  //get the selected product model
  ProductModel get productModel => _productModel;

  //=====set the product model when clicked on the product cart
  set setProduct(ProductModel model) {
    _productModel = model;
    notifyListeners();
  }

  //=========get related product excluding the selected product
  List<ProductModel> get relatedProducts {
    List<ProductModel> temp = [];

    //reading product list and return without already selected products
    for (var i = 0; i < _products.length; i++) {
      if (_products[i].id != _productModel.id) {
        temp.add(_products[i]);
      }
    }

    return temp;
  }

  //add to favorite

  // to store fav products
  final List<ProductModel> _favProducts = [];
  //getter fav products
  List<ProductModel> get favProducts => _favProducts;

  //add to fav method
  void addToFav(ProductModel model, BuildContext context) {
//first check whether this product is already in the product list
    if (_favProducts.contains(model)) {
      _favProducts.remove(model);
      //show snakbar
      AlertHelper.showSnakBar(
        context,
        "removed from favorites!",
      );

      notifyListeners();
    } else {
      _favProducts.add(model);

      //show snakbar
      AlertHelper.showSnakBar(context, "Added to favorites!",
          type: AnimatedSnackBarType.success);

      notifyListeners();
    }
  }
}