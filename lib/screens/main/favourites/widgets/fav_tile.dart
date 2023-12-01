import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/components/mini_image_tile.dart';
import 'package:grocery_app/models/cartitem_model.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/providers/home/cart_provider.dart';
import 'package:grocery_app/providers/home/product_provider.dart';
import 'package:provider/provider.dart';

class FavTile extends StatelessWidget {
  const FavTile({
    super.key,
    required this.model,
  });

  final ProductModel model;

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
              CustomText(
                model.productName,
                fontSize: 14,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Provider.of<ProductProvider>(context, listen: false)
                      .addToFav(model, context);
                },
                child: Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
              CustomText(
                "Rs. ${model.price}",
                fontSize: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
