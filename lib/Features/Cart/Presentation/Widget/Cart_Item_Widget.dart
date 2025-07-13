import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_mart/Core/Constant/App_Colors/App_Colors.dart';
import 'package:grocery_mart/Features/Cart/Domain/Entity/Cart_Entity.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemEntity item;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback onDelete;

  const CartItemWidget({
    Key? key,
    required this.item,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              item.imageUrl,
              width: 80.w,
              height: 80.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),

          // Details and controls
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Delete icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Product Name
                    Expanded(
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Cross (Delete)
                    GestureDetector(
                      onTap: onDelete,
                      child: Icon(Icons.close, color: Colors.grey, size: 20.sp),
                    ),
                  ],
                ),

                SizedBox(height: 4.h),

                // Product Detail
                Text(
                  item.productDetail,
                  style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 10.h),

                // Quantity controls and price
                Row(
                  children: [
                    // Minus
                    GestureDetector(
                      onTap: onRemove,
                      child: Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(8.5.r),
                        ),
                        child: Icon(
                          Icons.remove,
                          size: 14.sp,
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),

                    // Quantity Display
                    Text(
                      quantity.toString(),
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(width: 12.w),

                    // Plus
                    GestureDetector(
                      onTap: onAdd,
                      child: Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(8.5.r),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 14.sp,
                          color: AppColors.primary,
                        ),
                      ),
                    ),

                    Spacer(),

                    // Price
                    Text(
                      '\$${(item.price * quantity).toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
