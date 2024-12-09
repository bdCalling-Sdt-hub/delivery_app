import 'package:delivery_app/utils/app_colors.dart';
import 'package:delivery_app/views/widgets/custom_button.dart';
import 'package:delivery_app/views/widgets/custom_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../controllers/auth/sign_up_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/app_dimensions.dart';
import '../../../../utils/app_images.dart';
import '../../../widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = false;
  bool isCheckboxError = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneNumberCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController conformPassCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {

    final SignUpController signUpController = Get.put(SignUpController());

    return Scaffold(
      backgroundColor: AppColors.textColorFFFFFF,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ====================================> Image ====================================>
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.asset(
                  AppImages.chooseType,
                  width: MediaQuery.of(context).size.width,
                  height: 220.h,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    /// ====================================> text ====================================>
                    children: [
                      Text(
                        "Register".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Dimensions.fontSizeOverLarge.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        "Sign up to get started and unlock all features!".tr,
                        textAlign: TextAlign.center,
                        maxLines: 10,
                        style: TextStyle(
                          fontSize: Dimensions.fontSizeDefault.sp,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ====================================> First Name ==================================>
                  CustomText(
                      text: 'First Name'.tr,
                    fontsize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor333333,
                  ),
                  SizedBox(height: 11.h),
                  CustomTextField(
                    controller: firstNameCtrl,
                    hintText: 'Enter first name'.tr,
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
                    text: 'Last Name'.tr,
                    fontsize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor333333,
                  ),
                  SizedBox(height: 11.h),
                  CustomTextField(
                    controller: lastNameCtrl,
                    hintText: 'Enter last name'.tr,
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
                    text: 'Email Address'.tr,
                    fontsize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor333333,
                  ),
                  SizedBox(height: 11.h),
                  CustomTextField(
                    controller: emailCtrl,
                    hintText: 'Enter your email address'.tr,
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
                  /// =====================================> Phone Number ===================================>
                  CustomText(
                    text: 'Phone Number'.tr,
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
                    text: 'Address'.tr,
                    fontsize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor333333,
                  ),
                  SizedBox(height: 11.h),
                  CustomTextField(
                    controller: addressCtrl,
                    hintText: 'Enter address'.tr,
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
                  SizedBox(height: 20.h),
                  /// =====================================> Password ===================================>
                  CustomText(
                    text: 'Password'.tr,
                    fontsize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor333333,
                  ),
                  SizedBox(height: 11.h),
                  CustomTextField(
                    controller: passCtrl,
                    hintText: 'Enter your password'.tr,
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
                  /// =====================================> Confirm Password ===================================>
                  CustomText(
                    text: 'Confirm Password'.tr,
                    fontsize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor333333,
                  ),
                  SizedBox(height: 11.h),
                  CustomTextField(
                    controller: conformPassCtrl,
                    hintText: 'Enter confirm password'.tr,
                    prefixIcon: 'assets/icons/lock.svg',
                    isObscureText: true,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your conform password";
                      }
                      return null;
                    },
                    contenpaddingHorizontal: 20.w,
                    contenpaddingVertical: 18.h,
                  ),
                  SizedBox(height: 16.h),

                  ///==================================> Terms and Conditions Check Box =======================>
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 24.w,
                        height: 25.h,
                        child: Checkbox(
                          value: _isChecked,
                          checkColor: AppColors.primaryColor,
                          activeColor: Get.theme.primaryColor,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 16.h),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Accept '.tr,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              TextSpan(
                                text: 'Terms & Condition '.tr,
                                style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.primaryColor),
                              ),
                              TextSpan(
                                text: 'and '.tr,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              TextSpan(
                                text: 'Privacy Policy'.tr,
                                style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 37.h),
                  CustomGradientButton(onTap: (){
                    Get.toNamed(AppRoutes.verifyEmailAddressScreen);

                  }, title: 'Sign Up'.tr),
                  SizedBox(height: 24.h),
                  /// =====================================> Account & Log in ===================================>
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? '.tr,
                          style: TextStyle(color: AppColors.textColor333333, fontSize: 14.sp),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Log In'.tr,
                              style: TextStyle(color: AppColors.primaryColor, fontSize: 16.sp),
                              recognizer: TapGestureRecognizer()..onTap = (){
                                Get.toNamed(AppRoutes.loginScreen);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            )
        
        
        
          ],
        ),
      ),
    );
  }
}

