import 'dart:io';
import 'package:delivery_app/routes/app_routes.dart';
import 'package:delivery_app/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/profile/profile_controller.dart';
import '../../../../utils/app_images.dart';
import '../../../widgets/custom_text.dart';
import '../../../../utils/app_colors.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final ProfileController profileController = Get.put(ProfileController());
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
                      width: MediaQuery.of(context).size.width,
                      height: 135.h,
                      fit: BoxFit.cover,
                    ),

                    /// Title in Banner
                    Positioned(
                      bottom: 16.h,
                      child: CustomText(
                        text: "Edit Profile",
                        fontsize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 17.h),

                /// ==============================> Profile Card ============================>
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    children: [
                      /// ========================> Profile Image with Edit Icon ==========================>
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          /// Profile Image
                          Obx(() {
                            return Container(
                              margin: EdgeInsets.only(top: 16.h),
                              width: 80.w,
                              height: 80.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: profileController.selectedImagePath.value.isEmpty
                                    ? const DecorationImage(
                                  image: AssetImage(AppImages.profileImage),
                                  fit: BoxFit.cover,
                                )
                                    : DecorationImage(
                                  image: FileImage(File(profileController.selectedImagePath.value)),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                  width: 2.w,
                                ),
                              ),
                            );
                          }),

                          /// Edit Icon
                          Positioned(
                            right: 6.w,
                            bottom: 6.h,
                            child: GestureDetector(
                              onTap: () => _showImagePickerOptions(context),
                              child: Container(
                                width: 24.w,
                                height: 24.h,
                                decoration: const BoxDecoration(
                                  color: AppColors.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 16.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),



                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                /// ==============================> Account Overview Section ============================>

                SizedBox(height: 65.h),
                /// ==============================> Edit Profile Button ============================>
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomGradientButton(
                      onTap: (){
                        Get.toNamed(AppRoutes.splashScreen);
                      },
                      title: 'Save'),
                ),
                SizedBox(height: 24.h),

              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ============================> Helper Widget for Info Cards ==============================>
  Widget _infoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F5E9),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          /// Icon
          Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              color: AppColors.textColorFFFFFF,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.primaryColor,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 12.w),

          /// Title and Subtitle
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                fontsize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor333333,
              ),
              SizedBox(height: 4.h),
              CustomText(
                text: subtitle,
                fontsize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor6C6E72,
                textAlign: TextAlign.left,
                maxline: 5,
                textOverflow: TextOverflow.ellipsis,
              ),

            ],
          ),
        ],
      ),
    );
  }
  /// Show Options for Gallery or Camera
  void _showImagePickerOptions(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text("Pick from Gallery"),
              onTap: () {
                profileController.pickImageFromGallery();
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text("Capture with Camera"),
              onTap: () {
                profileController.captureImageFromCamera();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }}