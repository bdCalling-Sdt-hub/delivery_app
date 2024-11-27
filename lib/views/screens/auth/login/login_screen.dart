import 'package:delivery_app/utils/app_colors.dart';
import 'package:delivery_app/views/widgets/custom_button.dart';
import 'package:delivery_app/views/widgets/custom_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../controllers/auth/sign_up_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/app_dimensions.dart';
import '../../../../utils/app_images.dart';
import '../../../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust alignment
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome Back!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: Dimensions.fontSizeOverLarge.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icons/welcome.svg',
                            width: 34.w,
                            height: 34.h,
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        "Glad to see you again! Please log in to continue.",
                        textAlign: TextAlign.center,
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
                  CustomGradientButton(onTap: (){
                    Get.toNamed(AppRoutes.verifyEmailAddressScreen);

                  }, title: 'Log In'),
                  SizedBox(height: 47.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoutes.forgotPasswordScreen
                          );
                        },
                        child: CustomText(
                          text: 'Forgot Password?',
                          fontsize: 16.h,
                          fontWeight: FontWeight.w500,
                          color: AppColors.greenTextColor669B27,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 41.h),
                  /// =====================================> Login With ===================================>
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.textColor8F8F8F,
                          thickness: 1,
                          endIndent: 8.w,
                        ),
                      ),
                      CustomText(
                        text: 'OR',
                        color: AppColors.textColor8F8F8F,
                        fontsize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColors.textColor8F8F8F,
                          thickness: 1,
                          indent: 8.w,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 41.h),
                  /// =====================================> Icon ===================================>
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google Icon
                      GestureDetector(
                        onTap: () {

                        },
                        child: SvgPicture.asset(
                          'assets/icons/Group 1171276443.svg',
                          width: 56.w,
                          height: 56.h,
                        ),
                      ),
                      SizedBox(width: 24.w),
                      // Facebook Icon
                      GestureDetector(
                        onTap: () {

                        },
                        child: SvgPicture.asset(
                          'assets/icons/Group 1171276444.svg',
                          width: 56.w,
                          height: 56.h,
                        ),
                      ),
                      SizedBox(width: 24.w),
                      // Instagram Icon
                      GestureDetector(
                        onTap: () {

                        },
                        child: SvgPicture.asset(
                          'assets/icons/Group 1171276441.svg',
                          width: 56.w,
                          height: 56.h,
                        ),
                      ),
                      SizedBox(height: 136.h),

                    ],
                  ),
                  /// =====================================> Account & Log in ===================================>
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: RichText(
                        text: TextSpan(
                          text: 'Don’t have an account? ',
                          style: TextStyle(color: AppColors.textColor333333, fontSize: 14.sp),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(color: AppColors.primaryColor, fontSize: 16.sp),
                              recognizer: TapGestureRecognizer()..onTap = (){
                                Get.toNamed(AppRoutes.signUpScreen);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),

            )



          ],
        ),
      ),
    );
  }
}
