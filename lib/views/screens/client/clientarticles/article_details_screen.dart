import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../utils/app_images.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ===============================> Header Section with Icons =================================>
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    /// Background Image
                    Image.asset(
                      AppImages.articleImage,
                      width: MediaQuery.of(context).size.width,
                      height: 135.h,
                      fit: BoxFit.cover,
                    ),
                    /// Header Content
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Left Icon
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
                          /// Header Title
                          Text(
                            "Article Details".tr,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          /// Right Icon
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/book.svg',
                              height: 24.h,
                              width: 24.w,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                /// ===============================> Article Section =================================>
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Image Section
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset(
                          AppImages.articlesImage,
                          width: MediaQuery.of(context).size.width,
                          height: 200.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 20.h),

                      /// Title Section
                      Text(
                        "Common Delivery Mistakes and How to Avoid Them".tr,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 14.h),

                      /// Description Section
                      Text(
                        "Lorem ipsum dolor sit amet consectetur. Id amet facilisis sem ultricies pellentesque. Morbi mauris ut fringilla a posuere egestas quis ut sagittis. Pharetra diam faucibus vitae gravida purus etiam nisi nisl. Id purus ut vulputate mauris. Sed lacus hendrerit varius suscipit amet placerat arcu nisi. Eget massa in nibh et facilisis facilisis diam.".tr,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 22.h),
                      /// Divider Section
                      Divider(color: Colors.grey.shade300, thickness: 1),
                      SizedBox(height: 20.h),
                      /// Another Title Section
                      Text(
                        "Sustainable Delivery Options".tr,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 14.h),

                      /// Another Description Section
                      Text(
                        "Lorem ipsum dolor sit amet consectetur. Id amet facilisis sem ultricies pellentesque. Morbi mauris ut fringilla a posuere egestas quis ut sagittis. Pharetra diam faucibus vitae gravida purus etiam nisi nisl. Id purus ut vulputate mauris. Sed lacus hendrerit varius suscipit amet placerat arcu nisi. Eget massa in nibh et facilisis facilisis diam.".tr,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
