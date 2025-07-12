import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_mart/Features/Shop/Domain/Entity/Entity.dart';

class GroceryWidget extends StatelessWidget {
  final CardItemEntity item;
  final Color backgroundColor;

  const GroceryWidget({
    Key? key,
    required this.item,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw / 1.5, // ¼ of the screen width
      height: 150.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              item.imageUrl,
              width: 70.w,
              height: 70.w,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 6.w),

          // Name
          Expanded(
            child: Text(
              item.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
