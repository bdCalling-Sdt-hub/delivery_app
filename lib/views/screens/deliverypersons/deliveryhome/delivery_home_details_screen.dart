import 'package:delivery_app/routes/app_routes.dart';
import 'package:delivery_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

import '../../../../controllers/delivery/delivery_controller.dart';
import '../../../widgets/custom_button.dart';

class DeliveryHomeDetailsScreen extends StatelessWidget {
  DeliveryHomeDetailsScreen({Key? key}) : super(key: key);

  final LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () => controller.confirmLocation(context),
          ),
        ],
      ),
      body: Stack(
        children: [
          Obx(
                () => GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: LocationController.initialPosition,
              myLocationEnabled: true,
              markers: Set<Marker>.of(controller.markers),
              onMapCreated: (GoogleMapController mapController) {
                controller.mapController.complete(mapController);
              },
              onTap: controller.onMapTapped,
            ),
          ),
          /// Bottom Card
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 327,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:  BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10.r,
                  ),
                ],
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _buildInfoCard(
                          icon: Icons.local_shipping,
                          title: 'Request Type',
                          value: 'Bucket Package',
                        ),
                         SizedBox(width: 10.h),
                        _buildInfoCard(
                          icon: Icons.production_quantity_limits,
                          title: 'Quantity',
                          value: '02',
                        ),
                      ],
                    ),
                     SizedBox(height: 20.h),
                    const Text(
                      'Receiver',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     SizedBox(height: 10.h),
                     Row(
                      children: [
                        CircleAvatar(
                          radius: 30.r,
                          backgroundImage: const NetworkImage(
                            'https://i.pravatar.cc/150?img=3',
                          ),
                        ),
                        SizedBox(width: 15.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Alexa Georgia',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              'Driver',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.textColor6C6E72,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 29.h),
                    CustomGradientButton(
                      title: 'Mark As Complete',
                      onTap: () {
                        Get.toNamed(AppRoutes.deliveryConfirmationScreen);


                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Expanded(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.backgroundColorF0F5E9,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor6C6E72,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor020202,
                  ),
                ),
              ],
            ),
            // Right: Icon
            Icon(
              icon,
              size: 28,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

}
