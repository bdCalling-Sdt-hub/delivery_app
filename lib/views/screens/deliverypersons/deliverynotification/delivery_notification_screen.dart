import 'package:delivery_app/utils/app_colors.dart';
import 'package:delivery_app/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeliveryNotificationScreen extends StatelessWidget {
  const DeliveryNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// =================> Header Section with Icons =================>
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                /// Background Image
                Container(
                  color: AppColors.primaryColor,
                  width: MediaQuery.of(context).size.width,
                  height: 100.h,
                ),
                /// Header Content
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  child: Row(
                    children: [
                      /// Back Button Icon
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          'assets/icons/lessthan.svg',
                          height: 18.h,
                          width: 18.w,
                          color: Colors.white,
                        ),
                      ),
                      /// Title
                      Expanded(
                        child: Center(
                          child: Text(
                            'Notification',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// Spacing
            SizedBox(height: 15.h),
            /// =================> Notification List =================>
            Expanded(
              child: ListView(
                children: [
                  /// New Entry Notification
                  notificationTile(
                    title: 'New Entry',
                    subtitle: 'You have new Contest in this space.',
                    time: '10:24 PM',
                    showDot: true,
                  ),
                  SizedBox(height: 5.h),
                  /// New Request Notification
                  notificationTile(
                    title: 'New Request',
                    subtitle: 'Your request created successfully.',
                    time: 'Today',
                  ),
                  SizedBox(height: 5.h),
                  /// New Article Added Notification
                  notificationTile(
                    title: 'New Article Added',
                    subtitle: 'Just new request added.',
                    time: 'Yesterday',
                  ),
                  SizedBox(height: 5.h),
                  /// Changes Password Notification
                  notificationTile(
                    title: 'Changes Password',
                    subtitle: 'Your password successfully changed.',
                    time: '12/04/2024',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Reusable Notification Tile Widget
  Widget notificationTile({
    required String title,
    required String subtitle,
    required String time,
    bool showDot = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(
            left: BorderSide(
              color: AppColors.textColor99979D,
              width: 1,
            ),
          ),
        ),
        padding: EdgeInsets.all(15.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Icon
            Container(
              height: 40.h,
              width: 40.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.all(8.h),
                child: SvgPicture.asset(
                  'assets/icons/notifications.svg',
                  color: Colors.white,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(width: 15.w),
            /// Notification Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title Row
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor020202,
                          ),
                        ),
                      ),
                      if (showDot)
                        Icon(
                          Icons.circle,
                          color: Colors.red,
                          size: 8.h,
                        ),
                      SizedBox(width: 10.w),
                      /// Time
                      CustomText(
                        text: time,
                        fontsize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor99979D,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  /// Subtitle
                  CustomText(
                    text: subtitle,
                    fontsize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor6C6E72,
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
