import 'package:delivery_app/views/screens/auth/forgotpassword/forgot_password_screen.dart';
import 'package:delivery_app/views/screens/auth/login/login_screen.dart';
import 'package:delivery_app/views/screens/auth/signup/sign_up_screen.dart';
import 'package:delivery_app/views/screens/auth/verifyemailaddress/verify_email_address.dart';
import 'package:delivery_app/views/screens/choosetype/choose_type_screen.dart';
import 'package:delivery_app/views/screens/client/client_history/history_screen.dart';
import 'package:delivery_app/views/screens/client/clientarticles/advanced_screen.dart';
import 'package:delivery_app/views/screens/client/clientarticles/article_details_screen.dart';
import 'package:delivery_app/views/screens/client/clientarticles/beginners_screen.dart';
import 'package:delivery_app/views/screens/client/clientarticles/client_articles_screen.dart';
import 'package:delivery_app/views/screens/client/clientarticles/tips_screen.dart';
import 'package:delivery_app/views/screens/client/clienthome/client_home_screen.dart';
import 'package:delivery_app/views/screens/client/clienthome/client_home_successfull_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../views/screens/splash/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = "/SplashScreen.dart";
  static const String chooseTypeScreen = "/ChooseTypeScreen.dart";
  static const String signUpScreen = "/SignUpScreen.dart";
  static const String verifyEmailAddressScreen = "/VerifyEmailAddressScreen.dart";
  static const String loginScreen = "/LoginScreenScreen.dart";
  static const String forgotPasswordScreen = "/ForgotPasswordScreen.dart";
  static const String clientHomeScreen = "/ClientHomeScreen.dart";
  static const String clientHomeScreenSuccessfulScreen = "/ClientHomeScreenSuccessfulScreen.dart";
  static const String clientArticleScreen = "/ClientArticleScreen.dart";
  static const String beginnersScreen = "/BeginnersScreen.dart";
  static const String advancedScreen = "/AdvancedScreen.dart";
  static const String tipsScreen = "/TipsScreen.dart";
  static const String articleDetailsScreen = "/articleDetailsScreen.dart";
  static const String historyScreen = "/HistoryScreen.dart";


  static List<GetPage> get routes => [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: chooseTypeScreen, page: () => ChooseTypeScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: verifyEmailAddressScreen, page: () => VerifyEmailAddressScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: forgotPasswordScreen, page: () => ForgotPasswordScreen()),
    GetPage(name: clientHomeScreen, page: () => ClientHomeScreen()),
    GetPage(name: clientHomeScreenSuccessfulScreen, page: () => ClientHomeScreenSuccessfulScreen()),
    GetPage(name: clientArticleScreen, page: () => ClientArticleScreen()),
    GetPage(name: beginnersScreen, page: () => BeginnersScreen()),
    GetPage(name: advancedScreen, page: () => AdvancedScreen()),
    GetPage(name: tipsScreen, page: () => TipsScreen()),
    GetPage(name: articleDetailsScreen, page: () => ArticleDetailsScreen()),
    GetPage(name: historyScreen, page: () => HistoryScreen()),
  ];
}