import 'package:delivery_app/views/screens/auth/forgotpassword/forgot_password_screen.dart';
import 'package:delivery_app/views/screens/auth/login/login_screen.dart';
import 'package:delivery_app/views/screens/auth/signup/sign_up_screen.dart';
import 'package:delivery_app/views/screens/auth/verifyemailaddress/verify_email_address.dart';
import 'package:delivery_app/views/screens/choosetype/choose_type_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../views/screens/splash/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = "/SplashScreen.dart";
  static const String chooseTypeScreen = "/ChooseTypeScreen.dart";
  static const String signUpScreen = "/SignUpScreen.dart";
  static const String verifyEmailAddressScreen = "/VerifyEmailAddressScreen.dart";
  static const String loginScreen = "/LoginScreenScreen.dart";
  static const String forgotPasswordScreen = "/ForgotPasswordScreen.dart";


  static List<GetPage> get routes => [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: chooseTypeScreen, page: () => ChooseTypeScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: verifyEmailAddressScreen, page: () => VerifyEmailAddressScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: forgotPasswordScreen, page: () => ForgotPasswordScreen()),
  ];
}