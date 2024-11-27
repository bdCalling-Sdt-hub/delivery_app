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

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

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
                      Text(
                        "Forgot Password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Dimensions.fontSizeOverLarge.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        "Not to worry it happens to the best of us. Please enter your email address below.",
                        textAlign: TextAlign.center,
                        maxLines: 4,
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
                  SizedBox(height: 40.h),

                  CustomGradientButton(onTap: (){


                  }, title: 'Submit'),
                  SizedBox(height: 47.h),

                ],
              ),

            )



          ],
        ),
      ),
    );
  }
}

