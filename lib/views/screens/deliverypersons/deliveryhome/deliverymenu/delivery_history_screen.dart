import 'package:delivery_app/views/screens/deliverypersons/deliverybottomnavbar/delivery_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_images.dart';
import '../../../../widgets/delivery_history_card.dart';
import '../../deliveryhistory/delivery_history_controller.dart';

class DeliveryHistorysScreen extends StatelessWidget {
  DeliveryHistorysScreen({super.key});

  final DeliveryHistoryController controller = Get.put(DeliveryHistoryController());

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
                /// ==============================>Header Section ============================>
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      AppImages.articleImage,
                      width: MediaQuery.of(context).size.width,
                      height: 135.h,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
                      child: Text(
                        "History",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),

                /// ===============================> History List Section =====================>
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Obx(() => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.subtitles.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: DeliveryHistoryCard(
                          imageUrl: AppImages.dImage,
                          subtitle: '12/04/2024',
                          completedOrders: '12',
                          onTap: () {
                            print('View Details clicked!');
                          },
                        ),

                      );
                    },
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
