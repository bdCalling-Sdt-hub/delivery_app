import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:delivery_app/utils/app_colors.dart';
import 'package:get/get.dart';
import '../../../../utils/app_dimensions.dart';
import '../../../../utils/app_images.dart';
import '../../../widgets/custom_pin_code_text_field.dart';
import 'package:delivery_app/views/widgets/custom_button.dart';

class VerifyEmailAddressScreen extends StatefulWidget {
  const VerifyEmailAddressScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmailAddressScreen> createState() => _VerifyEmailAddressScreenState();
}

class _VerifyEmailAddressScreenState extends State<VerifyEmailAddressScreen> {


  TextEditingController otpCtrl = TextEditingController();

  late ValueNotifier<int> _countdown;
  late ValueNotifier<bool> _isCountingDown;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _countdown = ValueNotifier<int>(120);
    _isCountingDown = ValueNotifier<bool>(true);
    startCountdown();
  }

  void startCountdown() {
    _isCountingDown.value = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown.value > 0) {
        _countdown.value--;
      } else {
        timer.cancel();
        _isCountingDown.value = false;
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _countdown.dispose();
    _isCountingDown.dispose();
    otpCtrl.dispose();
    super.dispose();
  }

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
                    children: [
                      /// ====================================> Text ====================================>
                      Text(
                        "Verify Email Address".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Dimensions.fontSizeOverLarge.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        "Enter the 6 digit code that we sent on your email.".tr,
                        textAlign: TextAlign.start,
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
            /// ===============================> OTP ====================================>
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
                  onTap: () {
                    // Add verification logic
                  },
                  title: 'Verify Code'.tr),
            ),
            SizedBox(height: 32.h),
            /// ======================================> Resend ===============================>
            Center(
              child: ValueListenableBuilder<int>(
                valueListenable: _countdown,
                builder: (context, countdown, child) {
                  return RichText(
                    text: TextSpan(
                      text: 'Didn’t receive the code? '.tr,
                      style: TextStyle(
                        color: AppColors.textColor333333,
                        fontSize: 14.sp,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: countdown > 0
                              ? 'Resend in ${countdown}s'
                              : 'Resend Code'.tr,
                          style: TextStyle(
                            color: countdown > 0
                                ? AppColors.greenTextColor669B27
                                : AppColors.primaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = countdown > 0
                                ? null
                                : () {
                              startCountdown(); // Restart countdown
                            },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
