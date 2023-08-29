import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_button.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/components/custom_textfield.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/assets_constants.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _email = TextEditingController();
  final _name = TextEditingController();
  final _password = TextEditingController();
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
                  controller: _name,
                  hintText: 'Name',
                ),
                SizedBox(height: 8),
                customTextfield(
                  controller: _email,
                  hintText: 'Email',
                ),
                SizedBox(height: 8),
                customTextfield(
                  controller: _password,
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
                CustomButton(
                  onTap: () {},
                  text: "SignUp",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
