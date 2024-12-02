import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_images.dart';
import '../../../../widgets/custom_text.dart';

class TermsServicesScreen extends StatelessWidget {
  const TermsServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                text: "Terms of Services",
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
                /// ==============================> Introduction Section ============================>
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/star.svg'),
                          SizedBox(width: 8.w),
                          CustomText(
                            text: "Introduction",
                            fontsize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor020202,
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      /// Content
                      CustomText(
                        text:
                        "Lorem ipsum dolor sit amet consectetur. Pharetra odio porta vulputate elit eu nibh cursus neque. Amet scelerisque sit magna massa. Rutrum amet lorem dictum in. Malesuada hac cum arcu magna nunc.\n\n""Lorem ipsum dolor sit amet consectetur. Pharetra odio porta vulputate elit eu nibh cursus neque. Amet scelerisque sit magna massa. Rutrum amet lorem dictum in. Malesuada hac cum arcu magna nunc.",
                        fontsize: 12.sp,
                        textAlign: TextAlign.start,
                        maxline: 10,
                        color: AppColors.textColor6C6E72,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                /// Terms of Use Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/star.svg'),
                          SizedBox(width: 8.w),
                          CustomText(
                            text: "Terms of Service",
                            fontsize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color:AppColors.textColor020202,
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      /// Content
                      CustomText(
                        text:
                        "Lorem ipsum dolor sit amet consectetur. Pharetra odio porta vulputate elit eu nibh cursus neque. Amet scelerisque sit magna massa. Rutrum amet lorem dictum in. Malesuada hac cum arcu magna nunc.\n\n""Lorem ipsum dolor sit amet consectetur. Pharetra odio porta vulputate elit eu nibh cursus neque. Amet scelerisque sit magna massa. Rutrum amet lorem dictum in. Malesuada hac cum arcu magna nunc.",
                        fontsize: 12.sp,
                        color: AppColors.textColor6C6E72,
                        maxline: 10,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 12.h),
                      CustomText(
                        text:
                        "Lorem ipsum dolor sit amet consectetur. Pharetra odio porta vulputate elit eu nibh cursus neque. Amet scelerisque sit magna massa. Rutrum amet lorem dictum in. Malesuada hac cum arcu magna nunc.\n\n""Lorem ipsum dolor sit amet consectetur. Pharetra odio porta vulputate elit eu nibh cursus neque. Amet scelerisque sit magna massa. Rutrum amet lorem dictum in. Malesuada hac cum arcu magna nunc.",
                        fontsize: 12.sp,
                        color: AppColors.textColor6C6E72,
                        maxline: 10,
                        textAlign: TextAlign.start,
                      ),
                    ],
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

}
