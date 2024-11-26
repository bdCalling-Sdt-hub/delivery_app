import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_colors.dart';

class BottomMenu extends StatelessWidget {
  final int menuIndex;

  const BottomMenu(this.menuIndex, {super.key});

  Color colorByIndex(ThemeData theme, int index) {
    return index == menuIndex ? AppColors.textColorFFFFFF : theme.disabledColor;
  }

  BottomNavigationBarItem getItem(String image, ThemeData theme, int index) {
    return BottomNavigationBarItem(
        label: "",
        icon: index == menuIndex
            ? Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFFFB3F81),
                Color(0xFFB749BB),
                Color(0xFF8C4AEF),
              ],
              stops: [0.0038, 0.443, 0.9987],
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Image.asset(image,height: 25.h,color: colorByIndex(theme, index),)


            // SvgPicture.asset(
            //   image,
            //   height: 40.h,
            //   color: colorByIndex(theme, index),
            // ),


          ),
        )
            : Image.asset(image,height: 25.h,color: colorByIndex(theme, index),)


      // SvgPicture.asset(
      //   image,
      //   height: 60 .h,
      //   color: colorByIndex(theme, index),
      // ),
    );
  }



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<BottomNavigationBarItem> menuItems = [
      getItem("assets/icons/img.png",  theme, 0),
      getItem("assets/icons/sub.png", theme, 1),
      getItem("assets/icons/message.png", theme, 2),
      getItem("assets/icons/profile.png", theme, 3),
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: theme.disabledColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: menuIndex,
          onTap: (value) {
            switch (value) {
              case 0:
                // Get.offAndToNamed(AppRoutes.homeScreen);
                break;
              case 1:
                // Get.offAndToNamed(AppRoutes.subscriptionScreen);
                break;
              case 2:
                // Get.offAndToNamed(AppRoutes.messageScreen);
                break;
              case 3:
                // Get.offAndToNamed(AppRoutes.profileScreen);
                break;
            }
          },
          items: menuItems,
        ),
      ),
    );
  }
}