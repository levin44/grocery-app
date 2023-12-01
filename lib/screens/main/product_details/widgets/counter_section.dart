import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/providers/home/cart_provider.dart';
import 'package:provider/provider.dart';

class CounterSection extends StatelessWidget {
  const CounterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black26,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Consumer<CartProvider>(
          builder: (context, value, child) {
            return Row(
              children: [
                InkWell(
                  onTap: () => value.increaseCounter(),
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 15),
                CustomText(
                  "${value.counter}",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(width: 15),
                InkWell(
                  onTap: () => value.decreaseCounter(),
                  child: Icon(Icons.remove),
                ),
              ],
            );
          },
        ));
  }
}
