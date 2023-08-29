import 'package:flutter/material.dart';
import 'package:grocery_app/utils/constants/assets_constants.dart';

class MiniImageTile extends StatelessWidget {
  const MiniImageTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        AssetsConstants.pumpkin,
        width: 70,
        height: 70,
        fit: BoxFit.cover,
      ),
    );
  }
}
