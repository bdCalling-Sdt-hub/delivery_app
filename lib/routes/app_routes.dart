import 'package:delivery_app/views/screens/choosetype/choose_type_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../views/screens/splash/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = "/SplashScreen.dart";
  static const String chooseTypeScreen = "/ChooseTypeScreen.dart";


  static List<GetPage> get routes => [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: chooseTypeScreen, page: () => ChooseTypeScreen()),
  ];
}