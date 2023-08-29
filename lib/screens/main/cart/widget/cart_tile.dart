import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/components/mini_image_tile.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
  });

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
                    "Grapes",
                    fontSize: 14,
                  ),
                  Row(
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
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.close,
                color: Colors.red,
              ),
              CustomText(
                "152.00",
                fontSize: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
