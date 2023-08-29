import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';

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
      child: Row(
        children: [
          InkWell(onTap: () {}, child: Icon(Icons.add)),
          SizedBox(width: 15),
          CustomText(
            "1",
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(width: 15),
          InkWell(onTap: () {}, child: Icon(Icons.remove)),
        ],
      ),
    );
  }
}
