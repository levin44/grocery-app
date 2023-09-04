import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isLoading = false,
  });

  final String text;
  final Function() onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: 259,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: isLoading
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            : CustomText(
                text,
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
      ),
    );
  }
}
