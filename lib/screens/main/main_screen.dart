import 'package:flutter/material.dart';
import 'package:grocery_app/screens/main/Profile/Profile.dart';
import 'package:grocery_app/screens/main/Search/Search.dart';
import 'package:grocery_app/screens/main/favourites/favourites.dart';
import 'package:grocery_app/screens/main/home/home.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:logger/logger.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //to store the active bottom navigation bar index
  int _activeIndex = 0;
// trigger when bottom bar item is clicked
  void onItemTapped(int i) {
    setState(() {
      _activeIndex = i;
    });
  }

//screens list
  final List<Widget> _screens = [
    Home(),
    Favourites(),
    Search(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_activeIndex],
      bottomNavigationBar: Container(
        height: 83,
        color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavTile(
              icon: Icons.home,
              isActive: _activeIndex == 0,
              onTap: () => onItemTapped(0),
            ),
            BottomNavTile(
              icon: Icons.favorite_border,
              isActive: _activeIndex == 1,
              onTap: () => onItemTapped(1),
            ),
            BottomNavTile(
              icon: Icons.search,
              isActive: _activeIndex == 2,
              onTap: () => onItemTapped(2),
            ),
            BottomNavTile(
              icon: Icons.person,
              isActive: _activeIndex == 3,
              onTap: () => onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavTile extends StatelessWidget {
  const BottomNavTile({
    super.key,
    required this.isActive,
    required this.icon,
    required this.onTap,
  });

  final bool isActive;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        size: 33,
        color: isActive ? AppColors.primaryColor : Colors.black26,
      ),
    );
  }
}
