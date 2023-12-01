import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/providers/cart_provider.dart';
import 'package:grocery_app/providers/product_provider.dart';
import 'package:grocery_app/utils/constants/assets_constants.dart';
import 'package:provider/provider.dart';

class RelatedItemsSection extends StatelessWidget {
  const RelatedItemsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 85,
        child: Consumer<ProductProvider>(
          builder: (context, value, child) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: value.relatedProducts.length,
              itemBuilder: (context, index) {
                return RelatedItemTile(
                  model: value.relatedProducts[index],
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                width: 5,
              ),
            );
          },
        ));
  }
}

class RelatedItemTile extends StatelessWidget {
  const RelatedItemTile({
    super.key,
    required this.model,
  });

  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

  // clear the cart counter
        Provider.of<CartProvider>(context, listen: false).clearAmount();

        Provider.of<ProductProvider>(context, listen: false).setProduct = model;
      },
      child: Container(
        width: 90,
        height: 90,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(12),
           image: DecorationImage(
            image: NetworkImage(model.img),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: 24,
          padding: EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 50,
                child: CustomText(
                  model.productName,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
              CustomText(
                "Rs. ${model.price}",
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
