import 'package:delivery_app/routes/app_routes.dart';
import 'package:delivery_app/utils/app_colors.dart';
import 'package:delivery_app/views/screens/client/client_bottom_navbar/client-bottm_navbar_screen.dart';
import 'package:delivery_app/views/widgets/custom_button.dart';
import 'package:delivery_app/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../controllers/client/client_home_controller.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClientHomeController());

    return Scaffold(
      bottomNavigationBar: ClientBottomNavBar(0),
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                ///====================================> User Greeting Section =====================================>
                _buildUserGreetingSection(),
                SizedBox(height: 30.h),

                /// ===================================> Page Title Section ==============================>
                CustomText(
                  text: 'New request'.tr,
                  fontsize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textColor020202,
                ),
                SizedBox(height: 2.h),
                CustomText(
                  text: 'Add below details to place new request.'.tr,
                  fontsize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor6C6E72,
                ),
                SizedBox(height: 24.h),

                /// ==============================> Request Type Dropdown ================================>
                CustomText(
                  text: 'Request Type'.tr,
                  fontsize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor333333,
                ),
                SizedBox(height: 11.h),
                 DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: 'Select type'.tr,
                      hintStyle: TextStyle(fontSize: 14.sp, color: const Color(0xFFB1B1B1)),
                      filled: true,
                      fillColor: const Color(0xFFEDEDEE),
                      contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Color(0xFFEDEDEE)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Color(0xFFEDEDEE)),
                      ),
                    ),
                    icon: Icon(Icons.arrow_drop_down, size: 24.sp, color: const Color(0xFF7A7A7A)),
                    items: controller.requestTypes
                        .map((type) => DropdownMenuItem(value: type, child: Text(type, style: TextStyle(fontSize: 14.sp))))
                        .toList(),
                    onChanged: (value) => controller.selectedRequestType.value = value ?? '',
                    dropdownColor: Colors.white,
                  ),

                SizedBox(height: 20.h),

                /// ==============================>  Quantity Field ============================>
                CustomText(
                  text: 'Quantity'.tr,
                  fontsize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor333333,
                ),
                SizedBox(height: 10.h),
                 TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) => controller.quantity.value = value,
                    decoration: InputDecoration(
                      hintText: 'Enter quantity'.tr,
                      hintStyle: TextStyle(fontSize: 14.sp, color: const Color(0xFFB1B1B1)),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                      fillColor: const Color(0xFFEDEDEE),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                      ),
                    ),

                ),
                SizedBox(height: 40.h),
                /// ==========================> Validate Button ====================================?
                CustomGradientButton(
                  onTap: (){
                    Get.toNamed(AppRoutes.clientHomeScreenSuccessfulScreen);
                  },
                  title: 'Validate my request'.tr,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ===================================> User Greeting Section Widget =========================>
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
                  text: 'Welcome Back,'.tr,
                  fontsize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor6C6E72,
                ),
                SizedBox(height: 6.h),
                CustomText(
                  text: 'Ronald Richards'.tr,
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
            Stack(
              children: [
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.notificationScreen);
                  },
                  child: SvgPicture.asset(
                    'assets/icons/notification.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 12.w,
                    height: 12.h,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '1'.tr,
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
            ),
            /// ==================================> Menu ========================================>
            SizedBox(width: 14.w),
            GestureDetector(
              onTap: (){
                Get.toNamed(AppRoutes.menuScreen);
              },
              child: SvgPicture.asset(
                'assets/icons/dropdown.svg',
                width: 24.w,
                height: 24.h,
              ),
            ),
          ],
        )
      ],
    );
  }
}
