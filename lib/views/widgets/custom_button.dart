import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton({
    super.key,
    this.textStyle,
    required this.onTap,
    required this.title,
    this.loading = false,
    this.width,
    this.height,
  });

  final Function() onTap;
  final String title;
  final bool loading;
  final double? width;
  final double? height;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading ? null : onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 53.h,
        decoration: BoxDecoration(
          gradient:  const LinearGradient(
            colors: [
              Color(0xffFB3F81),
              Color(0xffB749BB),
              Color(0xff8C4AEF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(58),

        ),
        child: Center(
          child: loading
              ?  SizedBox(
            height: 20.h,
            width: 20.w,
            child: const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          )
              : Text(
            title,
            style: textStyle ??
                TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
