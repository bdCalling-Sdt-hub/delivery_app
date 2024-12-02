import 'package:delivery_app/routes/app_routes.dart';
import 'package:delivery_app/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_images.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/custom_text_field.dart';


class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  final TextEditingController currentPasswordCTRl = TextEditingController();
  final TextEditingController newPasswordCTRl = TextEditingController();
  final TextEditingController conformPasswordCTRl = TextEditingController();


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

                /// ==============================> Header Section ============================>
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [

                    /// Background Banner
                    Image.asset(
                      AppImages.articleImage,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 135.h,
                      fit: BoxFit.cover,
                    ),

                    /// Title in Banner
                    /// Background Image
                    Container(
                      color: AppColors.primaryColor,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
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
                              height: 18.h,
                              width: 18.w,
                              color: Colors.white,
                            ),
                          ),

                          /// Title
                          Expanded(
                            child: Center(
                              child: CustomText(
                                text: "Edit Profile",
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
                SizedBox(height: 17.h),


                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.h, vertical: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// =====================================> Current Password ===================================>
                      CustomText(
                        text: 'Current Password',
                        fontsize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor333333,
                      ),
                      SizedBox(height: 11.h),
                      CustomTextField(
                        controller: currentPasswordCTRl,
                        hintText: 'Enter current password',
                        prefixIcon: 'assets/icons/lock.svg',
                        isObscureText: true,
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                        contenpaddingHorizontal: 20.w,
                        contenpaddingVertical: 18.h,
                      ),
                      SizedBox(height: 20.h),
                      /// =====================================> New Password ===================================>
                      CustomText(
                        text: 'New Password',
                        fontsize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor333333,
                      ),
                      SizedBox(height: 11.h),
                      CustomTextField(
                        controller: newPasswordCTRl,
                        hintText: 'Enter new password',
                        prefixIcon: 'assets/icons/lock.svg',
                        isObscureText: true,
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                        contenpaddingHorizontal: 20.w,
                        contenpaddingVertical: 18.h,
                      ),
                      SizedBox(height: 20.h),
                      /// =====================================> Confirm New Password ===================================>
                      CustomText(
                        text: 'Confirm New Password',
                        fontsize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor333333,
                      ),
                      SizedBox(height: 11.h),
                      CustomTextField(
                        controller: conformPasswordCTRl,
                        hintText: 'Enter confirm password',
                        prefixIcon: 'assets/icons/lock.svg',
                        isObscureText: true,
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                        contenpaddingHorizontal: 20.w,
                        contenpaddingVertical: 18.h,
                      ),

                      SizedBox(height: 200.h),
                      CustomGradientButton(onTap: () {
                        Get.toNamed(AppRoutes.verifyEmailAddressScreen);
                      }, title: 'Save'),
                      SizedBox(height: 24.h),
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
