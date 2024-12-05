import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../widgets/advanced_card.dart';
import '../../../widgets/custom_text.dart';
import '../client_bottom_navbar/client-bottm_navbar_screen.dart';

class AdvancedScreen extends StatelessWidget {
  const AdvancedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClientBottomNavBar(1),
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: 'Advanced'.tr,
          fontsize: 20.h,
          color: AppColors.textColor333333,
        ),
      ),
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
                SizedBox(height: 16.h),

                /// ==============================>Advanced Cards Grid =============================>
                _buildGridSection(2, (context, index) {
                  return AdvancedCard(
                    imageUrl: AppImages.advancedImage,
                    name: "The Future of Package".tr,
                    title: "Lorem ipsum dolor sit amet consectetur.".tr,
                    subtitle: "Subtitle here".tr,
                    icon: AppImages.bookmarkImage,
                    onTap: () {},
                  );
                }),
                SizedBox(height: 20.h),

              ],
            ),
          ),
        ),
      ),
    );
  }

}
/// ======================================> Grid SectionHeader ==================================>
Widget _buildGridSection(
    int itemCount, Widget Function(BuildContext, int) itemBuilder) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 16.h),
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 20.h,
        childAspectRatio: 0.85,
      ),
      itemBuilder: itemBuilder,
    ),
  );
}

