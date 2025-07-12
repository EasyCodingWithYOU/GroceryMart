import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandableReviewTile extends StatelessWidget {
  final String title;
  final String content;
  final double rating;
  final bool isExpanded;
  final VoidCallback onTap;

  const ExpandableReviewTile({
    Key? key,
    required this.title,
    required this.content,
    required this.rating,
    required this.isExpanded,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Row with Arrow and Stars (if not expanded)
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Title + stars when not expanded
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                Row(
                  children: [
                    if (!isExpanded) _buildStarRow(rating),
                    SizedBox(width: 8.w),
                    // Arrow Icon
                    AnimatedRotation(
                      turns: isExpanded ? 0.25 : 0.0,
                      duration: Duration(milliseconds: 200),
                      child: Icon(Icons.arrow_forward_ios_rounded, size: 16.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Expanded Content
        AnimatedCrossFade(
          crossFadeState: isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: Duration(milliseconds: 250),
          firstChild: SizedBox.shrink(),
          secondChild: Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStarRow(rating),
                SizedBox(height: 8.h),
                Text(content, style: TextStyle(fontSize: 14.sp)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStarRow(double rating) {
    return Row(
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          // Full star
          return Icon(Icons.star, color: Colors.orange, size: 18.sp);
        } else if (index < rating && rating - index >= 0.5) {
          // Half star
          return Icon(Icons.star_half, color: Colors.orange, size: 18.sp);
        } else {
          // Empty star
          return Icon(Icons.star_border, color: Colors.orange, size: 18.sp);
        }
      }),
    );
  }
}
