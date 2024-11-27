import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../utils/app_colors.dart';

class PinCodeField extends StatelessWidget {

  TextEditingController otp;
  PinCodeField({
    required this.otp,
  });



  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller:  otp,
      autoDisposeControllers: false,
      cursorColor: AppColors.primaryColor,
      textStyle: const TextStyle(color: Colors.black),
      autoFocus: false,
      appContext: context,
      length: 6,


      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8),
          selectedColor: AppColors.primaryColor,
          selectedFillColor: AppColors.primaryColor,
          fieldHeight: 49.h,
          fieldWidth: 53.w,
          inactiveColor: Colors.grey.withOpacity(.3),
          activeColor: AppColors.primaryColor
      ),
      obscureText: false,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        print("----value: $value");
      },
    );
  }
}
