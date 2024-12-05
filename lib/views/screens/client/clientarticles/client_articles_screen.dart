import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../widgets/advanced_card.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/beginners_card.dart';
import '../../../widgets/tips_card.dart';
import '../client_bottom_navbar/client-bottm_navbar_screen.dart';

class ClientArticleScreen extends StatelessWidget {
  const ClientArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClientBottomNavBar(1),
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

                /// =======================================> Header Section =========================================>
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
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
                      child: Text(
                        "Articles".tr,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),

                /// ==================================> Beginners Section Header =======================================>
                _buildSectionHeader(
                  context,
                  title: "Beginners".tr,
                  onTap: () {
                    Get.toNamed(AppRoutes.beginnersScreen);
                  },
                ),
                SizedBox(height: 14.h),

                /// =================================> Beginners Cards Grid ====================================>
                _buildGridSection(4, (context, index) {
                  return BeginnersCard(
                    imageUrl: AppImages.articlesImage,
                    name: "Common Delivery".tr,
                    title: "Lorem ipsum dolor sit amet consectetur.".tr,
                    subtitle: "Subtitle here".tr,
                    icon: AppImages.bookmarkImage,
                    onTap: () {
                      Get.toNamed(AppRoutes.articleDetailsScreen);
                    },
                  );
                }),
                SizedBox(height: 20.h),
                /// ===================================>  Advanced Section Header =================================>
                _buildSectionHeader(
                  context,
                  title: "Advanced".tr,
                  onTap: () {
                    Get.toNamed(AppRoutes.advancedScreen);
                  },
                ),
                SizedBox(height: 14.h),
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
                /// ===========================> Tips Section Header ===============================>
                _buildSectionHeader(
                  context,
                  title: "Tips".tr,
                  onTap: () {
                    Get.toNamed(AppRoutes.tipsScreen);
                  },
                ),
                SizedBox(height: 14.h),
                /// =====================>  Tips Cards Grid ===============================>
                _buildGridSection(2, (context, index) {
                  return TipsCard(
                    imageUrl: AppImages.tipsImage,
                    name: "Top 5 Tips".tr,
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
/// ======================================> SectionHeader ==================================>
  Widget _buildSectionHeader(BuildContext context,
      {required String title, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title.tr,
            fontsize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor020202,
          ),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                CustomText(
                  text: 'See all'.tr,
                  fontsize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.redF37B1C,
                ),
                SizedBox(width: 6.w),
                SvgPicture.asset(
                  'assets/icons/getterthan.svg',
                  width: 8.w,
                  height: 12.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
}
