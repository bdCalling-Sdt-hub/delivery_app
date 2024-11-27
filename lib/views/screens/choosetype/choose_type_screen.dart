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
      body: Column(
        children: [
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
                  children: [
                    Text(
                      "Choose Your Account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Dimensions.fontSizeOverLarge.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "You are a user or delivery person",
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
          SizedBox(height: 52.h),
          Container(
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(50.r))),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isClientSelected = true;
                    });
                  },
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
                            color:
                                isClientSelected ? Colors.green : Colors.grey,
                            size: 20,
                          ),
                          SizedBox(width: 5.h),
                          Text(
                            "Selected",
                            style: TextStyle(
                              fontSize: Dimensions.fontSizeDefault.sp,
                              color:
                                  isClientSelected ? Colors.green : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 27.h),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isClientSelected = false;
                    });
                  },
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
                            color:
                                !isClientSelected ? Colors.green : Colors.grey,
                            size: 20,
                          ),
                          SizedBox(width: 5.h),
                          Text(
                            "Select",
                            style: TextStyle(
                              fontSize: Dimensions.fontSizeDefault.sp,
                              color: !isClientSelected
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
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
