import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/components/custom_button.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/assets_constants.dart';

class DialogBoxContent extends StatelessWidget {
  const DialogBoxContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 333,
              height: 300,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AssetsConstants.dialogImg),
                    SizedBox(height: 23),
                    CustomText(
                      "Thanks for Buying\nFrom Us!",
                      fontSize: 20,
                      color: AppColors.primaryColor,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -20,
              child: CustomButton(
                onTap: () {},
                text: "See your order",
              ),
            )
          ],
        ),
      ],
    );
  }
}
