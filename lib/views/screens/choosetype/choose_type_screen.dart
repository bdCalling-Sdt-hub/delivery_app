import 'package:delivery_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controllers/client/choose_type_controller.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_images.dart';

class ChooseTypeScreen extends StatelessWidget {
  const ChooseTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ScreenTypeController controller = Get.put(ScreenTypeController());

    return Scaffold(
      body: Column(
        children: [
          /// ====================================> Image ====================================>
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.asset(
                AppImages.chooseType,
                width: MediaQuery.of(context).size.width,
                height: 200.h,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  /// ====================================> text ====================================>
                  children: [
                    Text(
                      "Choose Your Account".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Dimensions.fontSizeOverLarge.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "You are a user or delivery person".tr,
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
          SizedBox(height: 68.h),
          /// ====================================> Client ====================================>
          Container(
            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.only(topLeft: Radius.circular(50.r))),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.selectClient();
                    Future.delayed(const Duration(milliseconds: 100), () {
                      Get.toNamed(AppRoutes.signUpScreen);
                    });
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        AppImages.clientImage,
                        width: 144.w,
                        height: 144.h,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "Client".tr,
                        style: TextStyle(
                          fontSize: Dimensions.fontSizeLarge.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: controller.isClientSelected.value ? Colors.green : Colors.grey,
                            size: 20,
                          ),
                          SizedBox(width: 5.h),
                          Text(
                            "Selected".tr,
                            style: TextStyle(
                              fontSize: Dimensions.fontSizeDefault.sp,
                              color: controller.isClientSelected.value ? Colors.green : Colors.grey,
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),

                SizedBox(height: 49.h),
                /// ====================================> Delivery person ====================================>
                GestureDetector(
                  onTap: () {
                    controller.selectDeliveryPerson();
                    Future.delayed(const Duration(milliseconds: 100), () {
                      Get.toNamed(AppRoutes.signUpScreen);
                    });
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        AppImages.deliveryImage,
                        width: 144.w,
                        height: 144.h,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "Delivery Persons".tr,
                        style: TextStyle(
                          fontSize: Dimensions.fontSizeLarge.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color:
                            !controller.isClientSelected.value ? Colors.green : Colors.grey,
                            size: 20,
                          ),
                          SizedBox(width: 16.h),
                          Text(
                            "Select".tr,
                            style: TextStyle(
                              fontSize: Dimensions.fontSizeDefault.sp,
                              color: !controller.isClientSelected.value
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

