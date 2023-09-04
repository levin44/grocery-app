import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:grocery_app/components/custom_button.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/components/custom_textfield.dart';
import 'package:grocery_app/screens/auth/signup.dart';
import 'package:grocery_app/screens/main/main_screen.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/assets_constants.dart';
import 'package:grocery_app/utils/helper/alert_helper.dart';
import 'package:logger/logger.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 52),
                CustomText(
                  'Login',
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
                  controller: _email,
                  hintText: 'email',
                ),
                SizedBox(height: 8),
                customTextfield(
                  controller: _password,
                  hintText: 'password',
                  obscureText: true,
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {},
                    child: CustomText(
                      'Forgot your password?',
                      color: Color(0xFF222222),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 29),
                CustomButton(
                  onTap: () {
                    // Logger().i(_email.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()));
                  },
                  text: "Login",
                ),
                SizedBox(height: 23),
                CustomText(
                  'Or login with social account',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterSocialButton(
                      onTap: () {},
                      buttonType: ButtonType.google,
                      mini: true,
                    ),
                    SizedBox(width: 16),
                    FlutterSocialButton(
                      onTap: () {},
                      buttonType: ButtonType.facebook,
                      mini: true,
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  //validate text inputs
  bool validateFields() {
    if (_password.text.isEmpty || _email.text.isEmpty) {
      Logger().w("fill all");
      AlertHelper.showAlert(context, "fill all");
      return false;
    } else if (!_email.text.contains("@")) {
      Logger().w("please enter valid email");
      AlertHelper.showAlert(context, "enter valid email");
      return false;
    } else if (_password.text.length < 6) {
      Logger().w("password need 6 digits");
      AlertHelper.showAlert(context, "password need 6 digits");
      return false;
    } else {
      Logger().w("all good");
      return true;
    }
  }
}
