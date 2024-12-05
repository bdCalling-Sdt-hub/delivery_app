import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_images.dart';
import '../../../../widgets/custom_text.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
                                text: "Privacy Policy".tr,
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
                            text: "Privacy of Use".tr,
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
                        "Lorem ipsum dolor sit amet consectetur. Pharetra odio porta vulputate elit eu nibh cursus neque. Amet scelerisque sit magna massa. Rutrum amet lorem dictum in. Malesuada hac cum arcu magna nunc.\n\n""Lorem ipsum dolor sit amet consectetur. Pharetra odio porta vulputate elit eu nibh cursus neque. Amet scelerisque sit magna massa. Rutrum amet lorem dictum in. Malesuada hac cum arcu magna nunc.".tr,
                        fontsize: 12.sp,
                        color: AppColors.textColor6C6E72,
                        maxline: 10,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                /// Platform Rules Section
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
                            text: "Platform Rules".tr,
                            fontsize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor020202,
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      /// Rules List
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _buildRuleCard("Lorem ipsum dolor sit amet consectetur. Pharetra odio p."),
                          _buildRuleCard("Lorem ipsum dolor sit amet consectetur. Pharetra odio p."),
                          _buildRuleCard("Lorem ipsum dolor sit amet consectetur. Pharetra odio p."),
                        ],
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

  /// Rule Card Widget
  Widget _buildRuleCard(String ruleText) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF0F5E9),
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Black Dot
              Container(
                width: 4.w,
                height: 4.h,
                margin: EdgeInsets.only(top: 6.h, right: 8.w),
                decoration: const BoxDecoration(
                  color: AppColors.textColor020202,
                  shape: BoxShape.circle,
                ),
              ),

              /// Rule Text
              Expanded(
                child: CustomText(
                  text: ruleText.tr,
                  fontsize: 13.sp,
                  color: AppColors.textColor6C6E72,
                  maxline: 3,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
