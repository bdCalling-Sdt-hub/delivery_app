import 'package:delivery_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../utils/app_images.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selectedLanguage = 'English';

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// ==============================> Header Section ============================>
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

                    /// Background Image
                    Container(
                      color: AppColors.primaryColor,
                      width: MediaQuery.of(context).size.width,
                      height: 100.h,
                    ),

                    /// Header Content
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 20.h),
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
                                "Language",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
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
                SizedBox(height: 17.h),

                /// ==============================> Language Options ============================>
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    /// French Option
                    _buildLanguageOption(
                      title: "French",
                      flagPath: 'assets/icons/france.svg',
                      isSelected: _selectedLanguage == 'French',
                      onTap: () {
                        setState(() {
                          _selectedLanguage = 'French';
                          _changeLanguage('fr');
                        });
                      },
                    ),
                    /// English Option
                    _buildLanguageOption(
                      title: "English",
                      flagPath: 'assets/icons/eng.svg',
                      isSelected: _selectedLanguage == 'English',
                      onTap: () {
                        setState(() {
                          _selectedLanguage = 'English';
                          _changeLanguage('en');
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 27.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Language Option Widget
  Widget _buildLanguageOption({
    required String title,
    required String flagPath,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              children: [
                /// Flag Icon
                SvgPicture.asset(
                  flagPath,
                  height: 24.h,
                  width: 24.w,
                ),
                SizedBox(width: 12.w),

                /// Language Text
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),

                /// Spacer
                const Spacer(),

                /// Selected Indicator
                if (isSelected)
                  Icon(
                    Icons.radio_button_checked,
                    color: AppColors.primaryColor,
                    size: 24.sp,
                  )
                else
                  Icon(
                    Icons.radio_button_unchecked,
                    color: Colors.grey,
                    size: 24.sp,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _changeLanguage(String languageCode) {
    print("Language changed to: $languageCode");
  }
}
