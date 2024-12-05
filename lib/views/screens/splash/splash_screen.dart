import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    jump();
    super.initState();
  }
  jump() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.chooseTypeScreen);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
            AppImages.splashBgImage,
            width: double.infinity,
            fit: BoxFit.fill,
            height: double.infinity),
      ),
    );
  }
}
