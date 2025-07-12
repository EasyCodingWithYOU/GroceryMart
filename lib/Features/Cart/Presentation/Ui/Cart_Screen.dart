import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_mart/Core/Constant/App_Colors/App_Colors.dart';
import 'package:grocery_mart/Core/Dummy_Data/Card_Items.dart';
import 'package:grocery_mart/Features/Cart/Presentation/Widget/Cart_Item_Widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Cart'),
        surfaceTintColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: dummyCardItems.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.w),
                    child: CartItemWidget(
                      item: dummyCardItems[index],
                      quantity: 2,
                      onAdd: () {
                        // increase quantity logic
                      },
                      onRemove: () {
                        // decrease quantity logic
                      },
                      onDelete: () {
                        // delete item logic
                      },
                    ),
                  ),
                  Divider(thickness: 1, color: Colors.grey.shade300),
                ],
              );
            },
          ),
          Positioned(
            bottom: 20.h,
            left: 10.w,
            right: 10.w,
            child: SizedBox(
              // width: double.infinity,
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
                  'Go to Checkout',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
