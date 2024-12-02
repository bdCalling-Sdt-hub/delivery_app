import 'dart:io';
import 'package:delivery_app/controllers/profile/edit_profile_controller.dart';
import 'package:delivery_app/routes/app_routes.dart';
import 'package:delivery_app/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../controllers/profile/profile_controller.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/app_images.dart';
import '../../../widgets/custom_text.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final EditProfileController editProfileController = Get.put(EditProfileController());
  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneNumberCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  FocusNode focusNode = FocusNode();

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
                                image: editProfileController.selectedImagePath.value.isEmpty
                                    ? const DecorationImage(
                                  image: AssetImage(AppImages.profileImage),
                                  fit: BoxFit.cover,
                                )
                                    : DecorationImage(
                                  image: FileImage(File(editProfileController.selectedImagePath.value)),
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
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// ====================================> First Name ==================================>
                      CustomText(
                        text: 'First Name',
                        fontsize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor333333,
                      ),
                      SizedBox(height: 11.h),
                      CustomTextField(
                        controller: firstNameCtrl,
                        hintText: 'Enter first name',
                        prefixIcon: 'assets/icons/user-line.svg',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                        contenpaddingHorizontal: 50.w,
                        contenpaddingVertical: 16.h,


                      ),
                      SizedBox(height: 20.h),
                      /// ====================================> Last Name ==================================>
                      CustomText(
                        text: 'Last Name',
                        fontsize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor333333,
                      ),
                      SizedBox(height: 11.h),
                      CustomTextField(
                        controller: lastNameCtrl,
                        hintText: 'Enter last name',
                        prefixIcon: 'assets/icons/user-line.svg',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                        contenpaddingHorizontal: 50.w,
                        contenpaddingVertical: 16.h,
                      ),
                      SizedBox(height: 20.h),
                      /// =====================================> Email ===================================>
                      CustomText(
                        text: 'Email Address',
                        fontsize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor333333,
                      ),
                      SizedBox(height: 11.h),
                      CustomTextField(
                        controller: emailCtrl,
                        hintText: 'Enter your email address',
                        prefixIcon: 'assets/icons/mail.svg',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your user email";
                          } else if (!AppConstants.emailValidator.hasMatch(value)) {
                            return "Invalid email!";
                          }
                          return null;
                        },
                        contenpaddingHorizontal: 20.w,
                        contenpaddingVertical: 18.h,
                      ),
                      SizedBox(height: 20.h),
                      /// =====================================> Password ===================================>
                      CustomText(
                        text: 'Password',
                        fontsize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor333333,
                      ),
                      SizedBox(height: 11.h),
                      CustomTextField(
                        controller: passCtrl,
                        hintText: 'Enter your password',
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
                      /// =====================================> Phone Number ===================================>
                      CustomText(
                        text: 'Phone Number',
                        fontsize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor333333,
                      ),
                      SizedBox(height: 11.h),
                      IntlPhoneField(
                        focusNode: focusNode,
                        decoration:  const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.textColorEDEDEE),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.textColorEDEDEE)
                            )
                        ),
                        initialCountryCode: 'US',
                        onChanged: (phone) {
                          // if(phone.number.isNotEmpty){
                          //   isPhoneEmpty.value = false;
                          // }
                          phoneNumberCtrl.text = phone.completeNumber;

                        },
                      ),
                      SizedBox(height: 20.h),
                      /// =====================================> Address ===================================>
                      CustomText(
                        text: 'Address',
                        fontsize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor333333,
                      ),
                      SizedBox(height: 11.h),
                      CustomTextField(
                        controller: addressCtrl,
                        hintText: 'Enter address',
                        prefixIcon: 'assets/icons/location.svg',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please select your location";
                          }
                          return null;
                        },
                        contenpaddingHorizontal: 50.w,
                        contenpaddingVertical: 16.h,
                      ),
                      SizedBox(height: 27.h),
                      CustomGradientButton(onTap: (){
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
                editProfileController.pickImageFromGallery();
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text("Capture with Camera"),
              onTap: () {
                editProfileController.captureImageFromCamera();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }}
