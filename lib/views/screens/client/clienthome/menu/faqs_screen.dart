import 'package:delivery_app/utils/app_colors.dart';
import 'package:delivery_app/views/widgets/custom_text.dart';
import 'package:delivery_app/views/widgets/informative_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../utils/app_images.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF0F5E9), Color(0xFFFFFFFF)],
            stops: [0.2075, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// =================> Header Section with Icons =================>
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  /// Background Image
                  Container(
                    color: AppColors.primaryColor,
                    width: MediaQuery.of(context).size.width,
                    height: 100.h,
                  ),
                  /// Header Content
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
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
                            child: Text(
                              'FAQ’s',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              /// Spacing
              SizedBox(height: 15.h),
              /// Search Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: BoxDecoration(
                    color:AppColors.textColorFFFFFF,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                      prefixIcon: const Icon(Icons.search, color: AppColors.orangeF37B1C),
                    ),
                  ),
                ),
              ),
              /// Spacing
              SizedBox(height: 15.h),
              /// FAQ List
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// FAQ Items
                      faqTile(
                        question: 'How can I track my package?',
                        answer:
                        'Some shipping options allow for scheduled deliveries. Please review the available options during checkout or contact our team for more details.',
                      ),
                      faqTile(
                        question: 'What should I do if my package is delayed?',
                      ),
                      faqTile(
                        question: 'What are the available shipping options?',
                      ),
                      faqTile(
                        question: 'Handle a lost or stolen package?',
                      ),
                      faqTile(
                        question: 'Are there any restrictions on what I can send?',
                      ),
                      faqTile(
                        question: 'Can I schedule a specific delivery time?',
                        answer:
                        'Some shipping options allow for scheduled deliveries. Please review the available options during checkout or contact our team for more details.',
                      ),
                      faqTile(
                        question: 'Home when the package is delivered?',
                      ),
                      SizedBox(height: 24.h),
                      /// ======================================> Informative Videos Section ================================>
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child:  CustomText(text: 'Informative Videos',fontsize: 16.sp,fontWeight: FontWeight.w600)

                        ),
                      ),
                      SizedBox(height: 16.h),
                      /// Videos Grid
                      _buildGridSection(2, (context, index) {
                        return InformativeCard(
                          imageUrl: AppImages.informativeImage,
                          name: "Video Title",
                          title: "Lorem ipsum dolor sit amet consectetur.",
                          subtitle: "Subtitle here",
                          icon: AppImages.bookmarkImage,
                          onTap: () {

                          },
                        );
                      }),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ==============================> FAQ Tile Widget ============================>
  Widget faqTile({required String question, String? answer}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ExpansionTile(
                title: CustomText(
                    text: question,
            textAlign: TextAlign.start,
            fontsize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor333333),
                children: [
                  if (answer != null)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: CustomText(
                        textAlign: TextAlign.start,
                      text: answer,
                      maxline: 7,
                      fontsize: 12.sp,
                      fontWeight: FontWeight.w400,
                       color: AppColors.textColor6C6E72
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Informative Video Card Widget

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
}}
