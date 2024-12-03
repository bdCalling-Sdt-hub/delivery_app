import 'package:delivery_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryHistoryCard extends StatelessWidget {
  final String imageUrl;
  final String subtitle;
  final String completedOrders;
  final VoidCallback onTap;

  const DeliveryHistoryCard({
    required this.imageUrl,
    required this.subtitle,
    required this.completedOrders,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353.w,
      height: 99.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          // Left Circle Icon
          Padding(
            padding: EdgeInsets.all(8.w),
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
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ),
          ),

          // Details Section
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Date Text
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),

                  // Completed Orders Text
                  Text(
                    'Completed Orders: $completedOrders',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Right Button
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                minimumSize: Size(64.w, 30.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
              child: Text(
                'View Details',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
