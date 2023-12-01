import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/components/custom_button.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/components/dialogbox_content.dart';
import 'package:grocery_app/providers/cart_provider.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/assets_constants.dart';
import 'package:provider/provider.dart';

class BottomRow extends StatelessWidget {
  const BottomRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Consumer<CartProvider>(
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CartAmountRow(
                  name: "Item total",
                  amount: value.getCartTotalItemCount.toString(),
                ),
                CartAmountRow(
                  name: "Discount",
                  amount: "-\$10",
                ),
                CartAmountRow(
                  name: "Tax",
                  amount: "\$2",
                ),
                CartAmountRow(
                  name: "Total",
                  amount: "Rs. ${value.getCartTotalPrice}0",
                  isTotal: true,
                ),
                SizedBox(height: 20),
                CustomButton(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) {
                            return DialogBoxContent();
                          });
                    },
                    text: "Place order")
              ],
            );
          },
        ));
  }
}

class CartAmountRow extends StatelessWidget {
  const CartAmountRow({
    super.key,
    required this.name,
    required this.amount,
    this.isTotal = false,
  });

  final String name;
  final String amount;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            name,
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : null,
          ),
          CustomText(
            amount,
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : null,
          ),
        ],
      ),
    );
  }
}
