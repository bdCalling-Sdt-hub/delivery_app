import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_images.dart';

class ChooseTypeScreen extends StatefulWidget {
  const ChooseTypeScreen({Key? key}) : super(key: key);

  @override
  State<ChooseTypeScreen> createState() => _ChooseTypeScreenState();
}

class _ChooseTypeScreenState extends State<ChooseTypeScreen> {
  bool isClientSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
        child: Column(
          children: [
            Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radiusDefault.r)
                ),
                child: Image.asset(AppImages.chooseType,width: 393.w,height: 183.h,fit: BoxFit.fitWidth)),


            SizedBox(height: 27.h),
            GestureDetector(
              onTap: () {
                setState(() {
                  isClientSelected = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radiusDefault.r),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.clientImage,
                      width: 100.w,
                      height: 100.h,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Client",
                      style: TextStyle(
                        fontSize: Dimensions.fontSizeLarge.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: isClientSelected ? Colors.green : Colors.grey,
                          size: 20,
                        ),
                        SizedBox(width: 5.h),
                        Text(
                          "Selected",
                          style: TextStyle(
                            fontSize: Dimensions.fontSizeDefault.sp,
                            color: isClientSelected ? Colors.green : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                setState(() {
                  isClientSelected = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radiusDefault.r),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.deliveryImage,
                      width: 100.w,
                      height: 100.h,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Delivery Persons",
                      style: TextStyle(
                        fontSize: Dimensions.fontSizeLarge.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: !isClientSelected ? Colors.green : Colors.grey,
                          size: 20,
                        ),
                        SizedBox(width: 5.h),
                        Text(
                          "Selected",
                          style: TextStyle(
                            fontSize: Dimensions.fontSizeDefault.sp,
                            color: !isClientSelected ? Colors.green : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}