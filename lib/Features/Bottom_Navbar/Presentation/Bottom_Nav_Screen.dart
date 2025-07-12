import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_mart/Core/Constant/App_Colors/App_Colors.dart';
import 'package:grocery_mart/Core/Constant/Images/Svg_Names/Svg_Names.dart';

import 'package:grocery_mart/Features/Cart/Presentation/Ui/Cart_Screen.dart';
import 'package:grocery_mart/Features/Shop/Presentation/Ui/Shop_Screen.dart';
import 'package:grocery_mart/Features/Under_Development/Presentation/Ui/Under_Dev_Screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ShopScreen(),
    const UnderDevelopmentScreen(), // Explore
    const CartScreen(),
    const UnderDevelopmentScreen(), // Favourite
    const UnderDevelopmentScreen(), // Profile
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _svgNavItem({
    required String assetPath,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        assetPath,
        width: 20.w,
        height: 20.h,
        colorFilter: ColorFilter.mode(
          isSelected ? AppColors.primary : Colors.grey,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }

  BottomNavigationBarItem _iconNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          _svgNavItem(
            assetPath: SvgName.shop,
            label: 'Shop',
            isSelected: _selectedIndex == 0,
          ),
          _svgNavItem(
            assetPath: SvgName.explore,
            label: 'Explore',
            isSelected: _selectedIndex == 1,
          ),
          _svgNavItem(
            assetPath: SvgName.cart,
            label: 'Cart',
            isSelected: _selectedIndex == 2,
          ),
          _iconNavItem(Icons.favorite, 'Favourite'),
          _iconNavItem(Icons.person, 'Profile'),
        ],
      ),
    );
  }
}
