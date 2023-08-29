import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/utils/constants/assets_constants.dart';

class RelatedItemsSection extends StatelessWidget {
  const RelatedItemsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return RelatedItemTile();
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 5,
        ),
      ),
    );
  }
}

class RelatedItemTile extends StatelessWidget {
  const RelatedItemTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage(AssetsConstants.pumpkin),
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
                "Grapes",
                fontSize: 11,
                fontWeight: FontWeight.w600,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
            CustomText(
              "\$10",
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
