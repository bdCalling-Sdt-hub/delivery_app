import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String title;
  final String subtitle;
  final String deliveryStatus;
  final String quantity;
  final String location;
  final String comment;
  final VoidCallback onTap;

  const OrderCard({
    required this.imageUrl,
    required this.name,
    required this.title,
    required this.subtitle,
    required this.deliveryStatus,
    required this.quantity,
    required this.location,
    required this.comment,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8.r,
              spreadRadius: 2.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  imageUrl,
                  width: 341.w,
                  height: 153.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            // Name and Delivery Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: deliveryStatus == "Not Delivered"
                        ? Colors.red.withOpacity(0.1)
                        : Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    deliveryStatus,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: deliveryStatus == "Not Delivered"
                          ? Colors.red
                          : Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            // Quantity and Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Quantity: $quantity",
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            // Location and Buckets Delivered
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_pin, size: 16.sp, color: Colors.orange),
                    SizedBox(width: 4.w),
                    Text(
                      location,
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  "No. of Buckets Delivered: 20",
                  style: TextStyle(fontSize: 12.sp, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            // Comment
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.account_circle, size: 24.sp, color: Colors.grey),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    comment,
                    style: TextStyle(fontSize: 12.sp, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            // View All Comments
            GestureDetector(
              onTap: onTap,
              child: Text(
                "View all comments",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
