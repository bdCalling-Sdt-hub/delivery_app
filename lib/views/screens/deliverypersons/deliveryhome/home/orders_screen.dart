import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../controllers/delivery/order_controller.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_images.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/order_card.dart';

class OrdersScreen extends StatelessWidget {
  final OrderController controller = Get.put(OrderController());

  OrdersScreen({Key? key}) : super(key: key);

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
                // Header Section
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    /// Background Banner
                    Image.asset(
                      AppImages.articleImage,
                      width: MediaQuery.of(context).size.width,
                      height: 135.h,
                      fit: BoxFit.cover,
                    ),

                    /// Background Overlay
                    Positioned(
                      bottom: 0,
                      child: Container(
                        color: AppColors.primaryColor,
                        width: MediaQuery.of(context).size.width,
                        height: 100.h,
                      ),
                    ),

                    /// Header Content
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 20.h,
                      ),
                      child: Row(
                        children: [
                          /// Back Button Icon
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

                          /// Title
                          Expanded(
                            child: Center(
                              child: CustomText(
                                text: "Activity Summary",
                                fontsize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                /// ========================== Search Bar ==========================
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                        width: 0.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        /// Search Icon
                        const Icon(
                          Icons.search,
                          color: AppColors.orangeF37B1C,
                          size: 20,
                        ),
                        SizedBox(width: 8.w),
                        /// Search Text
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.7),
                                fontSize: 14.sp,
                              ),
                            ),
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Orders List
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Obx(
                        () => ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.subtitles.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: OrderCard(
                            imageUrl: AppImages.orderImage,
                            name: "Bucket Package",
                            title: "Order ${index + 1}",
                            subtitle: controller.subtitles[index],
                            deliveryStatus: index % 2 == 0
                                ? "Delivered"
                                : "Not Delivered",
                            quantity: "01",
                            location: "Bangalore 202343",
                            comment:
                            "joshua_l The product in delivery was amazing and I want to share some photos",
                            onTap: () => controller.pickDate(index),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // Spacer
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
