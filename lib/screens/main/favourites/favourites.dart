import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/providers/home/product_provider.dart';
import 'package:grocery_app/screens/main/favourites/widgets/fav_tile.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:provider/provider.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Center(
            child: CustomText(
              "Favourites",
              fontSize: 25,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 18),
          Expanded(child: Consumer<ProductProvider>(
            builder: (context, value, child) {
              return value.favProducts.isEmpty
                  ? Center(child: const CustomText("No Favorite items"))
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      itemBuilder: (context, index) {
                        return FavTile(
                          model: value.favProducts[index],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20),
                      itemCount: value.favProducts.length);
            },
          ))
        ],
      ),
    );
  }
}
