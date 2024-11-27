import 'package:delivery_app/utils/app_colors.dart';
import 'package:delivery_app/views/widgets/custom_button.dart';
import 'package:delivery_app/views/widgets/custom_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../controllers/auth/sign_up_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/app_dimensions.dart';
import '../../../../utils/app_images.dart';
import '../../../widgets/custom_pin_code_text_field.dart';
import '../../../widgets/custom_text_field.dart';

class VerifyEmailAddressScreen extends StatefulWidget {
  const VerifyEmailAddressScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmailAddressScreen> createState() => _VerifyEmailAddressScreenState();
}

class _VerifyEmailAddressScreenState extends State<VerifyEmailAddressScreen> {
  TextEditingController otpCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {

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
                        "Verify Email Address",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Dimensions.fontSizeOverLarge.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        "Enter the 6 digit code that we sent on your ingot423@gmail.com",
                        textAlign: TextAlign.start,
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
            /// ===============================> otp ====================================>
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeSmall, vertical: 16.h),
              child: PinCodeField(otp: otpCtrl),
            ),
            SizedBox(height: 30.h),
            /// ===============================> Button ====================================>
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeSmall, vertical: 16.h),
              child: CustomGradientButton(
                  onTap: (){},
                  title: 'Verify Code'),
            ),
            SizedBox(height: 32.h),
            /// ======================================> Resend ===============================>
            Center(
              child: TextButton(
                onPressed: () {

                },
                child: RichText(
                  text: TextSpan(
                    text: 'Didn’t the code? ',
                    style: TextStyle(color: AppColors.textColor333333, fontSize: 14.sp),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Resend Code',
                        style: TextStyle(color: AppColors.primaryColor, fontSize: 14.sp),
                        recognizer: TapGestureRecognizer()..onTap = (){
                          // Get.toNamed(AppRoutes.signInScreen);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            

          ],
        ),
      ),
    );
  }
}

