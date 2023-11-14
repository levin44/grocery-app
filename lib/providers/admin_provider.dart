import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/controllers/admin_controller.dart';
import 'package:grocery_app/providers/product_provider.dart';
import 'package:grocery_app/utils/helper/alert_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class AdminProvider extends ChangeNotifier {
  final AdminController _adminController = AdminController();

  final _productDes = TextEditingController();
  TextEditingController get productDes => _productDes;
  final _pName = TextEditingController();
  TextEditingController get pName => _pName;
  final _price = TextEditingController();
  TextEditingController get price => _price;

  //loader state
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  //set loader state
  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<void> startSaveProductData(BuildContext context) async {
    try {
      //start loader
      setLoading(true);
      await _adminController
          .saveProductData(_pName.text, _productDes.text, _price.text, _pImage)
          .then(
        (value) {
          //clear the controllers
          _pName.clear();
          _productDes.clear();
          _price.clear();
          _pImage = File("");

          //start fetch product list
          Provider.of<ProductProvider>(context, listen: false)
              .startFetchProductList();

          //stop the loader
          setLoading(false);
          AlertHelper.showAlert(context, "Product saved successfully",
              type: DialogType.success);
        },
      );
    } catch (e) {
      Logger().e(e);
      setLoading(false);
      AlertHelper.showAlert(context, e.toString());
    }
  }

  //----pick, upload product image
  // image picker object
  final ImagePicker picker = ImagePicker();

  // file object to store picked file
  File _pImage = File("");

  //getter for picked file
  File get pImage => _pImage;

  // pick an image function
  Future<void> selectProductImage(BuildContext context) async {
    try {
      // Pick an image.
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);

      Logger().w(pickedFile?.path);

      // check if user has picked a file or not
      if (pickedFile != null) {
        _pImage = File(pickedFile.path); //changed
        notifyListeners();
      } else {
        Logger().w("no image selected");
      }
    } catch (e) {
      Logger().e(e);
    }
  }
}
