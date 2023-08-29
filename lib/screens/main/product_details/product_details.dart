import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/components/custom_button.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/screens/main/cart/cart.dart';
import 'package:grocery_app/screens/main/product_details/widgets/counter_section.dart';
import 'package:grocery_app/screens/main/product_details/widgets/related_items_section.dart';

import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/assets_constants.dart';
import 'package:grocery_app/utils/constants/size_config.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: SizeConfig.w(context),
        height: SizeConfig.h(context),
        child: Stack(
          children: [
            UpperSection(),
            Positioned(
              top: 256,
              child: ProductDetailsSection(),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Cart()));
                      },
                      text: "Add to cart"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.w(context),
      height: SizeConfig.h(context),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(34),
          topRight: Radius.circular(34),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(29, 34, 29, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  "Grapes",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                CounterSection(),
              ],
            ),
            SizedBox(height: 21),
            CustomText(
              "\$2.50 /kg",
              fontSize: 14,
            ),
            SizedBox(height: 28),
            CustomText(
              AssetsConstants.para,
              fontSize: 13,
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 26),
            CustomText(
              "Related items",
              fontSize: 14,
              color: AppColors.darkgreen,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 20),
            RelatedItemsSection(),
          ],
        ),
      ),
    );
  }
}

class UpperSection extends StatelessWidget {
  const UpperSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: SizeConfig.w(context),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: Colors.amber,
        image: DecorationImage(
          image: AssetImage(AssetsConstants.pumpkin),
          fit: BoxFit.cover,
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 31, top: 46),
          child: SvgPicture.asset(
            AssetsConstants.backIcon,
            height: 25,
            width: 25,
          ),
        ),
      ),
    );
  }
}
