import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../helpers/network_connection.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/custom_text.dart';

class DeliveryBottomNavBar extends StatefulWidget {
  final NetworkController networkController = Get.put(NetworkController());
  final int menuIndex;
  DeliveryBottomNavBar(this.menuIndex, {super.key});

  @override
  State<DeliveryBottomNavBar> createState() => _DeliveryBottomNavBarState();
}

class _DeliveryBottomNavBarState extends State<DeliveryBottomNavBar> {
  Color colorByIndex(ThemeData theme, int index) {
    return index == widget.menuIndex ? AppColors.primaryColor : theme.disabledColor;
  }

  BottomNavigationBarItem getItem(
      String image, String title, ThemeData theme, int index) {
    return BottomNavigationBarItem(
        label: '',
        icon: Container(
          height: 54.h,
          width: 64.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: widget.menuIndex == index ? AppColors.primaryColor : const Color(0xffFAFAFA),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: SvgPicture.asset(
                  color: widget.menuIndex == index ? Colors.white : Colors.black,
                  image,
                  height: 19.0,
                  width: 19.0,
                ),
              ),
              CustomText(
                text: title.tr,
                color: widget.menuIndex == index ? Colors.white : Colors.black,
                fontsize: 12.h,
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<BottomNavigationBarItem> menuItems = [
      getItem('assets/icons/home.svg', 'Home', theme, 0),
      getItem('assets/icons/history.svg', 'History', theme, 1),
      getItem('assets/icons/timing.svg', 'Timing', theme, 2),
      getItem('assets/icons/profile.svg', 'Profile', theme, 3),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(() => widget.networkController.isConnection.value
            ? const SizedBox.shrink()
            : Padding(
          padding: EdgeInsets.all(8.r),
          child: Container(
            color: AppColors.primaryColor,
            width: double.infinity,
            padding: EdgeInsets.all(10.r),
            child: const Text(
              "🚫  No Internet Connection",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        )),
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          currentIndex: widget.menuIndex,
          onTap: (value) async {

            switch (value) {
              case 0:
                Get.offAndToNamed(AppRoutes.deliveryHomeScreen);
                break;
              case 1:
                Get.offAndToNamed(AppRoutes.deliveryHistoryScreen);
                break;
              case 2:
                Get.offAndToNamed(AppRoutes.timingScreen);
                break;
              case 3:
                Get.offAndToNamed(AppRoutes.deliveryMyProfileScreen);
                break;
            }
          },
          items: menuItems,
        ),
      ],
    );
  }
}
