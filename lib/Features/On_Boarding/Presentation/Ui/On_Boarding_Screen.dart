import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_mart/Core/Constant/App_Colors/App_Colors.dart';
import 'package:grocery_mart/Core/Constant/Images/Png_Names/Png_Names.dart';
import 'package:grocery_mart/Core/Constant/Images/Svg_Names/Svg_Names.dart';
import 'package:grocery_mart/Core/Constant/Route_Names/Route_Names.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          // Background SVG
          Positioned.fill(
            child: Image.asset(
              ImageName.background,
              width: 100.w,
              height: 180.h,

              fit: BoxFit.cover,
            ),
          ),

          // Foreground content
          Positioned.fill(
            child: Column(
              children: [
                const Spacer(),

                // Logo SVG (responsive to iPhone 15 Pro)
                Center(
                  child: SvgPicture.asset(
                    SvgName.logo,
                    width: 80.w,
                    height: 80.h,
                  ),
                ),

                SizedBox(height: 20.h),

                // Welcome Text
                Text(
                  "Welcome\nto our store",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 46.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.4,
                  ),
                ),

                SizedBox(height: 10.h),

                // Description
                Text(
                  "Get your groceries in as fast as one hour",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xB2FCFCFC),
                  ),
                ),

                SizedBox(height: 40.h),

                // Get Started Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RouteName.bottomNavBar,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                      ),
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 40.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
