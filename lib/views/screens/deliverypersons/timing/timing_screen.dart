import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_images.dart';
import '../../../widgets/custom_text.dart';
import '../deliverybottomnavbar/delivery_bottom_navbar.dart';

class TimingScreen extends StatelessWidget {
  const TimingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DeliveryBottomNavBar(2),
      body: Container(
        color: const Color(0xFFF0F5E9),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ==============================> Header Section ============================>
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    /// Background Banner
                    Image.asset(
                      AppImages.articleImage,
                      width: MediaQuery.of(context).size.width,
                      height: 135.h,
                      fit: BoxFit.cover,
                    ),

                    /// Background Color Overlay
                    Container(
                      color: AppColors.primaryColor,
                      width: MediaQuery.of(context).size.width,
                      height: 100.h,
                    ),

                    /// Header Content
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 20.h),
                      child: Row(
                        children: [
                          /// Back Button Icon
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(
                              'assets/icons/lessthan.svg',
                              height: 20.h,
                              width: 20.w,
                              color: Colors.white,
                            ),
                          ),

                          /// Title
                          Expanded(
                            child: Center(
                              child: CustomText(
                                text: "Timing",
                                fontsize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 19.h),

                /// ==============================> Timing Section ============================>
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      _buildTimingRow("Sunday", "OFF", null, null,
                          textColor: Colors.black),
                      ...[
                        "Monday",
                        "Tuesday",
                        "Wednesday",
                        "Thursday",
                        "Friday",
                        "Saturday"
                      ].map((day) {
                        return _buildTimingRow(
                          day,
                          "9 : 00 AM",
                          "4 : 00 PM",
                          const Color(0xFFF0F5E9),
                          textColor: const Color(0xFF669B27),
                        );
                      }).toList(),
                    ],
                  ),
                ),

                SizedBox(height: 27.h),

                /// ====================================> Image ===============================>
                Center(
                  child: Image.asset(
                    AppImages.timeImage,
                    width: 271.15.w,
                    height: 236.24.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 27.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ============================> Helper Widget for Row ============================>
  Widget _buildTimingRow(String day, String timeStart, String? timeEnd,
      Color? backgroundColor,
      {required Color textColor}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: day,
            fontsize: 16.sp,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
          Row(
            children: [
              CustomText(
                text: timeStart,
                fontsize: 16.sp,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
              if (timeEnd != null) ...[
                SizedBox(width: 20.w),
                CustomText(
                  text: timeEnd,
                  fontsize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
