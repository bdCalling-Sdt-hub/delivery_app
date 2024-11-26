import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import 'custom_text.dart';

class CustomTwoButon extends StatelessWidget {
  final List? btnNameList;
  final VoidCallback? leftBtnOnTap;
  final double? width;
  final double btnRadius;
  final int initialSeclected;
  final VoidCallback? rightBtnOnTap;

  const CustomTwoButon({
    super.key,
    this.btnNameList,
    this.leftBtnOnTap,
    this.rightBtnOnTap,
    this.width,
    required this.initialSeclected,
    required this.btnRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(btnNameList!.length, (index) {
        final bool isSelected = index == initialSeclected;
        return GestureDetector(
          onTap: index == 0 ? leftBtnOnTap : rightBtnOnTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: index == 0
                    ? const Color(0xFFC2C1C8)
                    : AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(btnRadius.r),
              color: index == 0
                  ? Colors.white
                  : null,
              gradient: index == 1
                  ? const LinearGradient(
                colors: [
                  Color(0xFFFB3F81),
                  Color(0xFFB749BB),
                  Color(0xFF8C4AEF),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
                  : null,
            ),
            width: 155,
            height: 50,
            child: Center(
              child: CustomText(
                text: btnNameList![index],
                color: isSelected && index == 0
                    ? AppColors.textColor333333
                    : Colors.white,
                fontsize: 20.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        );
      }),
    );
  }
}
