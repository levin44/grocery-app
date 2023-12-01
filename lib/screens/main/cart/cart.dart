import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/components/custom_button.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/components/mini_image_tile.dart';
import 'package:grocery_app/providers/home/cart_provider.dart';
import 'package:grocery_app/screens/main/cart/widget/bottom_row.dart';
import 'package:grocery_app/screens/main/cart/widget/cart_tile.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/assets_constants.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: SvgPicture.asset(AssetsConstants.backIcon),
                    ),
                  ),
                  CustomText(
                    "Cart ",
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                  Icon(
                    Icons.abc,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: 18),
              Expanded(child: Consumer<CartProvider>(
                builder: (context, value, child) {
                  return value.cartItems.isEmpty
                      ? Center(child: const CustomText("No cart items"))
                      : ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          itemBuilder: (context, index) {
                            return CartTile(
                              model: value.cartItems[index],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 20),
                          itemCount: value.cartItems.length);
                },
              ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomRow(),
    );
  }
}
