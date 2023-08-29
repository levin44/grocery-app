import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_button.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/assets_constants.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            CustomText(
              "Profile",
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 122),
            ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: Image.asset(
                AssetsConstants.profilepic,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30),
            CustomText(
              "Nisal Dayan",
              fontSize: 18,
            ),
            SizedBox(height: 8),
            CustomText(
              "nisaldayan@gmail.com",
              fontSize: 13,
              color: AppColors.lightblue,
            ),
            SizedBox(height: 200),
            CustomButton(onTap: () {}, text: "Logout")
          ],
        ),
      ),
    );
  }
}
