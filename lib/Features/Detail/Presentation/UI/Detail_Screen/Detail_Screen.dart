import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_mart/Core/Constant/App_Colors/App_Colors.dart';
import 'package:grocery_mart/Features/Detail/Presentation/UI/Widgets/Expandable_Review_Tile.dart';
import 'package:grocery_mart/Features/Detail/Presentation/UI/Widgets/Expandable_Tile.dart';
import 'package:grocery_mart/Features/Shop/Domain/Entity/Entity.dart';

class DetailScreen extends StatefulWidget {
  final CardItemEntity item;
  final Color backgroundColor;

  const DetailScreen({
    Key? key,
    required this.item,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantity = 1;
  bool expandDetail = false;
  bool expandNutrition = false;
  bool expandReview = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Section
            Container(
              height: 1.sh / 3,
              width: double.infinity,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32.r),
                  bottomRight: Radius.circular(32.r),
                ),
              ),
              child: Stack(
                children: [
                  // Back & Share Icons
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 24.h,
                    ),
                    child: SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(Icons.arrow_back, size: 30.sp),
                          ),
                          Icon(Icons.share, size: 30.sp),
                        ],
                      ),
                    ),
                  ),

                  // Product Image Center
                  SafeArea(
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        item.imageUrl,
                        height: 200.h,
                        width: 200.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Item name + quantity + favourite
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '${item.quantity} pcs',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ],
                      ),
                      Icon(
                        item.favourite ? Icons.favorite : Icons.favorite_border,
                        color: item.favourite ? Colors.red : Colors.grey,
                        size: 26.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // Quantity Controller + Price
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (quantity > 1) {
                            setState(() => quantity--);
                          }
                        },
                        child: Icon(Icons.remove, size: 18.sp),
                      ),
                      SizedBox(width: 22.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Text(
                          quantity.toString(),
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      GestureDetector(
                        onTap: () => setState(() => quantity++),
                        child: Icon(
                          Icons.add,
                          size: 22.sp,
                          color: AppColors.primary,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '\$${(item.price * quantity).toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Divider(thickness: 1, color: Colors.grey.shade300),

                  // Expandable Sections
                  ExpandableTile(
                    title: 'Product Detail',
                    content: item.productDetail,
                    isExpanded: expandDetail,
                    onTap: () {
                      setState(() => expandDetail = !expandDetail);
                    },
                  ),
                  Divider(thickness: 1, color: Colors.grey.shade300),
                  ExpandableTile(
                    title: 'Nutrition',
                    content: item.nutrition,
                    isExpanded: expandNutrition,
                    onTap: () {
                      setState(() => expandNutrition = !expandNutrition);
                    },
                  ),
                  Divider(thickness: 1, color: Colors.grey.shade300),
                  ExpandableReviewTile(
                    title: 'Review',
                    content: item.review,
                    rating: item.rating,
                    isExpanded: expandReview,
                    onTap: () {
                      setState(() => expandReview = !expandReview);
                    },
                  ),
                  SizedBox(height: 20.h),

                  // Add to Basket Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add to basket logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                      ),
                      child: Text(
                        'Add To Basket',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
