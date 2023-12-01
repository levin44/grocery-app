import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/providers/cart_provider.dart';
import 'package:grocery_app/screens/main/cart/cart.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/assets_constants.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) {
        return badges.Badge(
          badgeContent: CustomText(
            value.cartItems.length.toString(),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          badgeStyle:
              const badges.BadgeStyle(badgeColor: AppColors.primaryColor),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
            child: Image.asset(AssetsConstants.cartIcon),
          ),
        );
      },
    );
  }
}
