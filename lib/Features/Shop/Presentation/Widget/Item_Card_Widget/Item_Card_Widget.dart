import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_mart/Core/Constant/App_Colors/App_Colors.dart';
import 'package:grocery_mart/Core/Constant/Route_Names/Route_Names.dart';
import 'package:grocery_mart/Features/Shop/Domain/Entity/Entity.dart';

class ItemCardWidget extends StatelessWidget {
  final CardItemEntity item;

  const ItemCardWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 200.h,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.backgroundLight, width: 2.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          SizedBox(
            height: 90.h,
            width: double.infinity,
            child: Image.asset(item.imageUrl, fit: BoxFit.contain),
          ),

          SizedBox(height: 8.h),

          // Name
          Text(
            item.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              // color: c,
            ),
          ),

          SizedBox(height: 4.h),

          // Quantity
          Text(
            '${item.quantity} pcs',
            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
          ),

          const Spacer(),

          // Price + Button Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Price
              Text(
                '\$${item.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  // color: AppColors.textDark,
                ),
              ),

              // Plus Button
              GestureDetector(
                onTap: () {
                  print("${item.id}");
                  Navigator.pushNamed(
                    context,
                    RouteName.detail,
                    arguments: {
                      'item': item,
                      'color':
                          AppColors.bgColors[int.parse(item.id) %
                              AppColors.bgColors.length],
                    },
                  );
                },
                child: Container(
                  width: 30.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(Icons.add, size: 18.sp, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
