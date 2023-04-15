import 'package:sportbuddy/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:sportbuddy/presentation/onboarding_screen/binding/onboarding_binding.dart';
import 'package:sportbuddy/presentation/log_in_screen/log_in_screen.dart';
import 'package:sportbuddy/presentation/log_in_screen/binding/log_in_binding.dart';
import 'package:sportbuddy/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:sportbuddy/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:sportbuddy/presentation/otp_verification_screen/otp_verification_screen.dart';
import 'package:sportbuddy/presentation/otp_verification_screen/binding/otp_verification_binding.dart';
import 'package:sportbuddy/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:sportbuddy/presentation/forgot_password_screen/binding/forgot_password_binding.dart';
import 'package:get/get.dart';

import '../presentation/dashboard_container_screen/binding/dashboard_binding.dart';
import '../presentation/dashboard_container_screen/dashboard_screen.dart';
import '../presentation/update_password_screen/binding/update_password_binding.dart';
import '../presentation/update_password_screen/update_password_screen.dart';
import '../presentation/update_username/binding/update_username_binding.dart';
import '../presentation/update_username/update_username_screen.dart';

class AppRoutes {
  static const String onboardingScreen = '/onboarding_screen';

  static const String logInScreen = '/log_in_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String otpVerificationScreen = '/otp_verification_screen';

  static const String otpVerificationTwoScreen = '/otp_verification_two_screen';

  static const String updatePasswordScreen = '/update_password_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String otpVerificationOneScreen = '/otp_verification_one_screen';

  static const String updateUsernameScreen = '/update_username';

  static const String dashboardOnePage = '/dashboard_one_page';

  static const String dashboardScreen = '/dashboard_container_screen';

  static const String settingsScreen = '/settings_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: logInScreen,
      page: () => LogInScreen(),
      bindings: [
        LogInBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: otpVerificationScreen,
      page: () => OtpVerificationScreen(),
      bindings: [
        OtpVerificationBinding(),
      ],
    ),
    GetPage(
      name: updatePasswordScreen,
      page: () => UpdatePasswordScreen(),
      bindings: [
        UpdatePasswordBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: updateUsernameScreen,
      page: () => UpdateUsernameScreen(),
      bindings: [
        UpdateUsernameBinding(),
      ],
    ),
    GetPage(
      name: dashboardScreen,
      page: () => DashboardScreen(),
      bindings: [
        DashboardBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => OnboardingScreen(),
      bindings: [
        OnboardingBinding(),
      ],
    )
  ];
}
