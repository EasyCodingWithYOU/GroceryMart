import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_mart/Core/Constant/App_Colors/App_Colors.dart';
import 'package:grocery_mart/Features/Cart/Presentation/Widget/Cart_Item_Widget.dart';
import 'package:grocery_mart/Features/Cart/Presentation/bloc/cart_bloc.dart';
import 'package:grocery_mart/Features/Cart/Presentation/bloc/cart_event.dart';
import 'package:grocery_mart/Features/Cart/Presentation/bloc/cart_state.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(LoadCart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Cart',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CartLoaded) {
            final items = state.items;

            if (items.isEmpty) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "🛒 Your cart is empty.\nAdd something delicious!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              );
            }

            return Stack(
              children: [
                ListView.builder(
                  padding: EdgeInsets.only(bottom: 100.h),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 8.h,
                          ),
                          child: CartItemWidget(
                            item: item,
                            quantity: item.orderQuantity,
                            onAdd: () {
                              context.read<CartBloc>().add(
                                IncreaseQuantity(item.id),
                              );
                            },
                            onRemove: () {
                              if (item.orderQuantity > 1) {
                                context.read<CartBloc>().add(
                                  DecreaseQuantity(item.id),
                                );
                              }
                            },
                            onDelete: () {
                              context.read<CartBloc>().add(DeleteCart(item.id));
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
                  left: 16.w,
                  right: 16.w,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to checkout
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      elevation: 4,
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
              ],
            );
          }

          if (state is CartError) {
            return Center(
              child: Text(
                "❌ ${state.message}",
                style: TextStyle(fontSize: 16.sp, color: Colors.red),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
