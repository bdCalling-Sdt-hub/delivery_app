import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String title;
  final num index;
  final String subtitle;
  final String icon;
  final VoidCallback onTap;

  const HistoryCard({
    required this.imageUrl,
    required this.name,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 353.w,
        height: 99.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.r),
          ),
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
            width: 0.5,
          ),
        ),
        child: Row(
          children: [
            /// Left Icon/Image
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Container(
                width: 48.w,
                height: 48.h,
                decoration: const BoxDecoration(
                  color: Color(0xFFFEF2E8),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    imageUrl,
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
              ),
            ),
            /// Details Section
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Status Section (Completed)
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: index == 0 ? Colors.orange : Colors.green,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      index == 0 ? "Inprogress" : "Completed",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 29.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16.sp),
                      Text(
                        "4.${5 + index}",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}