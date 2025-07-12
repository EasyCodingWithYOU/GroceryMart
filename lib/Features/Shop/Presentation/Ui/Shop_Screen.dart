import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_mart/Core/Constant/App_Colors/App_Colors.dart';
import 'package:grocery_mart/Core/Constant/Images/Svg_Names/Svg_Names.dart';

import 'package:grocery_mart/Core/Dummy_Data/Card_Items.dart';
import 'package:grocery_mart/Features/Shop/Presentation/Widget/Grocery_Widget/Grocery_Widget.dart';

import 'package:grocery_mart/Features/Shop/Presentation/Widget/Item_Card_Widget/Item_Card_Widget.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> bannerImages = [
    'Assets/Png/Apple.png',
    'Assets/Png/Banana.png',
    'Assets/Png/Bakery.png',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: SvgPicture.asset(SvgName.colorLogo, height: 30.h),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.textColordark,
                  size: 20.sp,
                ),
                SizedBox(width: 4.w),
                Text(
                  'Dhaka, Banassre',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    // color: AppColors.textDark,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),

            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: AppColors.textColordark),
                  hintText: 'Search Store',
                  border: InputBorder.none,
                ),
              ),
            ),

            SizedBox(height: 20.h),

            // Slider with indicators
            Stack(
              children: [
                SizedBox(
                  height: 150.h,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: bannerImages.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          color: AppColors.bgOrange,
                          borderRadius: BorderRadius.circular(16.r),
                          image: DecorationImage(
                            image: AssetImage(bannerImages[index]),
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 10.h),

                // Page Indicator
                Positioned(
                  bottom: 20.h,
                  left: 0,
                  right: 0,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(bannerImages.length, (index) {
                      final bool isSelected = _currentPage == index;
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        width: isSelected ? 20.w : 8.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.backgroundLight,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            //Category Exclusive Offers'
            // Section Heading
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Exclusive Offers',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    // color: AppColors.textDark,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 8.h),

            // Item List
            SizedBox(
              height: 220.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyCardItems.length,
                itemBuilder: (context, index) {
                  final item = dummyCardItems[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: ItemCardWidget(item: item),
                  );
                },
              ),
            ),
            // end Exclusive Offers'
            SizedBox(height: 20.h),
            //Category Best Selling
            // Section Heading
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Best Selling',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    // color: AppColors.textDark,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 8.h),

            // Item List
            SizedBox(
              height: 220.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyCardItems.length,
                itemBuilder: (context, index) {
                  final item = dummyCardItems[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: ItemCardWidget(item: item),
                  );
                },
              ),
            ),

            // end Best Selling
            SizedBox(height: 20.h),
            //Category Groceries
            // Section Heading
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Groceries',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    // color: AppColors.textDark,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 8.h),
            SizedBox(
              height: 120.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyCardItems.length,
                itemBuilder: (context, index) {
                  final item = dummyCardItems[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: GroceryWidget(
                      item: item,
                      backgroundColor:
                          AppColors.bgColors[index %
                              AppColors.bgColors.length], // your defined color
                    ),
                  );
                },
              ),
            ),
            // end Groceries
            // All Items
            SizedBox(height: 20.h),

            // Section Heading
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Items',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    // color: AppColors.textDark,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 8.h),

            // Item List
            SizedBox(
              height: 220.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyCardItems.length,
                itemBuilder: (context, index) {
                  final item = dummyCardItems[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: ItemCardWidget(item: item),
                  );
                },
              ),
            ),

            // end All Items
          ],
        ),
      ),
    );
  }
}
