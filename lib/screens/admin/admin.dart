import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_button.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/components/custom_textfield.dart';
import 'package:grocery_app/controllers/auth_controller.dart';
import 'package:grocery_app/providers/admin/admin_provider.dart';
import 'package:grocery_app/providers/auth/auth_provider.dart';
import 'package:grocery_app/screens/auth/login.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/assets_constants.dart';
import 'package:grocery_app/utils/helper/alert_helper.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButton(),
                Center(
                  child: CustomText(
                    'Admin Section',
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 21),
                Center(child: Consumer<AdminProvider>(
                  builder: (context, value, child) {
                    return value.pImage.path == ""
                        ? IconButton(
                            onPressed: () => value.selectProductImage(context),
                            icon: Icon(
                              Icons.photo,
                              size: 50,
                            ),
                          )
                        : InkWell(
                            onTap: () => value.selectProductImage(context),
                            child: Image.file(
                              value.pImage,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          );
                  },
                )),
                SizedBox(height: 21),
                customTextfield(
                  controller: Provider.of<AdminProvider>(context).pName,
                  hintText: 'Enter the product name',
                ),
                SizedBox(height: 8),
                customTextfield(
                  controller: Provider.of<AdminProvider>(context).productDes,
                  hintText: 'Enter the product description',
                ),
                SizedBox(height: 8),
                customTextfield(
                  controller: Provider.of<AdminProvider>(context).price,
                  hintText: 'Enter the product price',
                ),
                SizedBox(height: 29),
                Consumer<AdminProvider>(
                  builder: (context, value, child) {
                    return Center(
                      child: CustomButton(
                        isLoading: value.isLoading,
                        onTap: () {
                          value.startSaveProductData(context);
                        },
                        text: "Save Product",
                      ),
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
