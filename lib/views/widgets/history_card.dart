import 'package:delivery_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor020202,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor6C6E72,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/calendar.svg',
                          width: 24.w,
                          height: 24.h,
                          color: AppColors.orangeF37B1C,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.textColor6C6E72,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            /// Status Section (Completed or Inprogress)
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: index == 0
                          ? const Color(0xFFFFF1DC)
                          : const Color(0xFFEFFFD9),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      index == 0 ? "Inprogress" : "Completed",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: index == 0
                            ? const Color(0xFFE68800)
                            : const Color(0xFF65B902),
                      ),
                    ),
                  ),
                  SizedBox(height: 29.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16.sp),
                      SizedBox(width: 4.w),
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
