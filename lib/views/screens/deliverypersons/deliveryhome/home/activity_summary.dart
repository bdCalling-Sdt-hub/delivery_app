import 'package:delivery_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_images.dart';
import '../../../../widgets/custom_text.dart';

class ActivitySummaryScreen extends StatelessWidget {
  const ActivitySummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF0F5E9), Color(0xFFFFFFFF)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// ======================================>  Header Section ===============================>
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

                    /// Background Overlay
                    Container(
                      color: AppColors.primaryColor,
                      width: MediaQuery.of(context).size.width,
                      height: 100.h,
                    ),

                    /// Header Content
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
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
                              child: CustomText(
                                text: "Activity Summary".tr,
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

                SizedBox(height: 20.h),
                /// ======================================> Completed Deliveries Section ======================>
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBE9E7),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Left Section: Icon and Text
                        Row(
                          children: [
                            /// Icon
                            Container(
                              height: 40.w,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFAB91),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Image.asset(
                                AppImages.deliverybennerImage,
                                height: 108.h,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            /// Text
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Completed Deliveries".tr,
                                  fontsize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF333333),
                                ),
                                SizedBox(height: 4.h),
                                /// Number
                                CustomText(
                                  text: "120".tr,
                                  fontsize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                        /// Right-Aligned Icon
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoutes.ordersScreen);
                          },
                          child: Center(
                            child: SvgPicture.asset('assets/icons/go.svg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h),

                /// ======================================> Problem Encountered Section ======================>
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                /// Icon
                                Container(
                                  height: 40.w,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFA5D6A7),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/icons/problem.svg',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                SizedBox(width: 12.w),

                                /// Text
                                CustomText(
                                  text: "Problem Encountered".tr,
                                  fontsize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF333333),
                                ),
                              ],
                            ),

                            /// Number
                            CustomText(
                              text: "120".tr,
                              fontsize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),

                        /// List of problems
                        CustomText(
                          text: "1. Lorem ipsum dolor sit amet consectetur.".tr,
                          fontsize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF333333),
                        ),
                        SizedBox(height: 4.h),
                        CustomText(
                          text: "2. Lorem ipsum dolor sit amet consectetur.".tr,
                          fontsize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF333333),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                /// ======================================> General Comment Section ======================>
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "General Comment on the Way".tr,
                        fontsize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF333333),
                      ),
                      SizedBox(height: 10.h),
                      CustomText(
                        text: "Lorem ipsum dolor sit amet consectetur. Consectetur pharetra nullam purus sed in arcu. Turpis non lectus fames congue interdum in nibh nulla. Massa non cursus donec duis.ehicula.".tr,
                        fontsize: 14.sp,
                        fontWeight: FontWeight.w400,
                        maxline: 5,
                        textAlign: TextAlign.start,
                        color:AppColors.textColor6C6E72,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 332.h),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
