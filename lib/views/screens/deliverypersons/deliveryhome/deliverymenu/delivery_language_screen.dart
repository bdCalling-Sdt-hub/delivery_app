import 'package:delivery_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../controllers/localization_controller.dart';
import '../../../../../utils/app_constants.dart';
import '../../../../widgets/custom_text.dart';

class DeliveryLanguageScreen extends StatefulWidget {
  const DeliveryLanguageScreen({Key? key}) : super(key: key);

  @override
  _DeliveryLanguageScreenState createState() => _DeliveryLanguageScreenState();
}

class _DeliveryLanguageScreenState extends State<DeliveryLanguageScreen> {

  final RxList locale = [
    {"name": "English", "locale" : const Locale("en", "US")},
    {"name": "French", "locale" : const Locale("fr", "FR")}
  ].obs;


  // String _selectedLanguage = 'English';
  final RxInt selectedLanguage = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Language'.tr),
      ),
      body: GetBuilder<LocalizationController>(
          builder: (localizationController) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:AppConstants.languages.length,
                    itemBuilder: (context, index) {
                      var data= AppConstants.languages[index];
                      return GestureDetector(
                        onTap: (){
                          selectedLanguage.value = index;
                          localizationController.setLanguage(Locale(data.languageCode,data.countryCode));

                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 16.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(color: AppColors.textColor6C6E72),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: AppConstants.languages[index].languageName, top: 16.h, bottom: 16.h, left: 12.w),

                              Obx(()=>
                                  Container(
                                    margin: EdgeInsets.only(right: 12.w),
                                    height: 20.h,
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: selectedLanguage.value == index ?  Border.all( color: AppColors.primaryColor, width: 3.r) : Border.all(color: Colors.black, width: 1.5.r),
                                        color: selectedLanguage.value == index ?  AppColors.primaryColor : Colors.transparent
                                    ),
                                  ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 30.h),


                ],
              ),
            );
          }
      ),);
  }

  // /// Language Option Widget
  // Widget _buildLanguageOption({
  //   required String title,
  //   required String flagPath,
  //   required bool isSelected,
  //   required VoidCallback onTap,
  // }) {
  //   return GestureDetector(
  //     onTap: onTap,
  //     child: Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
  //       child: Container(
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(10.r),
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.black.withOpacity(0.1),
  //               blurRadius: 5,
  //               offset: const Offset(0, 2),
  //             ),
  //           ],
  //         ),
  //         child: Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
  //           child: Row(
  //             children: [
  //               /// Flag Icon
  //               SvgPicture.asset(
  //                 flagPath,
  //                 height: 24.h,
  //                 width: 24.w,
  //               ),
  //               SizedBox(width: 12.w),
  //
  //               /// Language Text
  //               Text(
  //                 title,
  //                 style: TextStyle(
  //                   fontSize: 16.sp,
  //                   fontWeight: FontWeight.w500,
  //                   color: Colors.black,
  //                 ),
  //               ),
  //
  //               /// Spacer
  //               const Spacer(),
  //
  //               /// Selected Indicator
  //               if (isSelected)
  //                 Icon(
  //                   Icons.radio_button_checked,
  //                   color: AppColors.primaryColor,
  //                   size: 24.sp,
  //                 )
  //               else
  //                 Icon(
  //                   Icons.radio_button_unchecked,
  //                   color: Colors.grey,
  //                   size: 24.sp,
  //                 ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  // void _changeLanguage(String languageCode) {
  //   print("Language changed to: $languageCode");
  // }


}
