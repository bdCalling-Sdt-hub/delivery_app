import 'package:delivery_app/routes/app_routes.dart';
import 'package:delivery_app/utils/app_images.dart';
import 'package:delivery_app/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../widgets/custom_text.dart';

class ClientHomeScreenSuccessfulScreen extends StatelessWidget {
  ClientHomeScreenSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        /// ===========================> Image ===============================>
        children: [
          Positioned.fill(
            child: Image.asset(
            AppImages.successImage,
              fit: BoxFit.contain,
            ),
          ),
          /// ===========================> Text ===============================>
          Column(
            children: [
              const Spacer(flex: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomText(
                  text: 'Successfull!'.tr,
                  fontWeight: FontWeight.w700,
                  fontsize: 24.h,
                  bottom: 8.h,
                  color: AppColors.textColor333333,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomText(
                  text:
                  'Your request of 2 compost buckets has been placed successfully.'.tr,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor6C6E72,
                  fontsize: 14.h,
                  maxline: 6,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 32.h),
              /// ===========================> Button ===============================>
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomGradientButton(onTap: (){
                  Get.toNamed(AppRoutes.clientHomeScreen);

                }, title: 'OK'.tr),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ],
      ),
    );
  }
}

