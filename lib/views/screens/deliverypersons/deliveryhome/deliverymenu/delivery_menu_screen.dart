import 'package:delivery_app/routes/app_routes.dart';
import 'package:delivery_app/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_colors.dart';

class DeliveryMenuScreen extends StatelessWidget {
  const DeliveryMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorF0F5E9,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              /// =========================> Header Row =============================>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Menu'.tr,
                    fontsize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor020202,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/cross.svg',
                      width: 24.w,
                      height: 24.h,
                      color: AppColors.textColor979797,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              /// ==========================> Profile Card ==========================>
              Container(
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  color: AppColors.textColorFFFFFF,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    /// ==================> Profile Image ====================>
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.r),
                      child: Image.asset(
                        'assets/images/menuimage.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    /// =========================> Name & Email ==========================>
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Alexandra Joes'.tr,
                          fontsize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor020202,
                        ),
                        SizedBox(width: 4.h),
                        CustomText(
                          text: 'info734@gmail.com'.tr,
                          fontsize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor6C6E72,
                        ),
                      ],
                    ),
                    /// ======================> Arrow Icon =========================>
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18.sp),
                  ],
                ),
              ),
              SizedBox(height: 17.h),
              /// ======================> Menu Options ===========================>
              Expanded(
                child: ListView(
                  children: [
                    /// FAQ, Education, History
                    _menuSection(
                      [
                        _menuItem(
                          icon: Icons.access_time_sharp,
                          title: "Timing".tr,
                          onTap: () {
                            Get.toNamed(AppRoutes.timingScreen);
                          },
                        ),
                        Divider(height: 1.h, color: AppColors.backgroundColorF0F5E9),
                        _menuItem(
                          icon: Icons.language,
                          title: "Language".tr,
                          onTap: () {
                            Get.toNamed(AppRoutes.deliveryLanguageScreen);
                          },
                        ),
                        Divider(height: 1.h, color: AppColors.backgroundColorF0F5E9),
                        _menuItem(
                          icon: Icons.history,
                          title: "History".tr,
                          onTap: () {
                            Get.toNamed(AppRoutes.deliveryHistorysScreen);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    /// Edit Profile, Notifications, Change Password, Saved Articles
                    _menuSection(
                      [
                        _menuItem(
                          icon: Icons.person_outline,
                          title: "Edit Profile".tr,
                          onTap: () {
                            Get.toNamed(AppRoutes.editProfileScreen);
                          },
                        ),
                        Divider(height: 1.h, color: AppColors.backgroundColorF0F5E9),
                        _menuItem(
                          icon: Icons.notifications_none,
                          title: "Notification".tr,
                          onTap: () {
                            Get.toNamed(AppRoutes.notificationScreen);
                          },
                        ),
                        Divider(height: 1.h, color:AppColors.backgroundColorF0F5E9),
                        _menuItem(
                          icon: Icons.lock_outline,
                          title: "Change Password".tr,
                          onTap: () {
                            Get.toNamed(AppRoutes.changePasswordScreen);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    /// Terms of Service, Privacy Policy, About Us
                    _menuSection(
                      [
                        _menuItem(
                          icon: Icons.open_in_new_outlined,
                          title: "Terms of Service".tr,
                          onTap: () {
                            Get.toNamed(AppRoutes.termServicesScreen);
                          },
                        ),
                        Divider(height: 1.h, color: AppColors.backgroundColorF0F5E9),
                        _menuItem(
                          icon: Icons.privacy_tip_outlined,
                          title: "Privacy Policy".tr,
                          onTap: () {
                            Get.toNamed(AppRoutes.privacyPolicyScreen);
                          },
                        ),
                        Divider(height: 1.h, color: AppColors.backgroundColorF0F5E9),
                        _menuItem(
                          icon: Icons.info_outline,
                          title: "About Us".tr,
                          onTap: () {
                            Get.toNamed(AppRoutes.aboutUsScreen);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    /// Logout
                    _menuItem(
                      icon: Icons.logout,
                      title: "Logout".tr,
                      onTap: () {
                        Get.offAllNamed(AppRoutes.loginScreen);
                      },
                      textColor: Colors.red,
                      isLogout: true,
                    ),
                    SizedBox(height: 20.h)
                  ],
                ),
              ),
              SizedBox(height: 20.h)
            ],
          ),
        ),
      ),
    );
  }

  /// Menu Section Container
  Widget _menuSection(List<Widget> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: items,
      ),
    );
  }

  /// Individual Menu Item
  Widget _menuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color textColor = Colors.black,
    bool isLogout = false, // To handle Logout
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            Icon(icon, color: isLogout ? Colors.red : AppColors.primaryColor),
            SizedBox(width: 20.w),
            CustomText(
              text: title.tr,
              fontsize: 16.sp,
              fontWeight: FontWeight.w400,
              color: isLogout ? Colors.red : AppColors.textColor333333,
            ),
            if (!isLogout) const Spacer(),
            if (!isLogout)
              Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18.sp),
          ],
        ),
      ),
    );
  }

}
