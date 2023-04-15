import 'package:flutter/material.dart';
import 'package:sportbuddy/core/app_export.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({this.onChanged});

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgEye,
      type: BottomBarEnum.Eye,
      name: 'Discover',
    ),
    BottomMenuModel(
      icon: ImageConstant.imgUser,
      type: BottomBarEnum.User,
      name: 'Buddies',
    ),
    BottomMenuModel(
      icon: ImageConstant.imgUserTeal300,
      type: BottomBarEnum.Userteal300,
      name: 'Profile',
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSettings,
      type: BottomBarEnum.Settings,
      name: 'Settings',
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: getMargin(
          left: 1,
        ),
        decoration: BoxDecoration(
          color: ColorConstant.gray100,
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          currentIndex: selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: CustomImageView(
                svgPath: bottomMenuList[index].icon,
                height: getVerticalSize(
                  23,
                ),
                width: getHorizontalSize(
                  34,
                ),
                color: ColorConstant.black900,
              ),
              activeIcon: CustomImageView(
                svgPath: bottomMenuList[index].icon,
                height: getSize(
                  22,
                ),
                width: getSize(
                  22,
                ),
                color: Colors.blue,
              ),
              label: bottomMenuList[index].name,
            );
          }),
          onTap: (index) {
            selectedIndex.value = index;
            onChanged!(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Eye,
  User,
  Userteal300,
  Settings,
}

class BottomMenuModel {
  BottomMenuModel({required this.icon, required this.type, required this.name});

  String icon;

  String name;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nothing to show',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
