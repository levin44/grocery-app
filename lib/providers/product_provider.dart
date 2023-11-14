import 'package:flutter/material.dart';
import 'package:grocery_app/controllers/admin_controller.dart';
import 'package:grocery_app/models/product_model.dart';
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
}
