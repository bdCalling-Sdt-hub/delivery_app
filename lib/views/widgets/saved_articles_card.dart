import 'package:delivery_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SavedArticlesCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String title;
  final String subtitle;
  final String icon;
  final VoidCallback onTap;

  const SavedArticlesCard({
    required this.imageUrl,
    required this.name,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170.w,
        height: 176.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
            width: 0.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            /// =======================================>  Image Section ============================>
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
              child: Image.asset(
                imageUrl,
                width: double.infinity,
                height: 125.h,
                fit: BoxFit.cover,
              ),
            ),
            /// ============================> Icon in Top-Right Corner ===============================>
            if (icon.isNotEmpty)
              Positioned(
                top: 6.h,
                right: 6.w,
                child: Image.asset(
                  icon,
                  width: 40.w,
                  height: 30.h,
                ),
              ),

            /// ==============================> Card Details ===============================>
            Positioned(
              bottom: 8.h,
              left: 8.w,
              right: 8.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ==============================> Name ===============================>
                  Text(
                    name.tr,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor020202,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  /// ==============================>  Title ===============================>
                  Text(
                    title.tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textColor6C6E72,
                    ),
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
