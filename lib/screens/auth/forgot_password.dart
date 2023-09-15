import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_button.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/components/custom_textfield.dart';
import 'package:grocery_app/providers/auth_provider.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/assets_constants.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 52),
              CustomText(
                'Forgot Password',
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
              SizedBox(height: 100),
              CustomText(
                'Please, enter your email address. You will receive a link to create a new password via email.',
                color: Color(0xFF222222),
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              SizedBox(height: 16),
              customTextfield(
                controller: Provider.of<AuthProvider>(context).resetEmail,
                hintText: 'Email',
              ),
              SizedBox(height: 68),
              Consumer<AuthProvider>(builder: (context, value, child) {
                return CustomButton(
                  onTap: () {
                    value.sendPasswordResetEmail(context);
                  },
                  isLoading: value.isLoading,
                  text: "Send",
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
