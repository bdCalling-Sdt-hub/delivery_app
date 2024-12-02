import 'package:delivery_app/routes/app_routes.dart';
import 'package:delivery_app/themes/light_theme.dart';
import 'package:delivery_app/utils/app_constants.dart';
import 'package:delivery_app/utils/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'helpers/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Map<String, Map<String, String>> _languages = await di.init();

  runApp(MyApp(
      // languages: _languages,
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // final Map<String, Map<String, String>> languages;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            title: AppConstants.APP_NAME,
            debugShowCheckedModeBanner: false,
            navigatorKey: Get.key,
            theme: light(),
            defaultTransition: Transition.topLevel,
            // translations: Messages(languages: languages),
            fallbackLocale: Locale(AppConstants.languages[0].languageCode,
                AppConstants.languages[0].countryCode),
            transitionDuration: const Duration(milliseconds: 500),
            getPages: AppRoutes.routes,
            initialRoute: AppRoutes.deliveryHomeScreen,
          );
        });
  }
}
