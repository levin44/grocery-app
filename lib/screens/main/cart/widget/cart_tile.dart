import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/components/mini_image_tile.dart';
import 'package:grocery_app/models/cartitem_model.dart';
import 'package:grocery_app/providers/home/cart_provider.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
    required this.model,
  });

  final CartItemModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.grey,
            blurRadius: 5,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              MiniImageTile(),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    model.productModel.productName,
                    fontSize: 14,
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .increaseCartItemAmount(model.id);
                          },
                          child: Icon(Icons.add)),
                      SizedBox(width: 15),
                      CustomText(
                        model.amount.toString(),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(width: 15),
                      InkWell(
                          onTap: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .decreaseCartItemAmount(model.id);
                          },
                          child: Icon(Icons.remove)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Provider.of<CartProvider>(context, listen: false)
                      .removeCartItem(model.id);
                },
                child: Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
              CustomText(
                "Rs. ${model.subTotal}",
                fontSize: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
