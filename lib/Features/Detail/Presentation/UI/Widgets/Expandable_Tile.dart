import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandableTile extends StatelessWidget {
  final String title;
  final String content;
  final bool isExpanded;
  final VoidCallback onTap;

  const ExpandableTile({
    Key? key,
    required this.title,
    required this.content,
    required this.isExpanded,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Row
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
                AnimatedRotation(
                  turns: isExpanded ? 0.25 : 0.0,
                  duration: Duration(milliseconds: 200),
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 16.sp),
                ),
              ],
            ),
          ),
        ),

        // Expandable Content
        AnimatedCrossFade(
          firstChild: SizedBox.shrink(),
          secondChild: Text(content, style: TextStyle(fontSize: 14.sp)),
          crossFadeState: isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: Duration(milliseconds: 250),
        ),
      ],
    );
  }
}
