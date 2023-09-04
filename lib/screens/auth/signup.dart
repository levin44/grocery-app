import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_button.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/components/custom_textfield.dart';
import 'package:grocery_app/controllers/auth_controller.dart';
import 'package:grocery_app/providers/auth_provider.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/assets_constants.dart';
import 'package:grocery_app/utils/helper/alert_helper.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 52),
                CustomText(
                  'SignUp',
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 41),
                Image.asset(
                  AssetsConstants.logo,
                  width: 202,
                  height: 138,
                ),
                SizedBox(height: 21),
                customTextfield(
                  controller: Provider.of<AuthProvider>(context).name,
                  hintText: 'Name',
                ),
                SizedBox(height: 8),
                customTextfield(
                  controller: Provider.of<AuthProvider>(context).email,
                  hintText: 'Email',
                ),
                SizedBox(height: 8),
                customTextfield(
                  controller: Provider.of<AuthProvider>(context).password,
                  hintText: 'Password',
                  obscureText: true,
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {},
                    child: CustomText(
                      'Already have an account?',
                      color: Color(0xFF222222),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 29),
                Consumer<AuthProvider>(
                  builder: (context, value, child) {
                    return CustomButton(
                      isLoading: value.isLoading,
                      onTap: () {
                        value.startSignup(context);
                      },
                      text: "SignUp",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
