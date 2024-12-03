import 'package:delivery_app/routes/app_routes.dart';
import 'package:delivery_app/utils/app_colors.dart';
import 'package:delivery_app/utils/app_images.dart';
import 'package:delivery_app/views/screens/deliverypersons/deliverybottomnavbar/delivery_bottom_navbar.dart';
import 'package:delivery_app/views/widgets/custom_button.dart';
import 'package:delivery_app/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DeliveryHomeScreen extends StatelessWidget {
  const DeliveryHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DeliveryBottomNavBar(0),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF0F5E9), Color(0xFFFFFFFF)],
            stops: [0.2075, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  _buildUserGreetingSection(),
                  SizedBox(height: 30.h),
                  _buildPageTitleSection(),
                  SizedBox(height: 20.h),
                  _buildPromoBanner(),
                  SizedBox(height: 24.h),
                  _buildSectionHeader('Current Delivery Order'),
                  SizedBox(height: 16.h),
                  _buildOrderCard(),
                  SizedBox(height: 24.h),
                  _buildSectionHeader('Queued Delivery Orders'),
                  SizedBox(height: 16.h),
                  _buildOrderCard(),
                  SizedBox(height: 14.h),
                  _buildOrderCard(),
                  SizedBox(height: 24.h),
                  CustomGradientButton(
                    onTap: () {
                      Get.toNamed(AppRoutes.summarizeTodayActivityScreen);
                    },
                    title: 'Summarize Today Activity',
                  ),
                  SizedBox(height: 27.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Greeting Section Widget
  Widget _buildUserGreetingSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25.r,
              backgroundImage: const AssetImage('assets/images/homeprofile.png'),
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Welcome Back,',
                  fontsize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor6C6E72,
                ),
                SizedBox(height: 6.h),
                CustomText(
                  text: 'Alexandra Joess',
                  fontsize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor020202,
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            _buildNotificationIcon(),
            SizedBox(width: 14.w),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.deliveryMenuScreen);
              },
              child: Container(
                width: 42.w,
                height: 42.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/dropdown.svg',
                      width: 22.w,
                      height: 22.h,
                  )
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Notification Icon Widget
  Widget _buildNotificationIcon() {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.deliveryNotificationScreen);
          },
          child: Container(
            width: 42.w,
            height: 42.h,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/notification.svg',
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
        ),
        Positioned(
          right: 4.w,
          top: 4.h,
          child: Container(
            width: 12.w,
            height: 12.h,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Page Title Section
  Widget _buildPageTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Your Delivery, Just a Tap Away',
          fontsize: 24.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textColor020202,
        ),
        SizedBox(height: 2.h),
        CustomText(
          text: 'Check below for your upcoming deliveries',
          fontsize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textColor6C6E72,
        ),
      ],
    );
  }

  /// Promo Banner Widget
  Widget _buildPromoBanner() {
    return Container(
      width: 353.w,
      height: 116.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
        gradient: const LinearGradient(
          colors: [Color(0xFFF37B1C), Color(0xFFF0D4AF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Seamless Ordering',
                  fontsize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColorFFFFFF,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: 'Simplifying Your Delivery Experience →',
                  fontsize: 14.sp,
                  fontWeight: FontWeight.w400,
                  maxline: 2,
                  textAlign: TextAlign.start,
                  color:AppColors.textColorFFFFFF,
                ),
              ],
            ),
          ),
          SizedBox(width: 27.w),
          Image.asset(
            AppImages.deliverybennerImage,
            height: 108.h,
          ),
        ],
      ),
    );
  }


  /// Section Header Widget
  Widget _buildSectionHeader(String title) {
    return CustomText(
      text: title,
      fontsize: 18.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.textColor333333,
    );
  }

  /// Order Card Widget
  Widget _buildOrderCard() {
    return Container(
      padding: EdgeInsets.all(15.w),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5.r,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image Section
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              AppImages.packageImage,
              height: 48.h,
              width: 48.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15.w),

          /// Text Section
          Expanded(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Bucket Package',
                  fontsize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor333333,
                ),
                SizedBox(height: 5.h),
                CustomText(
                  text: 'Quantity : 01',
                  fontsize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor6C6E72,
                ),
                SizedBox(height: 5.h),
                /// Location
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/location.svg',height: 12.h,width: 12.w),
                    SizedBox(width: 4.w),
                    CustomText(
                      text: 'Bangalore 202343',
                      fontsize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor6C6E72,
                    ),
                  ],
                ),
              ],
            ),

          ),

          /// Button Section
          CustomGradientButton(
            onTap: () {
              // Navigate to order details
              Get.toNamed(AppRoutes.deliveryHomeDetailsScreen);
            },
            title: 'View Details',
            height: 35.h,
            width: 100.w,
          ),
        ],
      ),
    );
  }

}
