import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/cartitem_model.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/utils/helper/alert_helper.dart';
import 'package:logger/logger.dart';

class CartProvider extends ChangeNotifier {
// cart counter
  int _counter = 1;

  //get counter
  int get counter => _counter;

  //increase the cart counter
  void increaseCounter() {
    _counter++;
    notifyListeners();
  }

  //decrease the cart counter
  void decreaseCounter() {
    if (_counter != 1) {
      _counter--;
      notifyListeners();
    }
  }

// clear the amount
  void clearAmount() {
    _counter = 1;
    notifyListeners();
  }

  //add to card
  //cart item list
  final List<CartItemModel> _cartItems = [];
  List<CartItemModel> get cartItems => _cartItems;

  //initialize add to cart functionality
  void addToCart(ProductModel model, BuildContext context) {
    // first check whether adding product is already in the cart item list
    if (_cartItems.any(
      (e) => e.id == model.id,
    )) {
      // if exists, increase the product amount of the existing cart item

      //find the existing cart item
      var temp = _cartItems.singleWhere((e) => e.id == model.id);

      // update the amount
      temp.amount = temp.amount + _counter;

      //calculate the subtotal according to the new amount
      temp.subTotal = temp.amount * double.parse(model.price);

      //reset amount
      clearAmount();

      //show an alert
      AlertHelper.showSnakBar(
        context,
        "Increased the product amount",
        type: AnimatedSnackBarType.success,
      );

      notifyListeners();
    } else {
      //adding items to the cart
      _cartItems.add(CartItemModel(
          id: model.id,
          amount: _counter,
          subTotal: _counter * double.parse(model.price),
          productModel: model));

      //reset amount
      clearAmount();

      //show an alert
      AlertHelper.showSnakBar(
        context,
        "Added to the cart!",
        type: AnimatedSnackBarType.success,
      );

      Logger().w(_cartItems.length);

      notifyListeners();
    }
  }

  //calculate and get total cart item count
  int get getCartTotalItemCount {
    int temp = 0;

    //reading cart item list and get the sum of amount values as the cart item count
    for (var i = 0; i < _cartItems.length; i++) {
      temp += _cartItems[i].amount;
    }

    return temp;
  }

  //calculate and get total
  double get getCartTotalPrice {
    double temp = 0;

    //reading cart item list and get the sum of subtotal values as the cart item total price
    for (var i = 0; i < _cartItems.length; i++) {
      temp += _cartItems[i].subTotal;
    }

    return temp;
  }

  //increase the cart item amount
  void increaseCartItemAmount(String cartId) {
    //find the existing cart item
    var temp = _cartItems.singleWhere((e) => e.id == cartId);

    // update the amount
    temp.amount++;

    //calculate the subtotal according to the new amount
    temp.subTotal = temp.amount * double.parse(temp.productModel.price);

    notifyListeners();
  }

  //decrease the cart item amount
  void decreaseCartItemAmount(String cartId) {
    //find the existing cart item
    var temp = _cartItems.singleWhere((e) => e.id == cartId);

//check whether the amount is 1
    if (temp.amount == 1) {
      //if yes remove the item from cart
      removeCartItem(cartId);
    } else {
      // update the amount
      temp.amount--;

      //calculate the subtotal according to the new amount
      temp.subTotal = temp.amount * double.parse(temp.productModel.price);

      notifyListeners();
    }
  }

  // remove cart item by id
  void removeCartItem(String cartId) {
    //find the existing cart item
    _cartItems.removeWhere((e) => e.id == cartId);

    notifyListeners();
  }
}
