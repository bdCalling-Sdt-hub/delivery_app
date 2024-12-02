import 'package:delivery_app/views/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../widgets/custom_text.dart';

class DeliveryConformationScreen extends StatefulWidget {
  const DeliveryConformationScreen({super.key});

  @override
  State<DeliveryConformationScreen> createState() => _DeliveryConformationScreenState();
}

class _DeliveryConformationScreenState extends State<DeliveryConformationScreen> {

  final TextEditingController bucketController = TextEditingController();
  String? selectedStatus; // To track selected dropdown value

  // List of statuses
  final List<String> statuses = ['Delivered', 'Not Delivered', 'Problem Occurred'];

  // Image Picker Function
  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a Photo'),
                onTap: () async {
                  final pickedFile = await picker.pickImage(
                    source: ImageSource.camera,
                  );
                  Navigator.pop(ctx); // Close bottom sheet
                  if (pickedFile != null) {
                    // Handle image selection
                    print('Image selected: ${pickedFile.path}');
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Choose from Gallery'),
                onTap: () async {
                  final pickedFile = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  Navigator.pop(ctx); // Close bottom sheet
                  if (pickedFile != null) {
                    // Handle image selection
                    print('Image selected: ${pickedFile.path}');
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
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
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 135.h,
                      fit: BoxFit.cover,
                    ),
                    /// Background Image
                    Container(
                      color: AppColors.primaryColor,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
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
                              child: CustomText(
                                text: "Delivery Confirmation",
                                fontsize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 17.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  child: Column(
                    children: [
                      CustomText(
                        text: "No. of Bucket Delivered",
                        fontsize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor6C6E72,
                      ),
                      SizedBox(height: 8.h),
                      TextField(
                        controller: bucketController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Enter number of bucket',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: const BorderSide(color: AppColors.textColor6C6E72),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: const BorderSide(color: AppColors.primaryColor),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),

                      /// Input: Status Dropdown
                      CustomText(
                        text: "Status",
                        fontsize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor6C6E72,
                      ),
                      SizedBox(height: 8.h),
                      DropdownButtonFormField<String>(
                        value: selectedStatus,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: const BorderSide(color: AppColors.textColor6C6E72),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                        ),
                        hint: const Text("Select status"),
                        items: statuses.map((String status) {
                          return DropdownMenuItem<String>(
                            value: status,
                            child: Text(status),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedStatus = newValue;
                          });
                        },
                      ),
                      SizedBox(height: 16.h),

                      /// Take a Photo Section
                      CustomText(
                        text: "Take a Photo",
                        textAlign: TextAlign.start,
                        fontsize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor6C6E72,
                      ),
                      SizedBox(height: 8.h),
                      GestureDetector(
                        onTap: () => _pickImage(context),
                        child: Container(
                          height: 60.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.textColor6C6E72),
                            borderRadius: BorderRadius.circular(8.r),
                            color: const Color(0xFFFFF8F2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/camera.svg',
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                "Take a Photo Click here",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              
                SizedBox(height: 27.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  child: CustomGradientButton(onTap: (){}, title: 'Submit'),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
