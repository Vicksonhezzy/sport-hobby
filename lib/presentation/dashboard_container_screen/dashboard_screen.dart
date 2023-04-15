import 'package:sportbuddy/presentation/profile_page/profile_page.dart';
import 'package:sportbuddy/presentation/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:sportbuddy/core/app_export.dart';
import 'package:sportbuddy/widgets/custom_bottom_bar.dart';

import 'controller/dashboard_controller.dart';

class DashboardScreen extends GetWidget<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Navigator(
                key: Get.nestedKey(1),
                // initialRoute: AppRoutes.dashboardOnePage,
                onGenerateRoute: (routeSetting) => GetPageRoute(
                    page: () => getCurrentPage(routeSetting.name!),
                    transition: Transition.noTransition)),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              Get.toNamed(getCurrentRoute(type), id: 1);
            })));
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Eye:
        return "/";
      case BottomBarEnum.User:
        return "/";
      case BottomBarEnum.Userteal300:
        return AppRoutes.dashboardOnePage;
      case BottomBarEnum.Settings:
        return AppRoutes.settingsScreen;
      default:
        return "/";
    }
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.dashboardOnePage:
        return ProfilePage();
      case AppRoutes.settingsScreen:
        return Settings();
      default:
        return DefaultWidget();
    }
  }
}
