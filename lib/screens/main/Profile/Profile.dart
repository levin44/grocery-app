import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_button.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/assets_constants.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';

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
        child: Consumer<AuthProvider>(
          builder: (context, value, child) {
            return Column(
              children: [
                CustomText(
                  "Profile",
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
                SizedBox(height: 122),
                InkWell(
                  onTap: () => value.selectImage(context),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: value.isLoading
                          ? const CircularProgressIndicator()
                          : Image.network(
                              value.usermodel?.img ??
                                  AssetsConstants.profilepic,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            )
                      // : Image.file(
                      //     value.image,
                      //     width: 200,
                      //     height: 200,
                      //   ),
                      ),
                ),
                SizedBox(height: 30),
                CustomText(
                  value.usermodel?.name ?? "",
                  fontSize: 18,
                ),
                SizedBox(height: 8),
                CustomText(
                  value.usermodel?.email ?? "",
                  fontSize: 13,
                  color: AppColors.lightblue,
                ),
                SizedBox(height: 200),
                CustomButton(
                  onTap: () => Provider.of<AuthProvider>(context, listen: false)
                      .logOut(),
                  text: "Logout",
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
